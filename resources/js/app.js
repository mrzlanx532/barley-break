require('./bootstrap')

import Vue from "vue"
import App from "./App"
import router from "./routes/router"
import store from "./store/store"

new Vue({
    router,
    store,
    render: (h) => h(App)
}).$mount('#app');
