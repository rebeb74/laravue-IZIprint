<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Storage;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Auth::routes();

Route::middleware('auth')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/{any?}', function () {
    $seo = Storage::disk('local')->get('seo.json');
    return view('welcome')->with('seo', json_decode($seo, true));
})->where('any', '^(?!api\/)[\/\w\.-]*');

// Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
