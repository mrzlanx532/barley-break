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
    import { mapMutations } from 'vuex';
    import { mapGetters } from 'vuex';

    export default {
        name: 'App',
        methods: {
            ...mapMutations([
                'setAppIsInitialized',
                'setUser'
            ])
        },
        created() {
            axios.get('/api/user').then((response)=>{
                this.setUser(response.data)
            }).finally(() => {
                this.setAppIsInitialized();
            })
        }
    }
</script>
