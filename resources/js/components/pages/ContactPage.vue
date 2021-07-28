<template>
    <div>
        
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