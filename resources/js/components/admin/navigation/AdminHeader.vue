<template>
  <div
    class="
      flex
      h-1/10
      bg-primary-dark
      justify-center
      items-center
      fixed
      w-full
      z-48
      shadow-xl
      flex-col
          text-gray-200 text-4xl
    "
  >
    <div class="mb-2 text-secondary">
        <h2>Administration IZIprint</h2>
    </div>
    <div class="flex-row flex mt-2">
      <div
        @click="openSidebar()"
        class="
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
        <router-link to="/admin">
          <img
            src="../../../../assets/logo/logo-light.png"
            alt="Logo IZIprint light"
          />
        </router-link>
      </div>
      <div
        class="
          hidden
          lg:block
          text-gray-200 text-sm
          mx-0.5
          lg:mx-1
          xl:mx-2
          lg:text-base
        "
      >
        <router-link
          :to="'/admin/site'"
          class="px-2 py-1 lg:px-3 lg:py-2 rounded hover:bg-secondary-dark mx-2"
        >
          Réglages du site
        </router-link>
        <router-link
          :to="'/admin/pages'"
          class="px-2 py-1 lg:px-3 lg:py-2 rounded hover:bg-secondary-dark mx-2"
        >
          Réglages des pages
        </router-link>
      </div>
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