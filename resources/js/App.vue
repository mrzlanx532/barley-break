<template>
    <div>
        <div class="relative flex items-top justify-center min-h-screen bg-gray-100 dark:bg-gray-900 sm:items-center sm:pt-0">
            <div class="flex-container">
                <div class="flex-item">
                    <router-view></router-view>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
    export default {
        name: 'App',
    }
</script>
