<?php

use App\Http\Controllers\GameController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::group(['middleware' => 'auth:sanctum'], function () {

    Route::get('/user', function (Request $request) {
        return $request->user();
    });

    Route::group(['prefix' => 'game'], function () {
        Route::post('/', [GameController::class, 'create']);
        Route::post('{id}/solve', [GameController::class, 'checkSolveGame']);
        Route::get('last', [GameController::class, 'lastGame']);
    });
});
