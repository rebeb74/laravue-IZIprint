import axios from "axios";
import { objectToArray } from "./shared/utils/objectToArray";
import { sortPages } from "./shared/utils/sortPages";

export default {
    state() {
        return {
            pages: [],
            pagesAreLoaded: false,
            sidebarIsOpen: false,
            siteSuffix: ''
        }
    },
    mutations: {
        setPagesAreLoaded(state) {
            state.pagesAreLoaded = true;
        },
        setPages(state, payload) {
            state.pages = payload;
        },
        toogleSidebar(state) {
            state.sidebarIsOpen = !state.sidebarIsOpen;
        },
        setSiteSuffix(state, payload) {
            state.siteSuffix = payload;
        }

    },
    actions: {
        loadPages(context) {
            axios.get('/api/pages')
                .then(
                    result => {
                        const pages = objectToArray(result.data).sort(sortPages);
                        context.commit('setPages', pages);
                        context.commit('setPagesAreLoaded');
                    })
                .catch(
                    (error) => {
                        console.error("error", error);
                    })
        },
        loadSiteSuffix(context) {
            axios.get('/api/site')
                .then(
                    result => {
                        console.log(result)
                        context.commit('setSiteSuffix', result.data.suffix);
                    })
                .catch(
                    (error) => {
                        console.error("error", error);
                    })
        }
    },
    getters: {
        getPages(state) {
            return state.pages;
        }
    }
};