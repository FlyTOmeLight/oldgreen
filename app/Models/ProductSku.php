<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Exceptions\InternalException;

class ProductSku extends Model
{
    protected $fillable = [
        'title',
        'description',
        'price',
        'stock',
    ];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    /**
     * 减库存
     * @param  [type] $amount [description]
     * @return [type]         [description]
     */
    public function decreaseStock($amount)
    {
        if ($amount < 0) {
            throw new InternalException('减库存不可小于0');
        }

        return $this->newQuery()->where('id', $this->id)->where('stock', '>=', $amount)->decrement('stock', $amount);
    }

    /**
     * 加库存
     * @param [type] $amount [description]
     */
    public function addStock($amount)
    {   
         if ($amount < 0) {
            throw new InternalException('加库存不可小于0');
        }

        return $this->increment('stock', $amount);
    }
}
