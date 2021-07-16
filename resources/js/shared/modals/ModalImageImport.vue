<template>
  <div
    class="fixed top-0 right-0 left-0 bottom-0 flex justify-center items-center"
  >
    <div
      class="fixed top-0 right-0 left-0 bottom-0 bg-opacity-80 bg-primary z-49"
      @click="closeModal()"
    ></div>
    <div class="modal-shadow z-50 card w-xs lg:w-lg">
      <div class="card-title">Importer une image</div>
      <div class="card-subtitle pb-6">
        Choisissez une image et cliquez sur Importer
      </div>
      <input
        ref="fileInput"
        type="file"
        class="hidden"
        @change="selectFile($event)"
      />
      <base-button
        @click="$refs.fileInput.click()"
        text="Choisir une image"
        class=""
        v-if="!selectedFile"
      ></base-button>
      <div v-if="!!selectedFile" class="text-gray-200 py-6">
        <div class="mb-4 text-gray-200">Voulez-vous importer cette image ?</div>
        <div class="text-secondary">
          {{ selectedFile[0].name }}
        </div>
      </div>
      <div v-if="!!selectedFile">
        <base-input name="name" :value="name" label="Nom (requis)" @value-change="getName($event)"></base-input>
        <base-input name="alt_tag" label="Balise Alt (important)" @value-change="getAltTag($event)"></base-input>
        <base-input name="title_tag" label="Balise Title" @value-change="getTitle($event)"></base-input>
        <base-button
          text="Oui, importer cette image"
          @click="importFile()"
          class="pb-2"
        ></base-button>
        <base-button
          @click="$refs.fileInput.click()"
          text="Non, choisir une autre image"
          class="py-2"
          color="bg-secondary"
        ></base-button>
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
  data() {
    return {
      selectedFile: null,
      name: '',
      altTag: '',
      title: ''
    };
  },
  emits: ["close", "selected-file"],
  methods: {
    selectFile(event) {
      this.selectedFile = event.target.files;
      this.name = this.selectedFile[0].name.split('.').shift();
    },
    closeModal() {
      this.$emit("close");
    },
    importFile() {
      this.$emit("selected-file", {file: this.selectedFile, name: this.name, altTag: this.altTag, title: this.title});
    },
    getName(event) {
        this.name = event.value;
    },
    getAltTag(event) {
        this.altTag = event.value;
    },
    getTitle(event) {
        this.title = event.value;
    },
  },
};
</script>

<style scoped>
.modal-shadow {
  box-shadow: 2px 2px 20px 1px;
}
</style>