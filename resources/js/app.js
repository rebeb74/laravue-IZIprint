import { createApp } from "vue";
import { createRouter } from 'vue-router';
import { createStore } from 'vuex';
import App from "./App.vue";
import routes from './routes';
import store from './store';

import '@fortawesome/fontawesome-free/css/all.css'
import '@fortawesome/fontawesome-free/js/all.js'

const router = createRouter(routes);
const vuex = createStore(store);
const app = createApp(App);

app.use(router);
app.use(vuex);
app.mount("#app");