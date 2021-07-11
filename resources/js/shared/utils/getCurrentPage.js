import { useRoute } from "vue-router";
import { useStore } from "vuex";

export default function () {
    const route = useRoute();
    const store = useStore();
    let currentPage = null;

    if (route.name === "home") {
      currentPage = store.state.pages.find((page) => page.key === "");
    } else {
      currentPage = store.state.pages.find((page) => page.key === route.name);
    }

    return currentPage;
};