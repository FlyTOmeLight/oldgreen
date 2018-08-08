<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Exceptions\InvalidRequestException;

class ProductsController extends Controller
{	
	/**
	 * 首页商品列表
	 * @param  Request $request [description]
	 * @return [type]           [description]
	 */
    public function index(Request $request)
    {	
    	//加入搜索和排序
    	$builder = Product::query()->where('on_sale', true);
    	//模糊搜索
    	if ($search = $request->input('search', '')) {
    		$like = '%'.$search.'%';
    		$builder->where(function ($query) use ($like) {
    			$query->where('title', 'like', $like)
    				->orWhere('description', 'like', $like)
    				->orWhereHas('skus', function ($query) use ($like) {
    					$query->where('title', 'like', $like)
    				        ->orWhere('description', 'like', $like);
    				});
    		});
    	}
    	//排序
    	if ($order = $request->input('order', '')) {
    		if (preg_match('/^(.+)_(asc|desc)$/', $order, $m)) {
    			if (in_array($m[1], ['price', 'sold_count', 'rating'])) {
    				$builder->orderBy($m[1], $m[2]);
    			}
    		}
    	}

    	$products = $builder->paginate(16);

    	return view('products.index', [
    		'products' => $products,
    		'filters' => [
    			'search' => $search, 
    			'order' => $order
    		],
    	]);
    }

    /**
     * 商品详情
     * @param  Product $product [description]
     * @param  Request $request [description]
     * @return [type]           [description]
     */
    public function show(Product $product, Request $request)
    {
    	if (!$product->on_sale) {
    		throw new InvalidRequestException('商品未上架');
    	}
    	$favored = false;
    	if ($user = $request->user()) {
    		$favored = boolval($user->favoriteProducts()->find($product->id));
    	}
    	return view('products.show', ['product' => $product, 'favored' => $favored]);
    }

    /**
     * 收藏列表
     * @param  Request $request [description]
     * @return [type]           [description]
     */
    public function favorites(Request $request)
    {
    	$products = $request->user()->favoriteProducts()->paginate(16);
    	return view('products.favorites', ['products' => $products]);
    }

    /**
     * 收藏
     * @param  Product $product [description]
     * @param  Request $request [description]
     * @return [type]           [description]
     */
    public function favor(Product $product, Request $request)
    {
    	$user = $request->user();
    	if ($user->favoriteProducts()->find($product->id)) {
    		return [];
    	}
    	$user->favoriteProducts()->attach($product);
    	return [];
    }

    /**
     * 取消收藏
     * @param  Product $product [description]
     * @param  Request $request [description]
     * @return [type]           [description]
     */
    public function disfavor(Product $product, Request $request)
    {
    	$user = $request->user();
    	$user->favoriteProducts()->detach($product);
    	return [];
    }
}
