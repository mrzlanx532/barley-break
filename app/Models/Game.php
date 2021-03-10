<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
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

    public function getGame($hash)
    {
        $game = Game::whereHash($hash)->first();
        return $game ? $game : new Game();
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
            return $this->getInstance();
        }
    }

    public function getLastGame()
    {
        return Game::query()->where('user_id', Auth::id())
            ->orderBy('id', 'desc')
            ->firstOrFail();
    }

    /**
     *  Пробуем сгенерить комбинацию чисел, которую возможно собрать (!)
     */
    private function generateShuffleNumbers()
    {
        $randomArr = range(1, 16);
        $randomArr[15] = 0;
        shuffle($randomArr);

        // $randomArr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 11, 13, 14, 0, 12];

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
            if ($randomArr[$i] == 0) {
                $inv += 1 + intdiv($i, 4);
            }
        }

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
