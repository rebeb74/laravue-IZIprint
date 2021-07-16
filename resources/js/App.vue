<template>
  <metainfo>
    <template v-slot:title="{ content }">{{
      content ? `${content} | IZIprint` : `IZIprint`
    }}</template>
  </metainfo>
  <router-view v-if="store.state.pagesAreLoaded"></router-view>
</template>

<script>
import { useMeta } from "vue-meta";
import { useStore } from "vuex";
import { useRoute } from 'vue-router';

export default {
  setup() {

      const store = useStore();
      
      const myTitle = store.state.title;
    useMeta({
      title: 'myTitle',
      htmlAttrs: { lang: "fr", amp: true },
      // meta: [
      //   { test: "test" },
      //   { name: "viewport", content: "width=device-width, initial-scale=1" },
      //   {
      //     property: "og:title",
      //     content: "Test title",
      //     vmid: "og:title",
      //   },
      // ],
    });

    return { store }
  },
  beforeCreate() {
    this.$store.dispatch("loadPages");
    this.$store.dispatch('loadSiteData');
  },
};
</script>

