<template>
    <div class="relative flex items-top justify-center min-h-screen bg-gray-100 dark:bg-gray-900 sm:items-center sm:pt-0">
        <div>
            <div class="flex justify-center">
                <button v-on:click="$emit('start-game')"
                        class="text-2xl border-2 border-brown-soft py-3 px-5 rounded-lg focus:outline-none"
                >Начать игру</button>
            </div>
            <p class="mt-4 text-brown-strict">Для управления используйте стрелки</p>
        </div>
    </div>
</template>

<script>
    export default {

    }
</script>
