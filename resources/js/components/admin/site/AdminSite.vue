<template>
  <div class="m-auto w-xs lg:w-5xl py-5 lg:px-5">
    <div class="w-full rounded-lg bg-primary shadow-lg p-5">
      <div class="text-xl text-gray-200">Ordre des pages</div>
      <div>
        <draggable
          v-model="pages"
          @change="log"
          class="p-5 flex justify-start items-center"
        >
          <transition-group>
            <div
              v-for="page in $store.state.pages"
              :key="page.id"
              class="
                px-3
                py-2
                mx-1
                bg-primary-light
                rounded-lg
                cursor-pointer
                focus:cursor-pointer
              "
            >
              {{ page.name }}
            </div>
          </transition-group>
        </draggable>
      </div>
    </div>
  </div>
</template>

<script>
import { ref } from "vue";
import { useStore } from "vuex";
import { VueDraggableNext } from "vue-draggable-next";
import _ from "lodash";
import { updatePage } from "../../../shared/db/pagesService";

export default {
  components: {
    draggable: VueDraggableNext,
  },
  setup() {
    const store = useStore();
    const pages = ref(store.state.pages);
    console.log(pages.value);

    const log = (event) => {
      const orderedPages = [];
      pages.value.forEach((page, index) => {
        orderedPages.push({ ...page, order: index });
      });
      store.commit("setPages", orderedPages);

      orderedPages.forEach((page) => {
        updatePage(page)
          .then((result) => {
            console.log(result);
          })
          .catch((error) => {
            console.log(error);
          });
      });
    };

    return {
      pages,
      log,
    };
  },
};
</script>

<!--<template>
   <div class="flex">
    SMALL SCREEN
    <div
      v-if="$store.state.sidebarIsOpen"
      class="lg:hidden h-full w-full z-30 bg-primary bg-opacity-30 fixed"
      @click="closeSidebar()"
    ></div>
    <div
      :class="sidebarIsOpen"
      class="lg:hidden h-full w-72 bg-primary fixed z-50 overflow-scroll pb-10"
      ref="sidebar"
    >
      <div :class="menuItem" @click="closeSidebar()" class="px-5 flex flex-row justify-between items-center">
        <span class="text-secondary">SITE</span>
        <i class="fas fa-arrow-left self-end text-xl cursor-pointer h-full"></i>
      </div>

      <div class="px-5 divide-y divide-primary-light">
        <router-link
          :class="menuItem"
          class="hover:bg-primary-light px-6  flex flex-col justify-center items-start "
          to="/admin/site/general"
          @click="closeSidebar()"
        >
          Général
        </router-link>
        <router-link
          :class="menuItem"
          class="hover:bg-primary-light px-6  flex flex-col justify-center items-start "
          to="/admin/site/order"
          @click="closeSidebar()"
        >
          Ordre des pages
        </router-link>
        <router-link
          :class="menuItem"
          class="hover:bg-primary-light px-6  flex flex-col justify-center items-start "
          to="/admin/site/socials"
          @click="closeSidebar()"
        >
          Réseaux sociaux
        </router-link>
      </div>
    </div>

    LARGE SCREEN
    <div class="hidden lg:block w-72 h-full bg-primary z-0 pb-10 pt-6">
      <div
        :class="menuItem"
        @click="closeSidebar()"
        class="px-5 flex flex-row justify-between items-center"
      >
        <span class="text-secondary uppercase">Réglages du site</span>
      </div>
      <div class="px-5 divide-y divide-primary-light">
        <router-link
          :class="menuItem"
          class="hover:bg-primary-light px-6  flex flex-col justify-center items-start "
          to="/admin/site/general"
        >
          Général
        </router-link>
        <router-link
          :class="menuItem"
          class="hover:bg-primary-light px-6  flex flex-col justify-center items-start "
          to="/admin/site/order"
        >
          Ordre des pages
        </router-link>
        <router-link
          :class="menuItem"
          class="hover:bg-primary-light px-6  flex flex-col justify-center items-start "
          to="/admin/site/socials"
        >
          Réseaux sociaux
        </router-link>
      </div>
    </div>

    <router-view class="h-full m-auto text-center flex-auto"></router-view>
  </div> 
</template>

<script>
// export default {
  // computed: {
  //   sidebarIsOpen() {
  //     return this.$store.state.sidebarIsOpen
  //       ? "duration-500"
  //       : "transform -translate-x-72 duration-500";
  //   },
  //   menuItem() {
  //     return "w-full h-14 font-medium text-lg text-gray-200 cursor-pointer";
  //   },
  // },
  // methods: {
  //   closeSidebar() {
  //     this.$store.commit("toogleSidebar");
  //     setTimeout(() => {
  //       this.scrollSidebarToTop();
  //     }, 500);
  //   },
  //   scrollSidebarToTop() {
  //     this.$nextTick(() => {
  //       this.$refs.sidebar.scrollTop = 0;
  //     });
  //   },
  // },
// }
</script>-->