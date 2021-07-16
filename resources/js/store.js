import axios from "axios";
import { objectToArray } from "./shared/utils/objectToArray";
import { sortPages } from "./shared/utils/sortPages";

export default {
    state() {
        return {
            pages: [],
            pagesAreLoaded: false,
            sidebarIsOpen: false,
            siteData: {},
            isLoading: false,
            siteDataIsLoaded: false,
            uploadedImage: null
        }
    },
    mutations: {
        setPagesAreLoaded(state) {
            state.pagesAreLoaded = true;
        },
        setSiteDataIsLoaded(state) {
            state.siteDataIsLoaded = true;
        },
        setSiteDataIsNotLoaded(state) {
            state.siteDataIsLoaded = false;
        },
        setPages(state, payload) {
            state.pages = payload;
        },
        toogleSidebar(state) {
            state.sidebarIsOpen = !state.sidebarIsOpen;
        },
        setSiteData(state, payload) {
            state.siteData = payload;
        },
        setIsLoading(state) {
            state.isLoading = !state.isLoading;
        },
        setUploadedImage(state, payload) {
            state.uploadedImage = payload;
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
        loadSiteData(context) {
            axios.get('/api/site')
                .then(
                    result => {
                        context.commit('setSiteDataIsNotLoaded');
                        context.commit('setSiteData', result.data);
                        context.commit('setSiteDataIsLoaded');
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