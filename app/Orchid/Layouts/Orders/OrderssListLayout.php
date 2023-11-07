<?php

namespace App\Orchid\Layouts\Orders;

use App\Models\Order;
use App\Orchid\Screens\Orders\OrdersListScreen;
use Orchid\Screen\Actions\Link;
use Orchid\Screen\Layouts\Table;
use Orchid\Screen\TD;

class OrderssListLayout extends Table
{
    /**
     * Data source.
     *
     * The name of the key to fetch it from the query.
     * The results of which will be elements of the table.
     *
     * @var string
     */
    protected $target = 'orders';

    /**
     * Get the table cells to be displayed.
     *
     * @return TD[]
     */
    protected function columns(): array
    {
        return [
            TD:: make('name','Name')
                ->render(function(Order $order){
                    return Link::make($order->name)
                    ->route('platform.orders.edit',$order);
                }),
            
            TD::make('amount','Amount')
                ->render(function(Order $order){
                    return $order->amount;
                }),

            TD::make('quantity','Quantity')
                ->render(function(Order $order){
                    return $order->quantity;
                }),

            TD::make('project_id','Project')
                ->render(function(Order $order){
                    return $order->project->name;
                })
        ];
    }
}
