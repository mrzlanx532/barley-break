import Vue from "vue"
import App from "./App"
import router from "./routes/router"

new Vue({
    el: '#app',
    router,
    render: (h) => h(App)
});
