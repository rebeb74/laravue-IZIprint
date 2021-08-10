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
      z-20
      shadow-xl
    "
  >
    <div
      @click="openSidebar()"
      class="
        text-gray-200 text-4xl
        absolute
        left-4
        top-3.3
        lg:hidden
        cursor-pointer
      "
    >
      <i class="fas fa-bars"></i>
    </div>
    <div class="lg:absolute lg:left-2 lg:top-1.5 w-16 z-40">
      <router-link to="/">
        <img
          src="../../../../assets/logo/logo-light.png"
          alt="Logo IZIprint light"
        />
      </router-link>
    </div>
    <div
      class="hidden lg:block text-gray-200 text-sm mx-0.5 lg:mx-1 xl:mx-2 lg:text-base"
      v-for="page in $store.state.pages"
      :key="page.id"
    >
      <router-link
        :to="'/' + page.key"
        class="px-2 py-1 lg:px-3 lg:py-2 rounded hover:bg-secondary-dark"
      >
        {{ page.name }}
      </router-link>
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
      this.$store.commit("toogleSidebar");
    },
  },
  computed: {},
  created() {},
};
</script>



