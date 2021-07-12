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
      shadow-xl
      text-gray-200
    "
  >
    <div class="w-full lg:w-3/4 self-start flex h-full justify-start items-center">
      <div
        @click="openSidebar()"
        class="text-3xl mx-4 lg:hidden cursor-pointer"
      >
        <i class="fas fa-bars"></i>
      </div>
      <div class="w-16 justify-center items-center mx-2">
        <router-link to="/admin">
          <img
            src="../../../../assets/logo/logo-light.png"
            alt="Logo IZIprint light"
          />
        </router-link>
      </div>
      <div class="text-secondary justify-center items-center mx-2 text-2xl">
        Administration
      </div>
      <div
        class="
          hidden
          text-gray-200 text-sm
          mx-0.5
          lg:mx-1
          xl:mx-2
          lg:text-base
          self-center
          lg:flex
          lg:justify-center
          lg:items-center
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

    <div class="hidden w-1/4 self-end lg:flex justify-end items-center h-full">
      <div
        :to="'/admin/site'"
        class="px-2 py-1 lg:px-3 lg:py-2 rounded hover:bg-secondary-dark mx-2"
      >
        Se déconnecter de l'admin
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