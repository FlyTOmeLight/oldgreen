<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\CartItem;
use App\Http\Requests\AddCartRequest;
use App\Models\ProductSku;
use App\Services\CartService;

class CartController extends Controller
{	

    protected $cartService;

    public function __construct(CartService $cartService)
    {
        $this->cartService = $cartService;
    }

	/**
	 * 查看购物车列表
	 * @param  Request $request [description]
	 * @return [type]           [description]
	 */
	public function index(Request $request)
	{
		// $cartItems = $request->user()->cartItems()->with(['productSku.product'])->get();
        $cartItems = $this->cartService->get(); 
        $addresses = $request->user()->addresses()->orderBy('last_used_at','desc')->get();
		return view('cart.index', ['cartItems' => $cartItems, 'addresses' => $addresses]);
	}

	/**
	 * 加入购物车
	 * @param AddCartRequest $request [description]
	 */
    public function add(AddCartRequest $request)
    {
    	// $user = $request->user();
    	// $skuId = $request->input('sku_id');
    	// $amount = $request->input('amount');

    	// //从数据库里查看该商品是否在购物车中
    	// if ($cart = $user->cartItems()->where('product_sku_id', $skuId)->first()){
    	// 	//如果存在，叠加商品
    	// 	$cart->update([
    	// 		'amount' => $cart->amount + $amount,
    	// 	]);
    	// } else {
    	// 	//如果不存在，新建一个购物车记录
    	// 	$cart = new CartItem(['amount' => $amount]);
    	// 	$cart->user()->associate($user);
    	// 	$cart->productSku()->associate($skuId);
    	// 	$cart->save();
    	// }

        $this->cartService->add($request->input('sku_id'), $request->input('amount'));

    	return [];

    }

    /**
     * 移除购物车
     * @param  ProductSku $sku     [description]
     * @param  Request    $request [description]
     * @return [type]              [description]
     */
    public function remove(ProductSku $sku, Request $request)
    {
    	// $request->user()->cartItems()->where('product_sku_id', $sku->id)->delete();
    	
        $this->cartService->remove($sku->id);

        return [];
    }
}
