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
import indexMixin from './mixins/indexMixin.js';

export default {
  mixins: [indexMixin]
}
</script>