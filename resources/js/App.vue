<template>
  <router-view
    v-if="$store.state.pagesAreLoaded && $store.state.siteDataIsLoaded"
  ></router-view>
</template>

<script>


export default {
  beforeCreate() {
    this.$store.dispatch("loadPages");
    this.$store.dispatch("loadBlocks");
    this.$store.dispatch("loadSiteData");
    this.$store.dispatch('loadUser');
  },
};
</script>

