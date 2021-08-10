<template>
  <div class="w-full">
    <h1 class="uppercase text-4xl text-secondary pt-20 pb-4 pl-4 w-xs lg:w-5xl m-auto font-bold">
      Signalétique
    </h1>
    <div v-for="(block, index) in currentPage.blocks" :key="block.id">
      <div v-if="block.enabled" :class="bgColor(index)">
        <block-preview
          :block="block"
          class="m-auto w-xs lg:w-5xl py-5 lg:px-5"
        ></block-preview>
      </div>
    </div>
    <div v-if="currentPage.gallery.length > 0">
      <image-gallery :images="currentPage.gallery"></image-gallery>
    </div>
  </div>
</template>

<script>
import indexMixin from "./mixins/indexMixin.js";

export default {
  mixins: [indexMixin],
  methods: {
    bgColor(index) {
      if (!(index % 2)) {
        return "w-full bg-primary-gray ";
      }
    },
  },
};
</script>