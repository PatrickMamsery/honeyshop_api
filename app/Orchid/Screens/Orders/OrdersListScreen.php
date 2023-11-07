<?php

namespace App\Orchid\Screens\Orders;

use App\Models\Order;
use App\Orchid\Layouts\Orders\OrderssListLayout;
use Orchid\Screen\Actions\Link;
use Orchid\Screen\Screen;

class OrdersListScreen extends Screen
{
    /**
     * Display header name.
     *
     * @var string
     */
    public $name = 'Orders';
    public $description = 'List of Orders';

    /**
     * Query data.
     *
     * @return array
     */
    public function query(): array
    {
        return [
            'orders' => Order::paginate()
        ];
    }

    /**
     * Button commands.
     *
     * @return \Orchid\Screen\Action[]
     */
    public function commandBar(): array
    {
        return [
            // Link::make('Create new order')
            //     ->icon('pencil')
            //     ->route('platform.orders.edit',null)
        ];
    }

    /**
     * Views.
     *
     * @return \Orchid\Screen\Layout[]|string[]
     */
    public function layout(): array
    {
        return [
            OrderssListLayout::class
        ];
    }
}
