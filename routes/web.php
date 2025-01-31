<?php

use App\Http\Controllers\AuthController;
use Illuminate\Support\Facades\Route;

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

Route::post('/login', [AuthController::class, 'authenticate']);
Route::post('/register', [AuthController::class, 'register']);
Route::get('{any}', function () {
    return view('entry-point');
})->where('any', '.*');
