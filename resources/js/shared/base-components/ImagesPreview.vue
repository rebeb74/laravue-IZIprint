<template>
  <div
    class="fixed top-0 right-0 left-0 bottom-0 flex justify-center items-center p-2 z-20"
  >
    <div
      class="fixed top-0 right-0 left-0 bottom-0 bg-opacity-90 bg-primary z-0"
      @click="closeModal()"
    ></div>
    <div
      class="absolute top-4 right-4 lg:top-20 z-10 lg:right-10 cursor-pointer"
      @click="closeModal()"
    >
      <i
        class="text-primary-dark far fa-times-circle text-4xl lg:text-7xl rounded-full"
      ></i>
    </div>
    <div class="z-10 relative max-w-4/5">
      <div
        class="
          absolute
          arrow
          -left-10
          w-6
          text-gray-200
          fill-current
          cursor-pointer
        "
        @click="scrollLeft()"
      >
        <img
          src="../../../assets/icons/left_arrow_gallery.svg"
          alt="Left Arrow"
        />
      </div>
      <div class="w-full h-full flex justify-center items-center">
        <img
          class="w-full h-full max-h-4/5"
          :src="imagePreview.url"
          :alt="imagePreview.alt_tag"
        />
      </div>
      <div
        class="
          absolute
          transform
          -right-10
          rotate-180
          arrow
          w-6
          text-gray-200
          fill-current
          cursor-pointer
        "
        @click="scrollRight()"
      >
        <img
          src="../../../assets/icons/left_arrow_gallery.svg"
          alt="Right Arrow"
        />
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    image: {
      type: Object,
      required: true,
    },
    images: {
      type: Object,
      required: true,
    },
  },
  emits: ["close"],
  data() {
    return {
      imagePreview: null,
    };
  },
  methods: {
    closeModal() {
      this.$emit("close");
    },
    scrollRight() {
      const currentImageIndex = this.images.findIndex(
        (image) => image.id === this.imagePreview.id
      );
      if (currentImageIndex < this.images.length - 1) {
        this.imagePreview = this.images[currentImageIndex + 1];
      }
    },
    scrollLeft() {
      const currentImageIndex = this.images.findIndex(
        (image) => image.id === this.imagePreview.id
      );
      if (currentImageIndex > 0) {
        this.imagePreview = this.images[currentImageIndex - 1];
      }
    },
  },
  created() {
    this.imagePreview = this.image;
  },
};
</script>

<style scoped>
.arrow {
  top: calc(50% - 33px);
}
</style>