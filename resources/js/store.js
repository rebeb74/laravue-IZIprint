import { sortByOrder } from "./shared/utils/sortByOrder";
import { getPages, updatePage } from "./shared/db/pagesService";
import { getBlocks } from "./shared/db/blockService";
import { getSiteData } from "./shared/db/siteDataService";
import { sortByCreatedAt } from "./shared/utils/sortByCreatedAt";

export default {
    state() {
        return {
            pages: [],
            pagesAreLoaded: false,
            sidebarIsOpen: false,
            siteData: {},
            isLoading: false,
            siteDataIsLoaded: false,
            uploadedImage: null,
            sidenavIcon: false,
            blocks: [],
            blocksAreLoaded: false
        }
    },
    mutations: {
        setPagesAreLoaded(state) {
            state.pagesAreLoaded = true;
        },
        setBlocksAreLoaded(state) {
            state.blocksAreLoaded = true;
        },
        setSiteDataIsLoaded(state) {
            state.siteDataIsLoaded = true;
        },
        setPages(state, payload) {
            payload.forEach(page => {
                if (page.blocks) {
                    page.blocks.sort(sortByOrder);
                }
                if (page.gallery) {
                    page.gallery.sort(sortByCreatedAt);
                }
            });
            state.pages = payload.sort(sortByOrder);
        },
        setBlocks(state, payload) {
            state.blocks = payload;
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
        },
        showSidenavIcon(state) {
            state.sidenavIcon = true;
        },
        hideSidenavIcon(state) {
            state.sidenavIcon = false;
        }

    },
    actions: {
        loadBlocks (context) {
            getBlocks()
                .then(
                    result => {
                        context.commit('setBlocks', result.data.data);
                        context.commit('setBlocksAreLoaded');
                    }
                )
        },
        loadPages(context) {
            getPages()
                .then(
                    result => {
                        console.log(result.data.data)
                        context.commit('setPages', result.data.data);
                        context.commit('setPagesAreLoaded');
                    })
                .catch(
                    (error) => {
                        console.error("load pages error", error);
                    })
        },
        loadSiteData(context) {
            getSiteData()
                .then(
                    result => {
                        context.commit('setSiteData', result.data);
                        context.commit('setSiteDataIsLoaded');
                    })
                .catch(
                    (error) => {
                        console.error("load site data error", error);
                    })
        },
        updatePage(context, payload) {
            context.commit('setIsLoading');
            updatePage(payload)
                .then(
                result => {
                    const pages = [...context.state.pages];
                    const newPages = pages.filter(page => page.id !== result.data.id);
                    newPages.push(result.data);
                    context.commit('setPages', newPages);
                    context.commit('setIsLoading');
                    }
                )
                .catch(
                    error => {
                        console.log('update Page error', error);
                    }
                )
        },
    },
    getters: {
        getPage:(state) => (key) => {
            return state.pages.find(page => page.key === key);
        }
    }
};