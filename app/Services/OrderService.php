<?php
namespace App\Services;

use App\Models\User;
use App\Models\UserAddress;
use App\Models\ProductSku;
use App\Models\Order;
use App\Exceptions\InvalidRequestException;
use App\Jobs\CloseOrder;
use Carbon\Carbon;

class OrderService
{
	public function store(User $user, UserAddress $address, $remark, $items)
	{
		$order = \DB::transaction(function () use ($user, $address, $remark, $items) {
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
    			'remark' => $remark,
    			'total_amount' => 0,
    		]);
    		//订单关联当前用户
    		$order->user()->associate($user);
    		//写入数据库
    		$order->save();
    		$totalAmount = 0;
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
    		$skuIds = collect($items)->pluck('sku_id');
    		app(CartService::class)->remove($skuIds);

    		return $order;
		});

		dispatch(new CloseOrder($order, config('app.order_ttl')));

		return $order;
	}
}