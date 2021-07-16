<template>
  <div class="card" v-if="$store.state.siteDataIsLoaded">
    <h1 class="card-title">Général</h1>
    <h2 class="card-subtitle">Réglages généraux du site</h2>
    <base-input
      :value="siteData.title"
      @value-change="setTitle($event)"
      name="title"
      label="Titre du site (max 60 car.)"
      class="mb-8"
      :maxlength="60"
    ></base-input>

    <base-input
      :value="siteData.suffix"
      @value-change="setSuffix($event)"
      name="suffix"
      label="Suffixe du titre"
      class="mb-8"
      :maxlength="60"
    ></base-input>

    <base-text-area
      :rows="2"
      :maxlength="150"
      :value="siteData.description"
      @value-change="setDescription($event)"
      name="description"
      label="Description (entre 70 et 150 car.)"
      class="mb-8"
    ></base-text-area>

    <div class="mb-6 card-subtitle">
      Image pour les liens venant de Facebook et Twitter
    </div>
    <div class="flex justify-between items-center pb-6">
      <div
        v-if="siteData.social_image"
        class="w-1/2 flex justify-center items-center"
      >
        <img
          :src="siteData.social_image.thumb_url"
          :alt="siteData.social_image.alt_tag"
        />
      </div>
      <div
        v-if="!siteData.social_image"
        class="w-1/2 flex justify-center items-center"
      >
        <div class="text-sm italic text-gray-200">
          Aucune image pour l'instant
        </div>
      </div>
      <div class="w-1/2 flex flex-col justify-center items-center">
        <base-button
          type="button"
          @click="showModal()"
          :text="isImage"
          class="w-full"
        >
        </base-button>
      </div>
    </div>
    <modal-image-import
      v-if="isModalVisible"
      @close="closeModal()"
      @selected-file="importFile($event)"
    >
    </modal-image-import>


    <base-button
      class="w-full"
      text="Enregistrer"
      @click="saveGeneral()"
    ></base-button>

  </div>
</template>

<script>
import BaseInput from "../../../shared/base-components/BaseInput.vue";
import BaseTextArea from "../../../shared/base-components/BaseTextArea.vue";
import BaseButton from "../../../shared/base-components/BaseButton.vue";
import ModalImageImport from "../../../shared/modals/ModalImageImport.vue";
import axios from "axios";

export default {
  data() {
    return {
      isModalVisible: false,
    };
  },
  components: {
    BaseInput,
    BaseTextArea,
    BaseButton,
    ModalImageImport,
  },
  computed: {
    siteData() {
      return this.$store.state.siteData;
    },
    isImage() {
      return this.siteData.social_image
        ? "Changer l'image"
        : "Importer une image";
    },
    uploadedImage() {
      return this.$store.state.uploadedImage;
    },
  },
  methods: {
    setSuffix(event) {
      this.$store.commit("setSiteData", {
          ...this.siteData,
          suffix: event,
        });
    },
    setTitle(event) {
      this.$store.commit("setSiteData", {
          ...this.siteData,
          title: event,
        });
    },
    setDescription(event) {
      this.$store.commit("setSiteData", {
          ...this.siteData,
          description: event,
        });
    },
    saveGeneral() {
      this.$store.commit("setIsLoading");
      
      axios
        .post("/api/site", this.$store.state.siteData)
        .then(() => {})
        .catch((error) => {
          console.log("axios", error);
        })
        .then(() => {
          this.$store.commit("setIsLoading");
        });
    },
    showModal() {
      this.isModalVisible = true;
    },
    closeModal() {
      this.isModalVisible = false;
    },
    importFile(selectedFile) {
      let formData = new FormData();
      formData.append("file", selectedFile.file[0]);
      formData.append("name", selectedFile.name);
      formData.append("original_name", selectedFile.file[0].name);
      formData.append("alt_tag", selectedFile.altTag);
      formData.append("title_tag", selectedFile.title);
      this.$store.commit("setIsLoading");
      axios
        .post("/api/upload", formData, {
          headers: {
            "Content-Type": "multipart/form-data",
          },
        })
        .then((result) => {
          console.log(result)
          this.deleteOldUploadedImage();
          this.$store.commit("setUploadedImage", result.data);

          this.$store.commit("setSiteData", {
            ...this.siteData,
            social_image: result.data,
          });
          this.closeModal();
        })
        .catch((error) => {
          console.log(error);
        })
        .then(() => {
          this.$store.commit("setIsLoading");
        });
    },
    deleteOldUploadedImage() {
      if (this.uploadedImage) {
        axios
          .delete("/api/upload/" + this.uploadedImage.id)
          .then((result) => {
            console.log(result);
            this.$store.commit("setUploadedImage", null);
          })
          .catch((error) => {
            console.log(error);
          });
      }
    },
  },
  unmounted() {
    this.deleteOldUploadedImage();
  },
};
</script>

