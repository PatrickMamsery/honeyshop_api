<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\OrderResouce;
use App\Models\Order;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class OrderController extends BaseController
{
    function create(Request $request ){
        $validator = Validator::make($request->all(),[
            'name' => 'required|string|max:255',
            'amount' => 'required|integer',
            'quantity' => 'required|integer',
        ]);
        if($validator->fails()){
            return $validator->errors();
        }

        $order = new Order();
        $order->name = $request->name;
        $order->amount = $request->amount;
        $order->quantity = $request->quantity;
        $order->project_id = $request->project_id;

        $order->save();
        if($order->save()){
            return $this->sendResponse(OrderResouce::make($order),"SUCCESSFUL REQUEST");
        }else{
            return $this->sendError('Order was not created',['error message 1','error message 2']);
        }
    }
}
