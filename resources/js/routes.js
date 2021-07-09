import { createWebHistory } from "vue-router";
import Home from './components/pages/Home.vue';
import Enseignes from './components/pages/Enseignes.vue';
import Vehicules from './components/pages/Vehicules.vue';
import Signaletique from './components/pages/Signaletique.vue';
import Packaging from './components/pages/Packaging.vue';
import Plv from './components/pages/Plv.vue';
import AboutUs from './components/pages/AboutUs.vue';
import Contact from './components/pages/Contact.vue';
import Devis from './components/pages/Devis.vue';

export default {
    history: createWebHistory(),
    linkActiveClass: 'active',
    routes: [{
            path: '/',
            component: Home
        },
        {
            path: '/enseignes',
            component: Enseignes,
            name: 'enseignes',
        },
        {
            path: '/vehicules',
            component: Vehicules,
            name: 'vehicules',
        },
        {
            path: '/signaletique',
            component: Signaletique,
            name: 'signaletique',
        },
        {
            path: '/packaging',
            component: Packaging,
            name: 'packaging',
        },
        {
            path: '/plv',
            component: Plv,
            name: 'plv',
        },
        {
            path: '/about_us',
            component: AboutUs,
            name: 'about-us',
        },
        {
            path: '/contact',
            component: Contact,
            name: 'contact',
        },
        {
            path: '/devis',
            component: Devis,
            name: 'devis',
        },
    ]
}