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

    public function update(Request $request, $id)
    {
        $page = Page::findOrFail($id);
        $page->key = $request->key;
        $page->name = $request->name;
        $page->title = $request->title;
        $page->description = $request->description;
        $page->order = $request->order;
        $page->save();

        return Page::findOrFail($id);
    }
}
