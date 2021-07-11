import axios from "axios";
import { objectToArray } from "./shared/utils/objectToArray";
import { sortPages } from "./shared/utils/sortPages";

export default {
    state() {
        return {
            pages: [],
            dataIsLoaded: false,
            sidebarIsOpen: false
        }
    },
    mutations: {
        setDataIsLoaded(state) {
            state.dataIsLoaded = true;
        },
        setPages(state, payload) {
            state.pages = payload;
        },
        toogleSidebar(state) {
            state.sidebarIsOpen = !state.sidebarIsOpen;
        }

    },
    actions: {
        loadPages(context) {
            axios.get('/api/pages')
                .then(
                    result => {
                        let pages = objectToArray(result.data).sort(sortPages);
                        context.commit('setPages', pages);
                        context.commit('setDataIsLoaded');
                    })
                .catch(
                    (error) => {
                        console.error("error", error)
                    })
        }
    },
    getters: {
        getPages(state) {
            return state.pages;
        }
    }
};