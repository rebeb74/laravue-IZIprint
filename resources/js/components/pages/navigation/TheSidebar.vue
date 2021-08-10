<template>
  <div
    v-if="$store.state.sidebarIsOpen"
    class="h-full w-full z-50 bg-primary-dark bg-opacity-30 fixed"
    @click="closeSidebar()"
  ></div>
  <div
    :class="sidebarIsOpen"
    class="h-full w-72 bg-primary fixed z-50 overflow-scroll pb-10"
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
        v-for="page in $store.state.pages"
        :key="page.id"
        :class="menuItem"
        class="hover:bg-primary-light px-6"
        :to="'/' + page.key"
        @click="closeSidebar()"
      >
        {{ page.name }}
      </router-link>
    </div>
  </div>
</template>

<script>
export default {
  computed: {
    sidebarIsOpen() {
      return this.$store.state.sidebarIsOpen
        ? "shadow-sidebar duration-500"
        : "shadow-none transform -translate-x-72 duration-500";
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