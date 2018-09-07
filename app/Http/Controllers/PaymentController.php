<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Order;
use App\Exceptions\InvalidRequestException;
use Carbon\Carbon;
use Endroid\QrCode\QrCode;
use App\Events\OrderPaid;

class PaymentController extends Controller
{	
	/**
	 * 支付宝支付
	 * @param  Order   $order   [description]
	 * @param  Request $request [description]
	 * @return [type]           [description]
	 */
    public function payByAlipay(Order $order, Request $request) 
    {
    	//先判断订单是否属于当前用户
    	$this->authorize('own', $order);
    	if ($order->paid_at || $order->closed) {
    		throw new InvalidRequestException('订单状态不正确');
    	}

    	//调用支付宝网页支付
    	return app('alipay')->web([
    		'out_trade_no' => $order->no, 
    		'total_amount' => $order->total_amount, 
    		'subject' => '支付oldgreen的订单'.$order->no,
     	]);
    }

    /**
     * 微信支付
     * @param  Order   $order   [description]
     * @param  Request $request [description]
     * @return [type]           [description]
     */
    public function payByWechat(Order $order, Request $request) 
    {
    	//先判断订单是否属于当前用户
    	$this->authorize('own', $order);
    	if ($order->paid_at || $order->closed) {
    		throw new InvalidRequestException('订单状态不正确');
    	}

    	//调用微信扫码支付
    	$wechatOrder = app('wechat_pay')->scan([
    		'out_trade_no' => $order->no, 
    		'total_amount' => $order->total_amount * 100, 
    		'subject' => '支付oldgreen的订单'.$order->no,
     	]);

    	$qrCode = new QrCode($wechatOrder->code_url);

    	return response($qrCode->writeString(), 200, ['Content-Type' => $qrCode->getContentType()]);
    }

    //前端回调页面
    public function alipayReturn()
    {	
    	// 校验提交的参数是否合法
    	try {
    		app('alipay')->verify();
    	} catch (\Exception $e) {
    		return view('pages.error', ['msg' => '数据不正确']);
    	}
    	
    	return view('pages.success', ['msg' => '付款成功']);
    }

    //支付宝服务器回调
    public function alipayNotify()
    {	
    	// 校验提交的参数是否合法
    	$data = app('alipay')->verify();
    	$order = Order::where('no', $data->out_trade_no)->first();
    	if (!$order) {
    		return 'fail';
    	}
    	if ($order->paid_at) {
    		return app('alipay')->success();
    	}
    	
    	$order->update([
    		'paid_at' => Carbon::now(),
    		'payment_method' => 'alipay',
    		'payment_no' => $data->trade_no,
    	]);

    	$this->afterPaid($order);

    	return app('alipay')->success();
    }

     //微信服务器回调
    public function wechatNotify()
    {	
    	// 校验提交的参数是否合法
    	$data = app('wechat_pay')->verify();
    	$order = Order::where('no', $data->out_trade_no)->first();
    	if (!$order) {
    		return 'fail';
    	}
    	if ($order->paid_at) {
    		return app('wechat_pay')->success();
    	}
    	
    	$order->update([
    		'paid_at' => Carbon::now(),
    		'payment_method' => 'wechat_pay',
    		'payment_no' => $data->trade_no,
    	]);

    	$this->afterPaid($order);

    	return app('wechat_pay')->success();
    }

    protected function afterPaid(Order $order)
    {
    	event(new OrderPaid($order));
    }
}
