<template>
  <div class="flex">
    <!-- SMALL SCREEN -->
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
      <div :class="menuItem" @click="closeSidebar()" class="mb-5 pr-5">
        <i class="fas fa-arrow-left self-end text-xl cursor-pointer"></i>
      </div>

      <div class="px-5 divide-y divide-primary-light">
        <router-link
          :class="menuItem"
          class="hover:bg-primary-light px-6"
          to="/admin/pages/general"
          @click="closeSidebar()"
        >
          Général
        </router-link>
        <router-link
          :class="menuItem"
          class="hover:bg-primary-light px-6"
          to="/admin/pages/blocks"
          @click="closeSidebar()"
        >
          Blocks
        </router-link>
        <router-link
          :class="menuItem"
          class="hover:bg-primary-light px-6"
          to="/admin/pages/gallery"
          @click="closeSidebar()"
        >
          Gallerie d'images
        </router-link>
      </div>
    </div>

    <!-- LARGE SCREEN -->
    <div class="hidden lg:block w-72 h-full bg-primary z-0 pb-10 pt-6">
      <div class="px-5 divide-y divide-primary-light">
        <div
          v-for="page in $store.state.pages"
          :key="page.id"
          :to="'/' + page.key"
          @click="toggleSubMenu(page.key)"
        >
          <div
            class="
              hover:bg-primary-light
              px-6
              flex
              justify-between
              items-center
            "
            :class="[menuItem]"
          >
            <div>{{ page.name }}</div>
            <div :class="rotateArrow(page.key)">
              <i class="fas fa-caret-right"></i>
            </div>
          </div>
          <div class="max-h-0 overflow-hidden" :class="openSubMenu(page.key)">
            <router-link
              :class="subMenuItem"
              class="hover:bg-primary-light px-6"
              :to="page.key ? '/admin/pages/'+page.key+'/general' : '/admin/pages/accueil/general'"
            >
              Général
            </router-link>
            <router-link
              :class="subMenuItem"
              class="hover:bg-primary-light px-6"
              :to="page.key ? '/admin/pages/'+page.key+'/Blocks' : '/admin/pages/accueil/Blocks'"
            >
              Blocks
            </router-link>
            <router-link
              :class="subMenuItem"
              class="hover:bg-primary-light px-6"
              :to="page.key ? '/admin/pages/'+page.key+'/gallery' : '/admin/pages/accueil/gallery'"
            >
              Gallerie d'images
            </router-link>
          </div>
        </div>
      </div>
    </div>

    <router-view class="h-full m-auto text-center flex-auto"></router-view>
  </div>
</template>

<script>
export default {
  data() {
    return {
      activeSubMenu: null,
    };
  },
  computed: {
    sidebarIsOpen() {
      return this.$store.state.sidebarIsOpen
        ? "duration-500"
        : "transform -translate-x-72 duration-500";
    },
    menuItem() {
      return "w-full h-14 font-medium text-lg text-gray-200 cursor-pointer";
    },
    subMenuItem() {
      return "w-full h-14 flex flex-col justify-center items-start font-medium text-lg text-gray-200 cursor-pointer pl-16 duration-500";
    },
  },
  methods: {
    closeSidebar() {
      this.$store.commit("toogleSidebar");
      setTimeout(() => {
        this.scrollSidebarToTop();
      }, 500);
    },
    scrollSidebarToTop() {
      this.$nextTick(() => {
        this.$refs.sidebar.scrollTop = 0;
      });
    },
    toggleSubMenu(key) {
      if (this.activeSubMenu !== key) {
        this.activeSubMenu = key;
      } else {
        this.activeSubMenu = null;
      }
    },
    openSubMenu(key) {
      if (this.activeSubMenu === key) {
        return "max-h-80 transition-max-height duration-1000";
      } else {
        return "max-h-0 transition-max-height duration-1000";
      }
    },
    rotateArrow(key) {
      if (this.activeSubMenu === key) {
        return "transform rotate-90 transition duration-500";
      } else {
        return "transition duration-1000";
      }
    },
  },
};
</script>

<style scoped>
</style>