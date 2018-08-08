<?php

use Illuminate\Database\Seeder;

class ProductsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //创建30个商品
        $products = factory(\App\Models\Product::class, 30)->create();
        foreach ($products as $product) {
        	$skus = factory(\App\Models\ProductSku::class, 4)->create(['product_id' => $product->id]);
        	$product->update(['price' => $skus->min('price')]);
        }
    }
}
