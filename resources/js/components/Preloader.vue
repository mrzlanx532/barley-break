<template>
    <div v-if="toggle" class="relative flex items-top justify-center min-h-screen bg-gray-100 dark:bg-gray-900 sm:items-center sm:pt-0">
        <img src="/svg/preloader.svg">
    </div>
</template>

<script>
    export default {
        props: ['toggle']
    }
</script>
