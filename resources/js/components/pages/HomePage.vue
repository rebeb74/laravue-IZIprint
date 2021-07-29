<template>
  <div class="m-auto w-xs lg:w-5xl py-5 lg:px-5">
    <div v-for="block in currentPage.blocks" :key="block.id" class="">
      <block-preview :block="block"></block-preview>
    </div>
    <div v-if="currentPage.gallery.length > 0">
      <image-gallery :images="currentPage.gallery"></image-gallery>
    </div>
  </div>
</template>

<script>
import getCurrentPage from "../../shared/utils/getCurrentPage";
import BlockPreview from "../../shared/base-components/BlockPreview.vue";
import ImageGallery from "../../shared/base-components/ImageGallery.vue";

export default {
  components: {
    BlockPreview,
    ImageGallery,
  },
  data() {
    return {
      currentPage: getCurrentPage(),
    };
  },
  computed: {
    images() {
      let images = [];
      this.currentPage.gallery.forEach((image) => {
        images.push(image.url);
      });
      console.log(images);
      return images;
    },
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