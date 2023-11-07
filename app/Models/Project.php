<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    use HasFactory;
    protected $fillable =[
        'name',
        'description',
        'path',
        'price',
        'rating',
        'weight',
        'organic',
        'local_bee_keeper'
    ];
}
