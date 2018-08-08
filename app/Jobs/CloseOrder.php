<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use App\Models\Order;

class CloseOrder implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $order;
    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct(Order $order, $delay)
    {
        $this->order = $order;
        //设置延迟时间,delay()方法参数代表多少秒后执行
        $this->delay($delay);
    }

    /**
     * 定义这个任务的执行逻辑
     * 当队列处理器从队列中取出任务时，会调用handle()方法
     * @return void
     */
    public function handle()
    {
        //判断订单是否支付
        if ($this->order->paid_at) {
            return;
        }
        // 使用事务处理这件事
        \DB::transaction(function () {
            //将订单的close字段标记为true
            $this->order->update(['closed' => true]);
            //循环遍历items中的商品SKU,将库存加回去
            foreach ($this->order->items as $item) {
                $item->productSku->addStock($item->amount);
            }
        });
    }
}
