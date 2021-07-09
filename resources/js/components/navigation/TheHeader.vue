<template>
  <div
    class="
      flex
      h-16
      bg-primary-dark
      justify-center
      items-center
      fixed
      w-full
      z-48
    "
  >
  <div @click="openSidebar()" class="text-gray-200 text-4xl absolute left-4 top-3.3 md:hidden cursor-pointer">
    <i class="fas fa-bars"></i>
  </div>
    <div class="md:absolute md:left-2 md:top-1.5 w-16 z-40">
      <router-link to="/">
        <img
          src="../../../assets/logo/logo-light.png"
          alt="Logo IZIprint light"
        />
      </router-link>
    </div>
    <div
      class="
        hidden
        md:block
        text-gray-200
        lg:px-4
        md:px-2
        text-sm
        lg:text-base
        xl:text-lg
      "
      v-for="page in $store.state.pages"
      :key="page.id"
    >
      <router-link :to="page.key">{{ page.name }}</router-link>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {};
  },
  methods: {
    openSidebar() {
      this.$store.commit('toogleSidebar');
    }
  },
  created() {},
};
</script>


