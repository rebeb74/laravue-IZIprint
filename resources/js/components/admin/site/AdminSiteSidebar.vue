<template>
  <div
    class="
      h-9/10
      w-72
      bg-primary
      fixed
      z-0
      overflow-scroll
      lg:overflow-auto
      pb-10
      pt-6
      bottom-0
    "
    ref="sidebar"
  >
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
      >
        Général
      </router-link>
    </div>
    <div class="px-5 divide-y divide-primary-light">
      <router-link
        :class="menuItem"
        class="hover:bg-primary-light px-6"
        to="/admin/site/order"
      >
        Ordre des pages
      </router-link>
    </div>
    <div class="px-5 divide-y divide-primary-light">
      <router-link
        :class="menuItem"
        class="hover:bg-primary-light px-6"
        to="/admin/site/socials"
      >
        Réseaux sociaux
      </router-link>
    </div>
  </div>
</template>

<script>
export default {
  computed: {
    menuItem() {
      return "w-full h-14 flex flex-col justify-center items-start font-medium text-lg text-gray-200 cursor-pointer";
    },
  },
  methods: {},
};
</script>