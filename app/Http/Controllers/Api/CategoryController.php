<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\CategoriesResouce;
use App\Http\Resources\CategoryResouce;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CategoryController extends BaseController
{
    public function index()
    {
        $categories = Category::all();
        return $this->sendResponse(CategoriesResouce::collection($categories), "SUCCESSFUL REQUEST");
    }

    function create(Request $request)
    {

        //data validation
        $validator = Validator::make($request->all(), [
            'name' => 'required|string',
        ]);

        if ($validator->fails()) {
            return $validator->errors();
        }
        $category = new Category();
        $category->name = $request->name;
        $category->description = $request->description;
        $category->path = "whatever path";

        $category->save();

        if ($category->save()) {
            return $category;
        } else {
            return "Failed";
        }
    }
}


