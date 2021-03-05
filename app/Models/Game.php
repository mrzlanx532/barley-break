<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;

class Game extends Model
{
    const COMPLETED_ARR = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 0];

    private $initNumbers;

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public static function getGame($hash)
    {
        $game = Game::query()->where('hash', '=', $hash)->first();
        if ($game){
            return $game;
        }else{
            return new Game();
        }
    }

    public function getInstance()
    {
        $instance = new self;
        if ($instance->generateShuffleNumbers()){
            return [
                'numbers' => $instance->initNumbers,
                'hash' => $instance->generateHash()
            ];
        }else{
            return self::getInstance();
        }
    }

    public function checkSolveGame()
    {
        if (request('checkArray'))
        {
            if (request('save') && request('timer') && request('hash')){
                $game = Game::getGame(request('hash'));
                $game->user_id = Auth::id();
                $game->game_data_numbers = json_encode(request('checkArray'));
                $game->game_data_timer = request('timer');
                $game->hash = request('hash');
                $game->save();
            }

            if (request('checkArray') === Game::COMPLETED_ARR){
                return true;
            }
        }
        return false;
    }

    public function getLastGame()
    {
        $game = Game::query()
            ->where('user_id', Auth::id())
            ->orderBy('id', 'desc')
            ->first();

        return $game ? $game->hash : false;
    }

    /**
     *  Пробуем сгенерить комбинацию чисел, которую возможно собрать (!)
     */
    private function generateShuffleNumbers()
    {
        $randomArr = range(1, 16);
        shuffle($randomArr);

        $randomArr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 11, 13, 14, 0, 12];

        $inv = 0;
        $removeKey = null;

        for ($i = 0; $i < 16; ++$i) {
            if ($randomArr[$i] !== null) {
                for ($j = 0; $j < $i; ++$j) {
                    if ($randomArr[$j] > $randomArr[$i]) {
                        ++$inv;
                    }
                }
            }
        }

        for ($i = 0; $i < 16; ++$i) {
            if ($randomArr[$i] !== null) {
                for ($j = 0; $j < $i; ++$j) {
                    if ($randomArr[$j] > $randomArr[$i]) {
                        ++$inv;
                    }
                }
            }
        }

        for ($i = 0; $i < 16; ++$i) {
            if ($randomArr[$i] == 16){
                $removeKey = $i;
            }

            if ($randomArr[$i] == 0) {
                $inv += 1 + intdiv($i, 4);
            }
        }

        $randomArr[14] = 0;

        if ($inv % 2 == 0) {
            $this->initNumbers = $randomArr;
            return true;
        } else {
            return false;
        }
    }

    private function generateHash()
    {
        return Str::random(14) . '_';
    }
}
