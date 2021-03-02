import Vue from 'vue'
import Vuex from 'vuex'
import isEmpty from 'lodash/isEmpty'

Vue.use(Vuex)

const store = new Vuex.Store({
    state: {
        user: {},
        appIsInitialized: false
    },
    getters: {
        authorized: state => !isEmpty(state.user),
        getUser: state => state.user,
        getAppIsInitialized: state => state.appIsInitialized
    },
    mutations: {
        setUser (state, user) {
            state.user = user;
        },
        setAppIsInitialized (state) {
            state.appIsInitialized = true
        }
    }
})

export default store
