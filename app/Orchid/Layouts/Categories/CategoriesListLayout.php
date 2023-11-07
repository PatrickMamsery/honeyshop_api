<?php

namespace App\Orchid\Layouts\Categories;

use Orchid\Screen\Layouts\Table;
use Orchid\Screen\TD;
use App\Models\Category;
use Orchid\Screen\Actions\Link;

class CategoriesListLayout extends Table
{
    /**
     * Data source.
     *
     * The name of the key to fetch it from the query.
     * The results of which will be elements of the table.
     *
     * @var string
     */
    protected $target = 'categories';

    /**
     * Get the table cells to be displayed.
     *
     * @return TD[]
     */
    protected function columns(): array
    {
        return [
            TD:: make('name','Name')
                ->render(function(Category $category){
                    return Link::make($category->name)
                    ->route('platform.categories.edit',$category);
                }),
            
            TD::make('description','Description')
                ->render(function(Category $category){
                    return $category->description;
                })
             ];
    }
}
