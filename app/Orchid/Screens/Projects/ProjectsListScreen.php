<?php

namespace App\Orchid\Screens\Projects;

use App\Models\Project;
use App\Orchid\Layouts\Projects\ProjectsListLayout;
use Orchid\Screen\Actions\Link;
use Orchid\Screen\Screen;

class ProjectsListScreen extends Screen
{
    /**
     * Display header name.
     *
     * @var string
     */
    public $name = 'Projects';
    public $description = 'List of Projects';

    /**
     * Query data.
     *
     * @return array
     */
    public function query(): array
    {
        return [
            'projects' => Project::paginate()
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
            Link::make('Create new prject')
                ->icon('pencil')
                ->route('platform.projects.edit',null)
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
            ProjectsListLayout::class
        ];
    }
}
