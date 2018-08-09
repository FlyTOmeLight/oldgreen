<?php

namespace App\Services;

use Auth;
use App\Models\CartItem;

Class CartService
{
	public function get()
	{
		return Auth::user()->cartItems()->with(['productSku.product'])->get();
	}

	public function add($skuId, $amount)
	{
		$user = Auth::user();
		//从数据库查询该商品是否在购物车中
		if ($item = $user->cartItems()->where('product_sku_id', $skuId)->first()) {
			//如果存在直接叠加商品数量
			$item->update([
				'amount' => $item->amount + $amount,
			]);
		} else {
			//否则创建一个新的购物车记录
			$item = new CartItem(['amount' => $amount]);
			$item->user()->associate($user);
			$item->productSku()->associate($skuId);
			$item->save();
		}
	}

	public function remove($skuIds)
	{
		//可以传单个id也可以传数组
		if (!is_array($skuIds)) {
			$skuIds = [$skuIds];
		}

		Auth::user()->cartItems()->whereIn('product_sku_id', $skuIds)->delete();
	}
}