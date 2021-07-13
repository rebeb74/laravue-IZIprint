import { useRoute } from "vue-router";
import { useStore } from "vuex";

export default function () {
    const route = useRoute();
    const store = useStore();
    let currentPage = null;
    
    console.log(route.name)
    console.log(store.state.pages.find((page) => page.key === route.name))
    if (route.name === "home") {
      currentPage = store.state.pages.find((page) => page.key === "");
    } else {
      currentPage = store.state.pages.find((page) => page.key === route.name);
    }
    console.log(currentPage)
    return currentPage;
};