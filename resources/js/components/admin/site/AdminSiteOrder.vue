<template>
  <div class="card">
    <div class="card-title">Ordre des pages</div>
    <div class="card-subtitle">Glissez et déposez les pages pour changer l'ordre</div>
    <div>
      <draggable
        v-model="pages"
        @change="change"
        class="py-5 flex flex-col lg:flex-row justify-start items-center"
      >
        <transition-group>
          <div
            v-for="page in $store.state.pages"
            :key="page.id"
            class="
              px-3
              py-2
              my-1
              lg:my-0
              lg:mx-1
              rounded-lg
              focus:cursor-pointer
               lg:px-3 lg:py-2
               hover:bg-secondary-dark 
               bg-primary-dark 
               text-gray-200 
               text-center 
               cursor-pointer
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