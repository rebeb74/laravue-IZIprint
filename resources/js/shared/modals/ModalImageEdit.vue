<template>
  <div
    class="fixed top-0 right-0 left-0 bottom-0 flex justify-center items-center"
  >
    <div
      class="fixed top-0 right-0 left-0 bottom-0 bg-opacity-80 bg-primary z-40"
      @click="closeModal()"
    ></div>
    <div class="modal-shadow z-50 card w-xs lg:w-lg relative m-0">
      <div class="card-title">Mofifier les balises</div>
      <div>
        <base-input
          name="alt_tag"
          label="Balise Alt (important)"
          v-model="altTag"
          class="py-1"
        ></base-input>
        <base-input
          name="title_tag"
          label="Balise Title"
          v-model="title"
          class="py-1"
        ></base-input>
        <base-button
          text="Enregistrer"
          @button-click="editImage()"
          class="pb-2 mt-6"
        ></base-button>
      </div>
      <div class="absolute -top-3.5 -right-3.5 bg-primary modal-shadow w-8 h-8 rounded-full">
      </div>
      <div class="absolute -top-4 -right-4 cursor-pointer" @click="closeModal()">
        <i class="text-primary-dark far fa-times-circle text-4xl rounded-full"></i>
      </div>
    </div>
  </div>
</template>

<script>
import BaseButton from "../base-components/BaseButton.vue";
import BaseInput from "../base-components/BaseInput.vue";

export default {
  components: {
    BaseButton,
    BaseInput,
  },
  props: {
    image: {
      type: Object
    }
  },
  emits: ["close", "edit-image"],
  data() {
    return {
      altTag: this.image.alt_tag,
      title: this.image.title_tag,
    };
  },
  computed: {},
  methods: {
    closeModal() {
      this.$emit('close');
    },
    editImage() {
      this.$emit("edit-image", {...this.image, alt_tag: this.altTag, title_tag: this.title});
    },
  },
};
</script>

<style scoped>
.modal-shadow {
  box-shadow: 2px 2px 20px 1px #1d1d1b;
}
</style>