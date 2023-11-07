<?php

namespace App\Orchid\Layouts\Projects;

use App\Models\Project;
use Orchid\Screen\Actions\Link;
use Orchid\Screen\Layouts\Table;
use Orchid\Screen\TD;

class ProjectsListLayout extends Table
{
    /**
     * Data source.
     *
     * The name of the key to fetch it from the query.
     * The results of which will be elements of the table.
     *
     * @var string
     */
    protected $target = 'projects';

    /**
     * Get the table cells to be displayed.
     *
     * @return TD[]
     */
    protected function columns(): array
    {
        return [
            TD::make('name','Name')
                ->render(function(Project $project){
                    return Link::make($project->name)
                    ->route('platform.projects.edit',$project);
                }),

            TD::make('description','Description')
                ->render(function(Project $project){
                    return $project->description;
                }),

            TD::make('price','Price')
                ->render(function(Project $project){
                    return $project->price;
                }),
        ];
    }
}
