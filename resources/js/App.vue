<template>
    <div class="h-full">

        <preloader :toggle="!getAppIsInitialized"/>

        <transition name="fade">
            <template v-if="getAppIsInitialized">
                <component class="h-full" :is="layout">
                    <router-view/>
                </component>
            </template>
        </transition>
    </div>
</template>
<script>
    import { mapMutations } from 'vuex';
    import { mapActions } from 'vuex';
    import { mapGetters } from 'vuex';
    import Preloader from "./components/Preloader"

    export default {
        name: 'App',
        components: { Preloader },
        methods: {
            ...mapMutations({
                setAppIsInitialized: 'setAppIsInitialized',
            }),
            ...mapActions({
                getUser:'getUser'
            }),
        },
        created() {
            this.getUser()
            .finally(() => {
                this.setAppIsInitialized()
            })
        },
        computed: {
            ...mapGetters({
                getAppIsInitialized:'getAppIsInitialized'
            }),
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

<style scoped>
    .fade-enter-active {
        transition: opacity 1s;
    }

    .fade-leave-active {
        transition: opacity .3s;
    }

    .fade-enter, .fade-leave-to {
        opacity: 0;
    }
</style>
