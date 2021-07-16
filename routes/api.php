<?php

use App\Http\Controllers\Api\ImagesUploadController;
use App\Http\Controllers\Api\PagesController;
use App\Http\Controllers\Api\SiteController;
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

Route::resource('pages', PagesController::class)->only(['index', 'show', 'update']);

Route::post('/upload', [ImagesUploadController::class, 'store'])->name('upload.store');
Route::delete('/upload/{id}', [ImagesUploadController::class, 'delete'])->name('upload.delete');

Route::get('/site', [SiteController::class, 'index'])->name('site.index');
Route::post('/site', [SiteController::class, 'store'])->name('site.store');
