<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Page;
use Illuminate\Http\Request;

class PagesController extends Controller
{
    public function index()
    {
       $pages = Page::all()->sortBy('order');
        return $pages;
    }

    public function show($id)
    {
        return Page::findOrFail($id);
    }
}
