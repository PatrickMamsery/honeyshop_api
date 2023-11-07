<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\ProjectResouce;
use App\Http\Resources\ProjectsResouce;
use App\Models\Project;
use Faker\Provider\Base;
use Illuminate\Http\Request;

class ProjectController extends BaseController
{
    function index(){

        $project = Project::all();
        return $this->sendResponse(ProjectsResouce::collection($project),"SUCCESSFUL REQUEST");
    }

    function show($id){

        $project = Project::find($id);
        return $this->sendResponse(ProjectResouce::make($project),"SUCCESSFUL REQUEST");
    }
}
