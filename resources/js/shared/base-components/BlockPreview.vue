<template>
  <div class="py-8">
    <h2 class="text-secondary-light uppercase text-xl font-bold" :class="isTitleOnRight">
      {{ block.title }}
    </h2>
    <h3 class="italic font-light pb-2">
      {{ block.subtitle }}
    </h3>
    <div class="">
      <div class="text-gray-200 pb-4 content-none clear-both table text-justify">
        <div v-if="block.image_upload" :class="isImageOnRight">
          <a :href="block.image_upload.url" target="_blank"
            ><img
              :src="block.image_upload.thumb_url"
              :alt="block.image_upload.alt_tag"
          /></a>
        </div>
        <p>
          {{ block.content }}
        </p>
      </div>
    </div>
    <div class="flex justify-between items-center">
        <base-button
        v-if="block.int_link && block.int_btn"
        class=""
        :text="block.int_btn"
        @button-click="routerLink()"
      ></base-button>
      <base-button
      v-if="block.ext_link && block.ext_btn"
        class=""
        :text="block.ext_btn"
        @button-click="hrefLink()"
      ></base-button>
    </div>
  </div>
</template>

<script>
import BaseButton from './BaseButton.vue';

export default {
    components: {
        BaseButton
    },
  props: {
    block: {},
  },
  computed: {
      isImageOnRight() {
          return this.block.image_on_right ? "float-right max-w-72 pl-6 py-2" : "float-left max-w-72 pr-6 py-2";
      },
      isTitleOnRight() {
          return this.block.image_on_right ? "" : "text-right";
      },

  },
  methods: {
      routerLink() {
          this.$router.push('/' + this.block.int_link);
      },
      hrefLink() {
          window.open(this.block.ext_link, '_blank');
      }
  }
};
</script>