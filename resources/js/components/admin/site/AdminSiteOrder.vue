<template>
  <div class="card">
    <div class="card-title">Ordre des pages</div>
    <div class="card-subtitle">Glissez et déposez les pages pour changer l'ordre</div>
    <div>
      <draggable
        v-model="pages"
        @change="change"
        class="py-5 flex justify-start items-center"
      >
        <transition-group>
          <div
            v-for="page in $store.state.pages"
            :key="page.id"
            class="
              px-3
              py-2
              mx-1
              bg-primary-light
              rounded-lg
              cursor-pointer
              focus:cursor-pointer
            "
          >
            {{ page.name }}
          </div>
        </transition-group>
      </draggable>
    </div>
  </div>
</template>

<script>
import { ref } from "vue";
import { useStore } from "vuex";
import { VueDraggableNext } from "vue-draggable-next";
import { updatePage } from "../../../shared/db/pagesService";

export default {
  components: {
    draggable: VueDraggableNext,
  },
  setup() {
    const store = useStore();
    const pages = ref(store.state.pages);

    const change = () => {
      const orderedPages = [];
      pages.value.forEach((page, index) => {
        orderedPages.push({ ...page, order: index });
      });
      store.commit("setPages", orderedPages);

      orderedPages.forEach((page) => {
        updatePage(page)
          .then(() => {})
          .catch((error) => {
            console.log(error);
          });
      });
    };

    return {
      pages,
      change,
    };
  },
};
</script>