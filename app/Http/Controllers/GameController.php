<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateGameRequest;
use App\Models\Game;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

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

    public function checkSolveGame(Request $request, $hash)
    {
        if ($request->numbers) {
            if ($request->save && $request->timer && $request->hash) {

                $game = Game::whereHash($hash)->firstOrCreate([
                    'user_id' => Auth::id()
                ]);
                $game->numbers = json_encode($request->numbers);
                $game->timer = request('timer');
                $game->hash = request('hash');
                $game->save();
            }

            if ($request->numbers === Game::COMPLETED_ARR) {
                return true;
            }
        }
        return false;
    }

}
