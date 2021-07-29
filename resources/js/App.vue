<template>
  <router-view
    v-if="$store.state.pagesAreLoaded && $store.state.siteDataIsLoaded"
  ></router-view>
</template>

<script>
import { useStore } from "vuex";
import { useRoute } from "vue-router";

export default {
  methods: {
    fillPagesWithBlocks() {
      const pages = this.$store.state.pages;
      const blocks = this.$store.state.blocks;
      let blocksToFill = [];
      pages.forEach((page) => {
        blocksToFill = [];
        blocks.forEach((block) => {
          if (page.id === block.page_id) {
            blocksToFill.push(block);
          }
        });
      });
    },
  },
  beforeCreate() {
    this.$store.dispatch("loadPages");
    this.$store.dispatch("loadBlocks");
    this.$store.dispatch("loadSiteData");
  },
};
</script>

