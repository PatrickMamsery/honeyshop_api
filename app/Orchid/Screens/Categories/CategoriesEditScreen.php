<?php

namespace App\Orchid\Screens\Categories;

use Orchid\Screen\Screen;
use App\Models\Category;
use Orchid\Screen\Actions\Button;
use Illuminate\Http\Request;
use Orchid\Support\Facades\Alert;
use Orchid\Screen\Fields\Group;
use Orchid\Screen\Fields\Input;
use Orchid\Screen\Fields\Picture;
use Orchid\Screen\Fields\TextArea;
use Orchid\Support\Facades\Layout;

class CategoriesEditScreen extends Screen
{
    /**
     * Display header name.
     *
     * @var string
     */
    public $exists = false;
    public $name = 'Create Category';
    public $ndescription = 'Create Category';

    /**
     * Query data.
     *
     * @return array
     */
    public function query(Category $category): array
    {
            $this->exists = $category->exists;

            if($this->exists) $this->description='Update Category';
            return [
                    'category' => $category
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
                    Input::make('category.name')
                        ->title('Name')
                        ->required()
                        ->placeholder('Enter category name'),

                    TextArea::make('category.description')
                            ->title('Description')
                            ->required()
                            ->placeholder('Enter description here'),

                    Picture::make('category.path')
                            ->title('Image')
                            ->targetUrl()
                            ->required(),
                ])
        ];
    }

    public function createOrUpdate(Category $category, Request $request )
    {
        $category->fill($request->get('category'))->save();

        Alert::info('Category is created successfully');

        return redirect()->route('platform.categories');
    }


    public function delete(Category $category)
    {
        $category->delete();

        Alert::info('You have successfully deleted a category.');

        return redirect()->route('platform.categories');
    }
}
