<template>
  <div
    class="fixed top-0 right-0 left-0 bottom-0 flex justify-center items-center"
  >
    <div
      class="fixed top-0 right-0 left-0 bottom-0 bg-opacity-80 bg-primary z-40"
      @click="closeModal()"
    ></div>
    <div class="modal-shadow z-50 card w-xs lg:w-lg relative m-0">
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
      <div v-if="!!selectedFile" class="text-gray-200 py-4 break-words">
        <div class="mb-4 text-gray-200">Voulez-vous importer cette image ?</div>
        <div class="text-secondary w-full">
          {{ selectedFile[0].name }}
        </div>
      </div>
      <div v-if="!!selectedFile">
        <base-input
          name="name"
          :value="name"
          label="Nom (requis)"
          v-model="name"
          :inputIsInvalid="validateName(name)"
          invalidText="Le nom est requis et ne doit pas contenir de caractères spéciaux"
          class="py-1"
        ></base-input>
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
          :isDisabled="validateName(name)"
          text="Oui, importer cette image"
          @button-click="importFile()"
          class="pb-2 mt-6"
        ></base-button>
        <base-button
          @button-click="chooseAnotherImage()"
          text="Non, choisir une autre image"
          class="py-2"
          color="bg-secondary"
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
  emits: ["close", "selected-file"],
  data() {
    return {
      selectedFile: null,
      name: "",
      altTag: "",
      title: "",
    };
  },
  computed: {},
  methods: {
    closeModal() {
      this.selectedFile = null;
      this.$emit('close');
    },
    validateName(data) {
      return /[^a-zA-Z0-9 _]/.test(data) || !data;
    },
    selectFile(event) {
      if (event.target.files.length > 0) {
        this.selectedFile = event.target.files;
        this.name = this.selectedFile[0].name.split(".").shift();
      }
    },
    importFile() {
      this.$emit("selected-file", {
        file: this.selectedFile,
        name: this.name,
        altTag: this.altTag,
        title: this.title,
      });
    },
    chooseAnotherImage() {
      this.selectedFile = null;
      this.name = "";
      this.$refs.fileInput.click();
    },
  },
};
</script>

<style scoped>
.modal-shadow {
  box-shadow: 2px 2px 20px 1px #1d1d1b;
}
</style>