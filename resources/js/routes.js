import { createWebHistory } from "vue-router";

import AdminIndex from './components/admin/AdminIndex.vue';
import AdminSite from './components/admin/site/AdminSite.vue';
import AdminSiteGeneral from './components/admin/site/AdminSiteGeneral.vue';
import AdminSiteOrder from './components/admin/site/AdminSiteOrder.vue';
import AdminPages from './components/admin/pages/AdminPages.vue';
import AdminPagesGeneral from './components/admin/pages/AdminPagesGeneral.vue';
import AdminPagesBlocks from './components/admin/pages/AdminPagesBlocks.vue';
import AdminPagesGallery from './components/admin/pages/AdminPagesGallery.vue';

import IndexPage from './components/pages/IndexPage.vue';
import HomePage from './components/pages/HomePage.vue';
import EnseignesPage from './components/pages/EnseignesPage.vue';
import VehiculesPage from './components/pages/VehiculesPage.vue';
import SignaletiquePage from './components/pages/SignaletiquePage.vue';
import PackagingPage from './components/pages/PackagingPage.vue';
import PlvPage from './components/pages/PlvPage.vue';
import AboutUsPage from './components/pages/AboutUsPage.vue';
import ContactPage from './components/pages/ContactPage.vue';
import DevisPage from './components/pages/DevisPage.vue';

import The404Page from './components/The404Page.vue';
import TheLogin from './components/TheLogin.vue';

const router =  {
    history: createWebHistory(),
    linkExactActiveClass: 'active',
    routes: [
        {
            path: '/auth/login',
            component: TheLogin,
            name: 'login',
        },
        {
            path: '/admin',
            component: AdminIndex,
            name: 'admin',
            redirect: '/admin/site',
            meta: { isAuth: true },
            children: [
                {
                    path: 'site',
                    component: AdminSite,
                    name: 'site',
                    redirect: '/admin/site/general',
                    children: [
                        {
                            path: 'general',
                            component: AdminSiteGeneral,
                            name: 'site-general',
                        },
                        {
                            path: 'order',
                            component: AdminSiteOrder,
                            name: 'order',
                        },
                    ]
                },
                {
                    path: 'pages',
                    component: AdminPages,
                    name: 'pages',
                    redirect: '/admin/pages/home/general',
                    children: [
                        {
                            path: ':key/general',
                            component: AdminPagesGeneral,
                            name: 'pages-general',
                        },
                        {
                            path: ':key/blocks',
                            component: AdminPagesBlocks,
                            name: 'blocks',
                        },
                        {
                            path: ':key/gallery',
                            component: AdminPagesGallery,
                            name: 'gallery',
                        },
                    ]
                },
            ]
        },
        {
            path: '/',
            component: IndexPage,
            name:'index',
            redirect: '/home',
            children: [
                {
                    path: 'home',
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
                    name: 'about_us',
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



export default router;