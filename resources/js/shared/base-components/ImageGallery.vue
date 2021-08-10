<template>
  <div class="relative z-0 w-full">
    <teleport to="body">
      <images-preview v-if="imagePreview" :image="imagePreview" :images="images" @close="closePreview()"></images-preview>
    </teleport>
    <div
      class="
        absolute
        arrow
        left-0
        w-6
        text-gray-200
        fill-current
        cursor-pointer
      "
      @click="scrollLeft()"
      v-if="!imagePreview"
    >
      <img
        src="../../../assets/icons/left_arrow_gallery.svg"
        alt="Left Arrow"
      />
    </div>
    <div
      class="whitespace-nowrap overflow-auto hide-scrollbar"
      ref="gallery"
      @wheel.prevent="scrollWheel($event)"
    >
      <div v-for="image in images" :key="image.id" class="inline-block">
        <img
          class="cursor-pointer pr-2"
          @click="showImage(image)"
          :src="image.thumb_url"
          :alt="image.alt_tag"
        />
      </div>
    </div>
    <div
      class="
        absolute
        transform
        right-0
        rotate-180
        arrow
        w-6
        text-gray-200
        fill-current
        cursor-pointer
      "
      @click="scrollRight($event)"
    >
      <img
        src="../../../assets/icons/left_arrow_gallery.svg"
        alt="Right Arrow"
      />
    </div>
  </div>
</template>

<script>
import ImagesPreview from './ImagesPreview.vue';

export default {
  components: {
    ImagesPreview
  },
  props: {
    images: {
      type: Object,
      required: true,
    },
  },
  data() {
    return {
      autoScrollActive: true,
      imagePreview: null,
      autoScrollInterval: null
    };
  },
  methods: {
    closePreview() {
      this.imagePreview = null;
    },
    showImage(image) {
      this.imagePreview = image;
    },
    scrollWheel(event) {
      this.$refs.gallery.scrollLeft += event.deltaY;
    },
    scrollLeft() {
      this.$refs.gallery.scrollTo({
        top: 0,
        left: this.$refs.gallery.scrollLeft - 308,
        behavior: "smooth",
      });
      this.autoScrollActive = false;
      setTimeout(() => {
          this.autoScrollActive = true;
      }, 5000);
    },
    scrollRight() {
      this.$refs.gallery.scrollTo({
        top: 0,
        left: this.$refs.gallery.scrollLeft + 308,
        behavior: "smooth",
      });
      this.autoScrollActive = false;
      setTimeout(() => {
          this.autoScrollActive = true;
      }, 5000);
    },
    autoScroll() {
      let direction = "right";
      this.autoScrollInterval = setInterval(() => {
        if (this.autoScrollActive) {
          if (direction === "right") {
            if (
              this.$refs.gallery.scrollWidth - this.$refs.gallery.scrollLeft ===
              this.$refs.gallery.clientWidth
            ) {
              direction = "left";
            }
            this.$refs.gallery.scrollTo({
              top: 0,
              left: this.$refs.gallery.scrollLeft + 308,
              behavior: "smooth",
            });
          } else if (direction === "left") {
            if (this.$refs.gallery.scrollLeft === 0) {
              direction = "right";
            }
            this.$refs.gallery.scrollTo({
              top: 0,
              left: this.$refs.gallery.scrollLeft - 308,
              behavior: "smooth",
            });
          }
        }
      }, 1000);
    },
  },
  mounted() {
    this.autoScroll();
  },
  unmounted() {
    clearInterval(this.autoScrollInterval);
  }
};
</script>

<style scoped>
.arrow {
  top: calc(50% - 33px);
}

.hide-scrollbar {
  -ms-overflow-style: none;
  scrollbar-width: none;
}

.hide-scrollbar::-webkit-scrollbar {
  display: none;
}
</style>