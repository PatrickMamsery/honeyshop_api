<?php

namespace App\Orchid\Screens\Categories;

use Orchid\Screen\Screen;
use App\Models\Category;
use App\Orchid\Layouts\Categories\CategoriesListLayout;
use Orchid\Screen\Actions\Link;

class CategoriesListScreen extends Screen
{
    /**
     * Display header name.
     *
     * @var string
     */
    public $name = 'Categories';
    public $description = 'List of Categories';

    /**
     * Query data.
     *
     * @return array
     */
    public function query(): array
    {
        return [
            'categories' => Category::paginate()
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
            Link::make('Create new category')
                ->icon('pencil')
                ->route('platform.categories.edit',null)
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
            CategoriesListLayout::class
        ];
    }
}
