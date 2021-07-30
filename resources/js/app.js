import { createApp } from "vue";
import { createRouter } from 'vue-router';
import { createStore } from 'vuex';
import App from "./App.vue";
import routes from './routes';
import store from './store';


import '@fortawesome/fontawesome-free/css/all.css'
import '@fortawesome/fontawesome-free/js/all.js'
import axios from "axios";
import { isAuth } from "./shared/utils/auth";

const router = createRouter(routes);
const vuex = createStore(store);
const app = createApp(App);

app.use(router);
app.use(vuex);

router.beforeEach((to, _, next) => {
    if (to.meta.isAuth && !isAuth()) {
        next('/auth/login');
    } else {
        next();
    }
}); 

axios.interceptors.response.use(
    response => {
        return response;
    },
    error => {
        if(error.response.status === 401) {
            vuex.dispatch('logout');
        }

        return Promise.reject(error);
    }
)

app.mount("#app");