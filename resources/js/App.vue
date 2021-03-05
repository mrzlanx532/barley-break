<template>
    <component class="h-full" :is="layout">
        <router-view/>
    </component>
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
        },
        computed: {
            layout() {
                return this.$route.meta.layout || 'default-layout'
            }
        }
    }
</script>

<style>
    html, body {
        height: 100%;
    }
</style>
