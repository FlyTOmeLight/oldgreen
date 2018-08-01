<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class UserAddressController extends Controller
{
    public function Index(Request $request)
    {
//        print_r($request->user()->addresses);die();
        return view('user_addresses.index', [
            'addresses' => $request->user()->addresses
        ]);
    }
}
