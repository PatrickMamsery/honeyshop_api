<?php

namespace App\Orchid\Screens\Projects;

use App\Models\Project;
use Illuminate\Http\Request;
use Orchid\Screen\Screen;
use Orchid\Screen\Actions\Button;
use Orchid\Screen\Fields\Group;
use Orchid\Screen\Fields\Input;
use Orchid\Screen\Fields\Select;
use Orchid\Screen\Fields\TextArea;
use Orchid\Support\Facades\Alert;
use Orchid\Support\Facades\Layout;
use Orchid\Screen\Fields\Picture;

class ProjectsEditScreen extends Screen
{
    /**
     * Display header name.
     *
     * @var string
     
     */
    public $exists = false;
    public $name = 'Create Project';
    public $description = 'Create Project';

    /**
     * Query data.
     *
     * @return array
     */
    public function query(Project $project): array
    {
        $this->exists = $project->exists;
        if($this->exists) $this->description = 'Update Project';
        return [ 
            'project' => $project
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
                    Input::make('project.name')
                        ->title('Name')
                        ->required()
                        ->placeholder('Enter Project name'),

                    Input::make('project.price')
                        ->title('Price')
                        ->required()
                        ->placeholder('Enter Project price'),
                ]),

                Group::make([
                    Input::make('project.rating')
                        ->title('Rating')
                        ->required()
                        ->placeholder('Enter Project rating'),

                    Input::make('project.weight')
                        ->title('Weight')
                        ->required()
                        ->placeholder('Enter Project weight'),
                ]),

                Group::make([
                    Select::make('project.organic')
                        ->options([
                                'Yes' => 'Yes',
                                'No' => 'No',
                            ])
                        ->title('Select organic'),

                    Select::make('project.local_bee_keeper')
                        ->options([
                                'Yes' => 'Yes',
                                'No' => 'No',
                            ])
                        ->title('Select local bee keeper'),
                ]),

                TextArea::make('project.description')
                        ->title('Description')
                        ->required()
                        ->placeholder('Enter description here'),

                Picture::make('project.path')
                        ->title('Image')
                        ->targetUrl()
                        ->required(),


            ])
        ];
    }

    public function createOrUpdate(Project $project, Request $request )
    {
        $project->fill($request->get('project'))->save();

        Alert::info('Project is created successfully');

        return redirect()->route('platform.projects');
    }


    public function delete(Project $project)
    {
        $project->delete();

        Alert::info('You have successfully deleted a project.');

        return redirect()->route('platform.projects');
    }
}
