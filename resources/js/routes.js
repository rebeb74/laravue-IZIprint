import { createWebHistory } from "vue-router";
import HomePage from './components/pages/HomePage.vue';
import EnseignesPage from './components/pages/EnseignesPage.vue';
import VehiculesPage from './components/pages/VehiculesPage.vue';
import SignaletiquePage from './components/pages/SignaletiquePage.vue';
import PackagingPage from './components/pages/PackagingPage.vue';
import PlvPage from './components/pages/PlvPage.vue';
import AboutUsPage from './components/pages/AboutUsPage.vue';
import ContactPage from './components/pages/ContactPage.vue';
import DevisPage from './components/pages/DevisPage.vue';
import AdminPage from './components/admin/AdminPage.vue';
import IndexPage from './components/pages/IndexPage.vue';
import The404Page from './components/The404Page.vue';

export default {
    history: createWebHistory(),
    linkExactActiveClass: 'active',
    routes: [
        {
            path: '/admin',
            component: AdminPage,
            name: 'admin',
        },
        {
            path: '/',
            component: IndexPage,
            children: [
                {
                    path: '',
                    component: HomePage,
                    name: 'home',
                },
                {
                    path: 'enseignes',
                    component: EnseignesPage,
                    name: 'enseignes',
                },
                {
                    path: 'vehicules',
                    component: VehiculesPage,
                    name: 'vehicules',
                },
                {
                    path: 'signaletique',
                    component: SignaletiquePage,
                    name: 'signaletique',
                },
                {
                    path: 'packaging',
                    component: PackagingPage,
                    name: 'packaging',
                },
                {
                    path: 'plv',
                    component: PlvPage,
                    name: 'plv',
                },
                {
                    path: 'about_us',
                    component: AboutUsPage,
                    name: 'about-us',
                },
                {
                    path: 'contact',
                    component: ContactPage,
                    name: 'contact',
                },
                {
                    path: 'devis',
                    component: DevisPage,
                    name: 'devis',
                },
            ]
        },
        {
            path: '/:pathMatch(.*)*',
            component: The404Page,
            name: '404',
        },
    ]
}