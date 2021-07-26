<template>
  <div
    class="
      flex flex-col
      w-80
      lg:w-full
      justify-start
      items-center
      overflow-hidden
      bg-primary
      p-5
    "
    :class="[blockIsOpenedHeight, positionClass]"
  >
    <!-- <teleport to="body"> -->
    <teleport to="body">
      <modal-image-import
        class="z-50"
        v-if="isModalVisible"
        @close="closeModal()"
        @selected-file="importFile($event)"
      >
      </modal-image-import>
    </teleport>
    <!-- </teleport> -->
    <div
      class="w-full flex justify-center items-center mb-4 cursor-pointer"
      @click="toggleBlock()"
    >
      <div class="w-4/6 text-gray-200 flex flex-row justify-start items-center">
        <i class="fa fa-align-justify handle"></i>
        <div class="flex flex-col lg:flex-row justify-center items-center">
          <p class="uppercase px-4">
            {{ oldTitle }}
          </p>
          <span v-if="edited" class="text-secondary-light">Modifié</span>
        </div>
      </div>
      <div class="w-1/6 text-center" :class="isEnabledColor">
        {{ isEnabled }}
      </div>
      <div class="w-1/6 flex justify-end items-center">
        <div class="text-3xl text-gray-200 pt-3" :class="rotateArrow">
          <svg
            aria-hidden="true"
            focusable="false"
            data-prefix="fas"
            data-icon="angle-down"
            class="svg-inline--fa fa-angle-down fa-w-10"
            role="img"
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 320 512"
          >
            <path
              fill="currentColor"
              d="M282.082,76.511l-14.274-14.273c-1.902-1.906-4.093-2.856-6.57-2.856c-2.471,0-4.661,0.95-6.563,2.856L142.466,174.441 L30.262,62.241c-1.903-1.906-4.093-2.856-6.567-2.856c-2.475,0-4.665,0.95-6.567,2.856L2.856,76.515C0.95,78.417,0,80.607,0,83.082 c0,2.473,0.953,4.663,2.856,6.565l133.043,133.046c1.902,1.903,4.093,2.854,6.567,2.854s4.661-0.951,6.562-2.854L282.082,89.647 c1.902-1.903,2.847-4.093,2.847-6.565C284.929,80.607,283.984,78.417,282.082,76.511z"
            ></path>
          </svg>
        </div>
      </div>
    </div>
    <div class="w-full flex justify-start items-center"></div>
    <base-toggle
      v-model="updatedBlock.enabled"
      activeColor="bg-success-light"
      notActiveColor="bg-primary-light"
      :width="10"
    ></base-toggle>
    <div class="flex w-full space-x-4">
      <base-input
        class="flex-1"
        v-model="updatedBlock.title"
        name="title"
        label="Titre"
        :maxlength="60"
        invalidText="Le titre est requis."
      ></base-input>
      <base-input
        class="flex-1"
        v-model="updatedBlock.subtitle"
        name="subtitle"
        label="Sous-titre"
        :maxlength="60"
      ></base-input>
    </div>
    <div class="w-full flex space-x-4">
      <base-text-area
        :rows="4"
        v-model="updatedBlock.content"
        name="content"
        label="Texte"
        class="flex-1"
      ></base-text-area>
    </div>
    <div class="flex w-full space-x-4 justify-start items-center">
      <base-select
        class="flex-1"
        v-model="updatedBlock.int_link"
        name="intBtn"
        label="Bouton vers page interne"
        :maxlength="60"
        :options="{ ...$store.state.pages }"
      ></base-select>
      <base-input
        v-if="updatedBlock.int_link"
        class="flex-1"
        v-model="updatedBlock.int_btn"
        name="intLink"
        label="Nom du bouton"
        :maxlength="60"
      ></base-input>
    </div>
    <div class="flex w-full space-x-4">
      <base-input
        class="flex-1"
        v-model="updatedBlock.ext_link"
        name="extBtn"
        label="Lien vers page externe"
        :maxlength="60"
      ></base-input>
      <base-input
        v-if="updatedBlock.ext_link"
        class="flex-1"
        v-model="updatedBlock.ext_btn"
        name="extLink"
        label="Nom du bouton"
        :maxlength="60"
      ></base-input>
    </div>
    <div class="flex w-full space-x-4 py-4">
      <div
        class="w-1/2 flex justify-center items-center"
        v-if="updatedBlock.image_upload"
      >
        <img :src="updatedBlock.image_upload.thumb_url" alt="" />
      </div>
      <div
        v-if="!updatedBlock.image_upload"
        class="w-1/2 flex justify-center items-center"
      >
        <div class="text-sm italic text-gray-200">
          Aucune image pour l'instant
        </div>
      </div>
      <div class="w-1/2 flex flex-col space-y-4 justify-center items-center">
        <base-button
          type="button"
          @button-click="showModal()"
          :text="isImage"
          class="w-full"
        >
        </base-button>
        <div
          class="hidden lg:flex w-full flex-col lg:flex-row justify-between items-start"
          v-if="updatedBlock.image_upload"
        >
          <div class="text-gray-200 px-2 py-2">Position de l'image :</div>
          <div class="flex justify-center items-center">
            <div class="text-gray-200 px-4 py-2">Gauche</div>
            <base-toggle
              v-model="updatedBlock.image_on_right"
              activeColor="bg-primary-light"
              notActiveColor="bg-primary-light"
              :width="20"
            ></base-toggle>
            <div class="text-gray-200 px-4 py-2">Droite</div>
          </div>
        </div>
        <base-button
          class="w-full"
          v-if="updatedBlock.image_upload"
          text="Supprimer l'image"
          color="bg-secondary"
          @button-click="deleteImage()"
        ></base-button>
      </div>
    </div>
    <div class="flex justify-center items-center flex-col lg:hidden">
      <div class="text-gray-200 px-2 py-2">Position de l'image :</div>
      <div class="flex justify-center items-center">
        <div class="text-gray-200 px-4 py-2">Gauche</div>
        <base-toggle
          class=""
          v-model="updatedBlock.image_on_right"
          activeColor="bg-primary-light"
          notActiveColor="bg-primary-light"
          :width="10"
        ></base-toggle>
        <div class="text-gray-200 px-4 py-2">Droite</div>
      </div>
    </div>
    <div class="flex w-full">
      <div class="w-1/2"></div>
    </div>

    <div class="w-full py-4">
      <div class="card-subtitle">Prévisualisation du bloc</div>
      <div class="px-4 pt-4 pb-1 bg-primary-light rounded-xl my-4">
        <block-preview :block="updatedBlock"></block-preview>
      </div>
    </div>

    <div class="w-full flex space-x-4">
      <base-button
        class="flex-1"
        text="Enregistrer"
        :isDisabled="
          validateRequired(updatedBlock.title) ||
          validateRequired(updatedBlock.content)
        "
        @button-click="saveBlock()"
      ></base-button>
      <base-button
        class="flex-1"
        text="Supprimer le bloc"
        color="bg-secondary"
        @button-click="deleteBlock()"
      ></base-button>
    </div>
  </div>
</template>

<script>
import BaseInput from "./BaseInput.vue";
import BaseTextArea from "./BaseTextArea.vue";
import BaseSelect from "./BaseSelect.vue";
import BaseToggle from "./BaseToggle.vue";
import BlockPreview from "./BlockPreview.vue";
import BaseButton from "./BaseButton.vue";
import ModalImageImport from "../modals/ModalImageImport.vue";
import {
  createImageUpload,
  deleteImageUploadById,
} from "../db/imageUploadService";
import { updateBlock, deleteBlockById } from "../db/blockService";

export default {
  components: {
    BaseInput,
    BaseTextArea,
    BaseButton,
    BaseSelect,
    BaseToggle,
    ModalImageImport,
    BlockPreview,
  },
  props: {
    block: {},
    position: {
      type: String,
    },
  },
  data() {
    return {
      edited: false,
      oldBlock: { ...this.block },
      oldTitle: "",
      updatedBlock: null,
      isModalVisible: false,
      blockIsOpened: false,
    };
  },
  computed: {
    compBlock() {
      return this.updatedBlock;
    },
    rotateArrow() {
      return this.blockIsOpened
        ? "transform rotate-180 transition"
        : "transition";
    },
    positionClass() {
      if (this.position === "first") {
        if (this.blockIsOpened) {
          return "rounded-t-lg border-b border-gray-200 mb-4 shadow-card";
        } else {
          return "rounded-t-lg";
        }
      } else if (this.position === "last") {
        if (this.blockIsOpened) {
          return "rounded-t-lg border-b border-gray-200 mt-4 shadow-card";
        } else {
          return "rounded-b-lg shadow-inner";
        }
      } else {
        if (this.blockIsOpened) {
          return "rounded-t-lg my-4 shadow-card";
        } else {
          return "shadow-inner";
        }
      }
    },
    isImage() {
      return this.updatedBlock.image_upload ? "Changer l'image" : "Importer une image";
    },
    isEnabled() {
      return this.updatedBlock.enabled ? "Activé" : "Désactivé";
    },
    isEnabledColor() {
      return this.updatedBlock.enabled
        ? "text-success-light"
        : "text-secondary-light";
    },
    uploadedImage() {
      return this.$store.state.uploadedImage;
    },
    currentPage() {
      return this.$store.getters.getPage(this.currentPageKey);
    },
    currentPageKey() {
      return this.$route.params.key;
    },
    blockIsOpenedHeight() {
      return this.blockIsOpened
        ? "max-h-800 transition-max-height duration-500"
        : "max-h-20  transition-max-height duration-500";
    },
  },
  methods: {
    toggleBlock() {
      this.blockIsOpened = !this.blockIsOpened;
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
          this.deleteOldUploadedImage();
          this.$store.commit("setUploadedImage", result.data.data);

          this.updatedBlock.image_upload = result.data.data;

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
            this.$store.commit("setUploadedImage", null);
          })
          .catch((error) => {
            console.log(error);
          });
      }
    },
    validateRequired(data) {
      return data.trim() ? false : true;
    },
    deleteImage() {
      deleteImageUploadById(this.updatedBlock.image_upload.id)
        .then((result) => {
          this.updatedBlock.image_upload = null;
          this.$store.commit("setUploadedImage", null);
        })
        .catch((error) => {
          console.log(error);
        });
    },
    saveBlock() {
      this.$store.commit("setIsLoading");

      if (this.updatedBlock.image_upload) {
        this.updatedBlock.image_upload_id = this.updatedBlock.image_upload.id
        this.$store.commit("setUploadedImage", null);
      }

      updateBlock(this.updatedBlock)
        .then((result) => {
          this.oldBlock = { ...result.data.data };
          this.updatedBlock = result.data.data;
        })
        .catch((error) => {
          console.log("create block error", error);
        })
        .then(() => {
          this.$store.commit("setIsLoading");
        });
    },
    deleteBlock() {
      this.$store.commit("setIsLoading");
      deleteBlockById(this.updatedBlock.id)
        .then((result) => {
          this.$store.dispatch("loadPages");
        })
        .catch((error) => {
          console.log("delete block error", error);
        })
        .then(() => {
          this.$store.commit("setIsLoading");
        });
    },
  },
  watch: {
    compBlock: {
      handler(val) {
        if (
          val.content !== this.oldBlock.content ||
          val.enabled !== this.oldBlock.enabled ||
          val.ext_btn !== this.oldBlock.ext_btn ||
          val.int_btn !== this.oldBlock.int_btn ||
          val.ext_link !== this.oldBlock.ext_link ||
          val.int_link !== this.oldBlock.int_link ||
          val.image_on_right !== this.oldBlock.image_on_right ||
          val.subtitle !== this.oldBlock.subtitle ||
          val.title !== this.oldBlock.title ||
          val.image_upload?.id !== this.oldBlock.image_upload?.id
        ) {
          this.edited = true;
        } else {
          this.edited = false;
        }
      },
      deep: true,
    },
  },
  created() {
    this.oldTitle = this.block.title;
    this.updatedBlock = this.block;
  },
};
</script>