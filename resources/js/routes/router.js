import Vue from "vue"
import VueRouter from "vue-router"
import store from "../store/store"
import isEmpty from "lodash/isEmpty"

Vue.use(VueRouter)

const routes = [
    {
        path: '/',
        component: require('./views/MainView').default,
        name: 'home',
        meta: {
            title : 'Barley-break | Game'
        }
    },
    {
        path: '/login',
        component: require('./views/LoginView').default,
        name: 'login',
        meta: {
            title: 'Barley-break | Log In'
        }
    },
    {
        path: '/sign-in',
        component: require('./views/SignInView').default,
        name: 'sign-in',
        meta: {
            title: 'Barley-break | Sign In'
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

    next()

    store.watch(() => store.getters.getAppIsInitialized, () => {
        if (store.getters.getAppIsInitialized) {
            if (!isEmpty(store.getters.getUser)) {
                next()
            } else {
                routesWithoutAuth.includes(to.name) ? next() : next({ name: 'login' });
            }
        }
    });
})

export default router
