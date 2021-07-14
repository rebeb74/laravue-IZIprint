<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class SiteController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = [
            "title" => $request->title,
            "description" => $request->description,
            "suffix" => $request->suffix
        ];
        Storage::disk('public')->put('seo.json', json_encode($data));

        return $data;

    }

    public function index(Request $request)
    {
        return Storage::disk('public')->get('seo.json');
    }
}
