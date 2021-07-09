<?php

use App\Http\Controllers\Api\PagesController;
use App\Models\Page;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

// Route::get('pages', 'Api\PagesController@index');
Route::resource('pages', PagesController::class)->only(['index', 'show']);

// Route::get('pages', function(Request $request) {
//     return Page::all();
// });