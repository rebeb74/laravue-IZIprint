<template>
  <div class="card">
    <div class="card-title">
      {{ block.title }}
    </div>
    <div class="card-subtitle pb-2">
      {{ block.subtitle }}
    </div>
    <div class="">
      <div class="text-gray-200 pb-4 content-none clear-both table">
        <div v-if="block.image_upload" :class="isImageOnRight">
          <a :href="block.image_upload.url" target="_blank"
            ><img
              :src="block.image_upload.url"
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
          return this.block.image_on_right ? "float-right max-w-72 pl-4 pt-2" : "float-left max-w-72 pr-4 pt-2";
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