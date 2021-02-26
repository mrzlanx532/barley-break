import Vue from "vue"
import VueRouter from "vue-router"

import MainView from "./views/MainView"
import LoginView from "./views/LoginView"
import SignInView from "./views/SignInView"

Vue.use(VueRouter)

const routes = [
    {
        path: '/',
        component: MainView,
        name: 'Home',
        meta: {
            title : 'Barley-break | Game'
        }
    },
    {
        path: '/login',
        component: LoginView,
        name: 'Login',
        meta: {
            title: 'Barley-break | Log In'
        }
    },
    {
        path: '/sign-in',
        component: SignInView,
        name: 'SignIn',
        meta: {
            title: 'Barley-break | Sign In'
        }
    },
];

const router = new VueRouter({
    mode: 'history',
    routes
});

const unauthorizedRoutes = [
    'Login',
    'SignIn'
];

// TODO: Make authorization
let isAuthenticated = false;

router.beforeEach((to, from, next) => {
    document.title = to.meta.title
    if (!unauthorizedRoutes.includes(to.name) && !isAuthenticated)
        next({ name: 'Login' })
    else
        next()
})

export default router
