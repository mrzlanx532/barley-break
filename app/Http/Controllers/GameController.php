<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateGameRequest;
use App\Models\Game;

class GameController extends Controller
{
    public function create(CreateGameRequest $request, Game $game)
    {
        if ($request->validated()){
            return $game->getInstance();
        }
    }

    public function lastGame(Game $game)
    {
        return $game->getLastGame();
    }

    public function checkSolveGame(Game $game)
    {
        return $game->checkSolveGame();
    }

}
