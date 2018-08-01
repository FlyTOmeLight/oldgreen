<?php

namespace App\Http\Controllers;

use App\Exceptions\InvalidRequestException;
use App\Models\User;
use Illuminate\Http\Request;
use App\Notifications\EmailVerificationNotification;
use Mail;
use Cache;

class EmailVerificationController extends Controller
{
    public function verify(Request $request)
    {
    	//从url里取出email,token两个参数
    	$email = $request->input('email');
    	$token = $request->input('token');
    	//如果有一个为空则不合法
    	if (!$email || !$token) {
    		throw new InvalidRequestException("验证链接不正确");
    	}
		// 从缓存中读取数据，我们把从 url 中获取的 `token` 与缓存中的值做对比
        // 如果缓存不存在或者返回的值与 url 中的 `token` 不一致就抛出异常  
        if ($token != Cache::get('email_verification_'.$email)) {
        	throw new InvalidRequestException("验证链接不正确或已过期");
        } 

        if (!$user = User::where('email', $email)->first()) {
         	throw new InvalidRequestException("用户不存在");
        } 

        Cache::forget('email_verification_'.$email);
        $user->update(['email_verified' => true]);

        return view('pages.success', ['msg' => '验证邮箱成功']);
    }

    public function send(Request $request)
    {
    	$user = $request->user();
    	//判断用户是否激活
    	if ($user->email_verified) {
    		throw new InvalidRequestException("您已激活过邮箱了");
    	}
    	// $notification = new EmailVerificationNotification();
    	//调用notify()来发送通知
    	$user->notify(new EmailVerificationNotification());
    	return view('pages.success', ['msg' => '邮件发送成功']);
    }
}
