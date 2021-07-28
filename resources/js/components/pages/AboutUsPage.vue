<template>
  <div class="m-auto w-xs lg:w-5xl py-5 lg:px-5">
    <div v-for="block in currentPage.blocks" :key="block.id" class="">
      <block-preview :block="block"></block-preview>
    </div>
  </div>
</template>
<script>
import getCurrentPage from "../../shared/utils/getCurrentPage";

export default {
  data() {
    return {
      currentPage: getCurrentPage(),
    };
  },
  created() {
    document
      .querySelector('meta[name="description"]')
      .setAttribute("content", this.currentPage.description);
    document.title =
      this.currentPage.title + " " + this.$store.state.siteData.suffix;
  },
};
</script>