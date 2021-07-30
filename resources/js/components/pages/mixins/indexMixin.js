import getCurrentPage from "../../../shared/utils/getCurrentPage";
import BlockPreview from "../../../shared/base-components/BlockPreview.vue";
import ImageGallery from "../../../shared/base-components/ImageGallery.vue";

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