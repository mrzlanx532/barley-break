<template>
    <div class="flex flex-col h-full">

        <preloader :toggle="!getAppIsInitialized"/>

        <template v-if="getAppIsInitialized">
            <template v-if="!gameStarted">
                <game-init-component v-on:start-game="startGame"/>
            </template>

            <template v-if="!gameCompleted">
                <template v-if="gameData.length">
                    <div class="flex justify-center bg-brown-soft">
                        <div class="bg-brown-soft pt-2 pb-1 px-2 rounded-b-md inline-flex">
                            <span class="text-brown-dark">От начала игры прошло: {{ timer }} секунд</span>
                            <button class="float-right ml-2 mb-2 px-3 py-1 bg-white rounded text-xs" v-on:click="reset">Сброс</button>
                            <button class="float-right ml-2 mb-2 px-3 py-1 bg-white rounded text-xs" v-on:click="saveGame">Сохранить</button>
                        </div>
                    </div>
                </template>

                <div v-if="gameStarted" class="flex justify-center items-center h-full">
                    <div class="flex h-3/4 contents">
                        <div class="grid grid-cols-4 gap-4 mt-5">
                            <template v-for="(item, i) in gameData" :v-key="item">
                                <div v-if="item === 0" class="w-20 h-20 flex"></div>
                                <div v-else class="item-from w-20 h-20 flex border-brown-middle justify-center border-2 items-center rounded">
                                    <span>
                                        {{ item }}
                                    </span>
                                </div>
                            </template>
                        </div>
                    </div>
                </div>
            </template>
        </template>
    </div>
</template>

<script>
    import Swal from 'sweetalert2';
    import GameInitComponent from "../../components/GameInitComponent"
    import Preloader from "../../components/Preloader"
    import { mapGetters } from 'vuex'

    export default {
        components: { GameInitComponent, Preloader },
        data() {
            return {
                data: '',
                gameData: [],
                gameCompleted: false,
                gameStarted: false,
                timer: false,
                interval: null,
                hash: false,
            }
        },
        created: function(){

            const vm = this;

            window.addEventListener('keydown', (e) => {
                if(e.key === 'ArrowUp'){
                    vm.moveUp();
                }
                if(e.key === 'ArrowDown'){
                    vm.moveDown();
                }
                if(e.key === 'ArrowLeft'){
                    vm.moveLeft();
                }
                if(e.key === 'ArrowRight'){
                    vm.moveRight();
                }
            });
            this.getLastGame();
        },
        computed: {
            ...mapGetters({
                getAppIsInitialized: 'getAppIsInitialized'
            }),
            checkResultURL: function(){
                return '/api/game/'+this.hash+'/solve';
            }
        },
        methods: {
            saveGame() {
                axios.post(this.checkResultURL, {
                    checkArray: this.gameData,
                    save: 'save',
                    timer: this.timer,
                    hash: this.hash
                })
            },
            startGame() {
                let vm = this;
                axios.post('api/game', {data: 'fgdhfjbkgutirkf_'})
                    .then(function(response){
                        vm.gameStarted = true;
                        vm.gameData = response.data.numbers;
                        vm.interval = setInterval(vm.countUp, 1000);
                        vm.timer = 0;
                        vm.hash = response.data.hash;
                    });
            },
            getLastGame() {
                let vm = this;
                axios.get('api/game/last')
                    .then(function(response){
                        vm.hash = response.data;
                    });
            },
            reset() {
                clearInterval(this.interval);
                this.timer = 0;
                this.startGame();
            },
            countUp() {
                let n = this.timer;
                if (n === false) {
                    this.timer = true;
                } else if(n >= 0) {
                    n = n + 1;
                    this.timer = n;
                }
            },
            moveLeft() {

                let nextElem = null;
                let prevElem = null;
                let vm = this;

                this.gameData.forEach(function(element, index){
                    if (element === 0) {
                        nextElem = index+1;
                        prevElem = index;
                    }
                });

                if (nextElem !== undefined && nextElem !== 16 && nextElem % 4 !== 0){
                    let temp = this.gameData[prevElem];
                    let tempArr = this.gameData;
                    tempArr[prevElem] = this.gameData[nextElem];
                    tempArr[nextElem] = temp;
                    this.gameData = [];
                    this.gameData = tempArr;
                }
                this.checkResult();
            },
            moveRight() {

                let nextElem = null;
                let prevElem = null;

                this.gameData.forEach(function(element, index){
                    if (element === 0){
                        nextElem = index
                        prevElem = index-1
                    }
                });

                if (nextElem !== undefined && nextElem % 4 !== 0){

                    let temp = this.gameData[nextElem];
                    let tempArr = this.gameData;
                    tempArr[nextElem] = this.gameData[prevElem];
                    tempArr[prevElem] = temp;
                    this.gameData = [];
                    this.gameData = tempArr;
                }
                this.checkResult();
            },
            moveUp() {

                let nextElem = null;
                let prevElem = null;
                let vm = this;

                this.gameData.forEach(function(element, index){
                    if (element === 0) {
                        nextElem = index+4;
                        prevElem = index;

                        if (vm.gameData[nextElem] === undefined) {
                            nextElem = undefined;
                        }
                    }
                });

                if (nextElem !== undefined && nextElem !== 16){

                    let temp = this.gameData[prevElem];
                    let tempArr = this.gameData;
                    tempArr[prevElem] = this.gameData[nextElem];
                    tempArr[nextElem] = temp;
                    this.gameData = [];
                    this.gameData = tempArr;
                    this.animation = false;

                }
                this.checkResult();
            },
            moveDown() {

                let nextElem = null;
                let prevElem = null;
                let vm = this;

                this.gameData.forEach(function(element, index) {
                    if (element === 0){
                        nextElem = index-4;
                        prevElem = index;
                        if (vm.gameData[nextElem] === undefined) {
                            nextElem = undefined;
                        }
                    }
                });

                if (nextElem !== undefined && nextElem !== 16) {
                    let temp = this.gameData[prevElem];
                    let tempArr = this.gameData;
                    tempArr[prevElem] = this.gameData[nextElem];
                    tempArr[nextElem] = temp;
                    this.gameData = [];
                    this.gameData = tempArr;
                    this.animation = false;
                }
                this.checkResult();
            },
            checkResult(){

                let vm = this;

                axios.post(this.checkResultURL, { numbers: this.gameData })
                    .then(function(response) {
                        if (response.data) {
                            Swal.fire({
                                title: 'Поздравляем, вы справились!',
                                text: 'Вы собрали головоломку за '+vm.timer+' секунд',
                                icon: 'success',
                                confirmButtonText: 'Ок'
                            });
                            vm.gameStarted = false;
                            clearInterval(vm.interval);
                        }
                    })
            }
        },
    }
</script>
