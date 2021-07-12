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

      <div class="flex items-center justify-center pb-5">
        <img
          class="w-32"
          src="../../../../assets/logo/logo-light.png"
          alt="Logo IZIprint"
        />
      </div>

      <div class="px-5 divide-y divide-primary-light">
        <router-link
          :class="menuItem"
          class="hover:bg-primary-light px-6"
          to="/admin/site/general"
          @click="closeSidebar()"
        >
          Général
        </router-link>
        <router-link
          :class="menuItem"
          class="hover:bg-primary-light px-6"
          to="/admin/site/order"
          @click="closeSidebar()"
        >
          Ordre des pages
        </router-link>
        <router-link
          :class="menuItem"
          class="hover:bg-primary-light px-6"
          to="/admin/site/socials"
          @click="closeSidebar()"
        >
          Réseaux sociaux
        </router-link>
      </div>
    </div>

    <!-- LARGE SCREEN -->
    <div class="hidden lg:block w-72 h-full bg-primary z-0 pb-10 pt-6">
      <div class="px-5 divide-y divide-primary-light">
        <router-link
          :class="menuItem"
          class="hover:bg-primary-light px-6"
          to="/admin/site/general"
        >
          Général
        </router-link>
        <router-link
          :class="menuItem"
          class="hover:bg-primary-light px-6"
          to="/admin/site/order"
        >
          Ordre des pages
        </router-link>
        <router-link
          :class="menuItem"
          class="hover:bg-primary-light px-6"
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

export default {
  computed: {
    sidebarIsOpen() {
      return this.$store.state.sidebarIsOpen
        ? "duration-500"
        : "transform -translate-x-72 duration-500";
    },
    menuItem() {
      return "w-full h-14 flex flex-col justify-center items-start font-medium text-lg text-gray-200 cursor-pointer";
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
  },
};
</script>