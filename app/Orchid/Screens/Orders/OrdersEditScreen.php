<?php

namespace App\Orchid\Screens\Orders;

use App\Models\Order;
use Illuminate\Http\Request;
use Orchid\Screen\Actions\Button;
use Orchid\Screen\Fields\Group;
use Orchid\Screen\Fields\Input;
use Orchid\Screen\Screen;
use Orchid\Support\Facades\Alert;
use Orchid\Support\Facades\Layout;

class OrdersEditScreen extends Screen
{
    /**
     * Display header name.
     *
     * @var string
     */
    public $exists = false;
    public $name = 'Create Order';
    public $description = 'Create Order';

    /**
     * Query data.
     *
     * @return array
     */
    public function query(Order $order): array
    {
        $this->exists = $order->exists;
        if($this->exists) $this->description='Update Order';
        return [
            'order' => $order
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
        Button::make('Create')
            ->icon('note')
            ->method('createOrUpdate')
            ->canSee(!$this->exists),

        Button::make('Update')
            ->icon('pencil')
            ->method('createOrUpdate')
            ->canSee($this->exists),

        Button::make('Delete')
            ->icon('trash')
            ->method('delete')
            ->canSee($this->exists),
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
            Layout::rows([
                Group::make([
                    Input::make('order.name')
                        ->title('Name')
                        ->required()
                        ->placeholder('Enter your name'),
    
                    Input::make('order.quantity')
                        ->title('Quantity')
                        ->required()
                        ->placeholder('Enter Order quantity'),
                ]),

                Group::make([
                    Input::make('order.amount')
                        ->title('Amount')
                        ->required()
                        ->placeholder('Enter Order amount'),
        
                        ]),
            ])
        ];
    }

    public function createOrUpdate(Order $order, Request $request )
    {
        $order->fill($request->get('order'))->save();

        Alert::info('Order is created successfully');

        return redirect()->route('platform.orders');
    }


    public function delete(Order $order)
    {
        $order->delete();

        Alert::info('You have successfully deleted an order.');

        return redirect()->route('platform.orders');
    }
}
