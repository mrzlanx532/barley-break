import Vue from "vue"
import VueRouter from "vue-router"
import store from "../store/store"
import isEmpty from "lodash/isEmpty"

Vue.use(VueRouter)

Vue.component('default-layout', require('./layouts/Default').default);
Vue.component('center-layout', require('./layouts/Center').default);

const routes = [
    {
        path: '/',
        component: require('./views/GameView').default,
        name: 'game',
        meta: {
            title : 'Barley-break | Game'
        }
    },
    {
        path: '/login',
        component: require('./views/LoginView').default,
        name: 'login',
        meta: {
            title: 'Barley-break | Log In',
            layout: 'center-layout'
        }
    },
    {
        path: '/sign-in',
        component: require('./views/SignInView').default,
        name: 'sign-in',
        meta: {
            title: 'Barley-break | Sign In',
            layout: 'center-layout'
        }
    },
];

const router = new VueRouter({
    mode: 'history',
    routes
});

const routesWithoutAuth = [
    'login',
    'sign-in'
];

router.beforeEach((to, from, next) => {

    store.watch(() => store.getters.getAppIsInitialized, () => {
        if (store.getters.getAppIsInitialized) {
            if (isEmpty(store.getters.getUser)) {
                routesWithoutAuth.includes(to.name) ? next() : next({ name: 'login' });
            }
        }
    });

    next()
})

export default router
