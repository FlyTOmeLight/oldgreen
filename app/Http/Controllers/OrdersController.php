<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Http\Requests\OrderRequest;
use App\Http\Requests\SendReviewRequest;
use App\Models\Order;
use App\Models\UserAddress;
use App\Services\OrderService;
use App\Exceptions\InvalidRequestException;

class OrdersController extends Controller
{	

	/**
	 * 订单详情
	 * @param  Order   $order   [description]
	 * @param  Request $request [description]
	 * @return [type]           [description]
	 */
	public function show(Order $order, Request $request)
	{
		$this->authorize('own', $order);
		return view('orders.show', ['order' => $order->load(['items.productSku', 'items.product'])]);
	}

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
    public function store(OrderRequest $request, OrderService $orderService)
    {	

    	$user = $request->user();
    	$address = UserAddress::find($request->input('address_id'));
    	return $orderService->store($user, $address, $request->input('remark'), $request->input('items'));
    	// //开启一个数据库事务
    	// $order = \DB::transaction(function() use ($user, $request, $cartService) {
    	// 	$address = UserAddress::find($request->input('address_id'));
    	// 	//更新此地址最后使用时间
    	// 	$address->update(['last_used_at' => Carbon::now()]);
    	// 	//创建新订单
    	// 	$order = new Order([
    	// 		'address' => [
    	// 			'address' => $address->full_address,
    	// 			'zip' => $address->zip,
    	// 			'contact_name' => $address->contact_name,
    	// 			'contact_phone' => $address->contact_phone,
    	// 		],
    	// 		'remark' => $request->input('remark'),
    	// 		'total_amount' => 0,
    	// 	]);
    	// 	//订单关联当前用户
    	// 	$order->user()->associate($user);
    	// 	//写入数据库
    	// 	$order->save();
    	// 	$totalAmount = 0;
    	// 	$items = $request->input('items');
    	// 	foreach ($items as $item) {
    	// 		$sku = ProductSku::find($item['sku_id']);
    	// 		//创建一个orderItem使之与订单order关联
    	// 		$orderItem = $order->items()->make([
    	// 			'amount' => $item['amount'],
    	// 			'price' => $sku->price,
     // 			]);
     // 			$orderItem->product()->associate($sku->product_id);
     // 			$orderItem->productSku()->associate($sku);
     // 			$orderItem->save();
     // 			$totalAmount += $sku->price * $item['amount'];
     // 			if ($sku->decreaseStock($item['amount']) <= 0) {
     // 				throw new InvalidRequestException('该商品库存不足');
     // 			}
    	// 	}
    	// 	//更新订单总额
    	// 	$order->update(['total_amount' => $totalAmount]);
    	// 	//将下单商品在购物车中移除
    	// 	$skuIds = collect($request->input('items'))->pluck('sku_id');
    	// 	// $user->cartItems()->whereIn('product_sku_id', $skuIds)->delete();
    	// 	$cartService->remove($skuIds);

    	// 	return $order;
    	// });

    	// $this->dispatch(new CloseOrder($order, config('app.order_ttl')));

    	// return $order;
    }

    /**
     * 用户确认收货
     * @param  Order   $order   [description]
     * @param  Request $request [description]
     * @return [type]           [description]
     */
    public function received(Order $order, Request $request)
    {
        //校验权限
        $this->authorize('own', $order);
        //判断订单状态
        if ($order->ship_status !== Order::SHIP_STATUS_DELIVERED) {
            throw new InvalidRequestException('发货状态不正确');
        }
        $order->update([
            'ship_status' => Order::SHIP_STATUS_RECEIVED,
        ]);

        return $order;
    }

    /**
     * 跳转评价页面
     * @param  Order  $order [description]
     * @return [type]        [description]
     */
    public function review(Order $order)
    {
        $this->authorize('own', $order);

        if (!$order->paid_at) {
            throw new InvalidRequestException('该订单未支付，不可评价');
        }

        return view('orders.review', ['order' => $order->load(['items.product', 'items.productSku'])]);
    }

    public function sendReview(Order $order, SendReviewRequest $request)
    {
        $this->authorize('own', $order);

        if (!$order->paid_at) {
            throw new InvalidRequestException('该订单未支付，不可评价');
        }

        if ($order->reviewed) {
            throw new InvalidRequestException('该订单已评价，不可重复提交');
        }

        $reviews = $request->input('reviews');

        // 开启事务
        \DB::transaction(function () use ($reviews, $order) {
            foreach ($reviews as $review) {
                $orderItem = $order->items()->find($reviews['id']);
                $orderItem->update([
                    'rating'      => $review['rating'],
                    'review'      => $review['review'],
                    'reviewed_at' => Carbon::now(),
                ]);
            }
            $order->update(['reviewed' => true]);
        });

        return redirect()->back();
    }
    
}
