<template>
  <div class="card z-0" v-if="$store.state.siteDataIsLoaded">
    <h1 class="card-title">Général</h1>
    <h2 class="card-subtitle">Réglages généraux du site</h2>
    <base-input
      v-model="title"
      name="title"
      label="Titre du site (max 60 car.)"
      class=""
      :maxlength="60"
      invalidText="Le titre est requis"
      :inputIsInvalid="validateTitle($store.state.siteData.title)"
    ></base-input>

    <base-input
      v-model="suffix"
      name="suffix"
      label="Suffixe du titre"
      class=""
      :maxlength="60"
    ></base-input>

    <base-text-area
      :rows="2"
      :maxlength="150"
      v-model="description"
      name="description"
      label="Description (entre 70 et 150 car.)"
      class=""
      invalidText="La description doit être comprise entre 70 et 150 caractères"
      :inputIsInvalid="validateDescription($store.state.siteData.description)"
    ></base-text-area>

    <div class="mb-6 card-subtitle pt-4">
      Image pour les liens venant de Facebook et Twitter
    </div>
    <div class="flex lg:justify-between flex-col lg:flex-row items-center pb-6">
      <div
        v-if="siteData.social_image"
        class="w-full lg:w-1/2 flex justify-center items-center"
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
      <div class="w-2/3 lg:w-1/2 flex m-2 flex-col justify-center items-center">
        <base-button
          type="button"
          @button-click="showModal()"
          :text="isImage"
          class="w-full"
        >
        </base-button>
      </div>
    </div>
    <teleport to="body">
      <modal-image-import
        class="z-50"
        v-if="isModalVisible"
        @close="closeModal()"
        @selected-file="importFile($event)"
      >
      </modal-image-import>
    </teleport>

    <base-button
      class="w-full"
      text="Enregistrer"
      :isDisabled="validateTitle(title) || validateDescription(description)"
      @button-click="saveGeneral()"
    ></base-button>
  </div>
</template>

<script>
import BaseInput from "../../../shared/base-components/BaseInput.vue";
import BaseTextArea from "../../../shared/base-components/BaseTextArea.vue";
import BaseButton from "../../../shared/base-components/BaseButton.vue";
import ModalImageImport from "../../../shared/modals/ModalImageImport.vue";
import { createSiteData } from "../../../shared/db/siteDataService";
import { createImageUpload, deleteImageUploadById } from "../../../shared/db/imageUploadService";

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
    suffix: {
      get() {
        return this.siteData.suffix;
      },
      set(value) {
        this.$store.commit("setSiteData", {
          ...this.siteData,
          suffix: value,
        });
      },
    },
    title: {
      get() {
        return this.$store.state.siteData.title;
      },
      set(value) {
        this.$store.commit("setSiteData", {
          ...this.siteData,
          title: value,
        });
      },
    },
    description: {
      get() {
        return this.$store.state.siteData.description;
      },
      set(value) {
        this.$store.commit("setSiteData", {
          ...this.siteData,
          description: value,
        });
      },
    },
  },
  methods: {
    saveGeneral() {
      this.$store.commit("setIsLoading");

      createSiteData(this.$store.state.siteData)
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
      createImageUpload(formData, {
        headers: {
          "Content-Type": "multipart/form-data",
        },
      })
        .then((result) => {
          console.log(result);
          this.deleteOldUploadedImage();
          this.$store.commit("setUploadedImage", result.data.data);

          this.$store.commit("setSiteData", {
            ...this.siteData,
            social_image: result.data.data,
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
        deleteImageUploadById(this.uploadedImage.id)
          .then((result) => {
            console.log(result);
            this.$store.commit("setUploadedImage", null);
          })
          .catch((error) => {
            console.log(error);
          });
      }
    },
    validateTitle(data) {
      return data.trim() ? false : true;
    },
    validateDescription(data) {
      return data.length > 70 ? false : true;
    },
  },

  unmounted() {
    this.deleteOldUploadedImage();
  },
};
</script>

