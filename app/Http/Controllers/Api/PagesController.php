<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\PagesIndexResource;
use App\Http\Resources\PagesShowResource;
use App\Models\Page;
use Illuminate\Http\Request;


class PagesController extends Controller
{
    public function index()
    {
        return PagesIndexResource::collection(Page::all());
    }

    public function show($id)
    {
        return new PagesShowResource(Page::findOrFail($id));
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

        return new PagesShowResource(Page::findOrFail($id));
    }
}
