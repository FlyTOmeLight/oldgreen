<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\OrderRequest;
use App\Models\ProductSku;
use App\Models\Order;
use App\Models\UserAddress;
use Carbon\Carbon;
use App\Exceptions\InvalidRequestException;
use App\Jobs\CloseOrder;

class OrdersController extends Controller
{	
	/**
	 * 订单列表
	 * @param  Request $request [description]
	 * @return [type]           [description]
	 */
	public function index(Request $request)
	{
		$orders = Order::query()
				->with('items.product', 'items.productSku')
				->where('user_id', $request->user()->id)
				->orderBy('created_at', 'desc')
				->paginate();

		return view('orders.index', ['orders' => $orders]);
	}
	/**
	 * 提交订单
	 * @param  OrderRequest $request [description]
	 * @return [type]                [description]
	 */
    public function store(OrderRequest $request)
    {
    	$user = $request->user();
    	//开启一个数据库事务
    	$order = \DB::transaction(function() use ($user, $request) {
    		$address = UserAddress::find($request->input('address_id'));
    		//更新此地址最后使用时间
    		$address->update(['last_used_at' => Carbon::now()]);
    		//创建新订单
    		$order = new Order([
    			'address' => [
    				'address' => $address->full_address,
    				'zip' => $address->zip,
    				'contact_name' => $address->contact_name,
    				'contact_phone' => $address->contact_phone,
    			],
    			'remark' => $request->input('remark'),
    			'total_amount' => 0,
    		]);
    		//订单关联当前用户
    		$order->user()->associate($user);
    		//写入数据库
    		$order->save();
    		$totalAmount = 0;
    		$items = $request->input('items');
    		foreach ($items as $item) {
    			$sku = ProductSku::find($item['sku_id']);
    			//创建一个orderItem使之与订单order关联
    			$orderItem = $order->items()->make([
    				'amount' => $item['amount'],
    				'price' => $sku->price,
     			]);
     			$orderItem->product()->associate($sku->product_id);
     			$orderItem->productSku()->associate($sku);
     			$orderItem->save();
     			$totalAmount += $sku->price * $item['amount'];
     			if ($sku->decreaseStock($item['amount']) <= 0) {
     				throw new InvalidRequestException('该商品库存不足');
     			}
    		}
    		//更新订单总额
    		$order->update(['total_amount' => $totalAmount]);
    		//将下单商品在购物车中移除
    		$skuIds = collect($request->input('items'))->pluck('sku_id');
    		$user->cartItems()->whereIn('product_sku_id', $skuIds)->delete();

    		return $order;
    	});

    	$this->dispatch(new CloseOrder($order, config('app.order_ttl')));

    	return $order;
    }
}
