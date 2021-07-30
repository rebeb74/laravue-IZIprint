<template>
  <div class="card p-2 lg:p-6 text-center lg:text-left">
    <!-- <teleport to="body"> -->
    <teleport to="body">
      <modal-image-import
        class="z-50"
        v-if="isModalVisible"
        @close="closeModal()"
        @selected-file="importFile($event)"
      >
      </modal-image-import>
      <modal-image-edit
        class="z-50"
        v-if="isEditModalVisible"
        @close="closeEditModal()"
        @edit-image="editImage($event)"
        :image="isEditingImage"
      >
      </modal-image-edit>
    </teleport>
    <!-- </teleport> -->
    <div class="flex flex-col lg:flex-row justify-between items-center mb-4">
      <div class="card-title py-2">
        Gallerie d'images de la page {{ currentPage.name }}
      </div>
      <base-button
        type="button"
        @button-click="showModal()"
        text="Ajouter une image"
        class="py-2"
      >
      </base-button>
    </div>
    <div
      v-if="gallery.length === 0"
      class="text-gray-200 italic w-full text-center"
    >
      Aucune image pour l'instant...
    </div>
    <div class="flex flex-col lg:flex-row justify-start items-center flex-wrap">
      <div
        v-for="image in gallery"
        :key="image.id"
        class="flex lg:px-3 py-2 lg:py-3"
      >
        <div
          class="
            w-72
            h-96
            rounded-xl
            bg-primary-light
            flex
            justify-center
            items-center
            flex-col
          "
        >
          <a :href="image.url"
            ><img
              class="max-w-64 max-h-64"
              :src="image.thumb_url"
              :alt="image.alt_tag"
          /></a>
          <div
            class="
              text-gray-200
              italic
              py-2
              break-words
              w-full
              px-4
              text-center
              h-14
              text-sm
            "
          >
            {{ image.name }}
          </div>
          <div class="flex justify-center items-center">
            <base-button
              type="button"
              icon="edit"
              @button-click="showModalEdit(image)"
              text=""
              class="px-2"
            >
            </base-button>
            <base-button
              type="button"
              icon="delete"
              @button-click="deleteImage(image.id)"
              text=""
              class="px-2"
            >
            </base-button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import BaseButton from "../../../shared/base-components/BaseButton.vue";
import ModalImageImport from "../../../shared/modals/ModalImageImport.vue";
import ModalImageEdit from "../../../shared/modals/ModalImageEdit.vue";
import {
  createImageUpload,
  deleteImageUploadById,
  updateImageUpload,
} from "../../../shared/db/imageUploadService";

export default {
  components: {
    BaseButton,
    ModalImageImport,
    ModalImageEdit,
  },
  data() {
    return {
      gallery: [],
      isModalVisible: false,
      isEditModalVisible: false,
      isEditingImage: "",
    };
  },
  computed: {
    currentPageKey() {
      return this.$route.params.key;
    },
    currentPage() {
      return this.$store.getters.getPage(this.currentPageKey);
    },
    uploadedImage() {
      return this.$store.state.uploadedImage;
    },
  },
  methods: {
    showModalEdit(image) {
      this.isEditingImage = image;
      this.isEditModalVisible = true;
    },
    showModal() {
      this.isModalVisible = true;
    },
    closeEditModal() {
      this.isEditModalVisible = false;
    },
    closeModal() {
      this.isModalVisible = false;
    },
    editImage(image) {
      this.$store.commit("setIsLoading");
      updateImageUpload(image)
        .then((result) => {
          this.closeEditModal();
        })
        .catch((error) => {
          console.log(error);
        })
        .then(() => {
          this.$store.commit("setIsLoading");
        });
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
          this.gallery.push(result.data.data);
          const updatedPage = { ...this.currentPage, gallery: this.gallery };
          this.$store.dispatch("updatePage", updatedPage);
          this.closeModal();
        })
        .catch((error) => {
          console.log(error);
        })
        .then(() => {
          this.$store.commit("setIsLoading");
        });
    },
    deleteImage(id) {
      deleteImageUploadById(id)
        .then((result) => {
          this.gallery = this.gallery.filter((image) => image.id !== id);
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
  watch: {
    currentPageKey(val) {
      if (val) {
        this.gallery = this.currentPage.gallery;
      }
    },
    currentPage(val) {
      if (val) {
        this.gallery = this.currentPage.gallery;
      }
    },
  },
  created() {
    this.gallery = this.currentPage.gallery;
  },
};
</script>