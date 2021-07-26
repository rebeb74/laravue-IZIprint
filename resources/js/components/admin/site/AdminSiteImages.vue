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
      <div class="card-title py-2">Gestion du stockage d'images</div>
      <base-button
        type="button"
        @button-click="showModal()"
        text="Ajouter une image"
        class="py-2"
      >
      </base-button>
    </div>
    <div
      v-if="images.length === 0"
      class="text-gray-200 italic w-full text-center"
    >
      Aucune image pour l'instant...
    </div>
    <div class="flex flex-col lg:flex-row justify-start items-center flex-wrap">
      <div
        v-for="image in images"
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
          <div v-if="image.block_id || image.page_id" class="text-gray-200 italic py-3">
            {{ useCase(image) }}
          </div>
          <div v-else class="text-secondary-light italic py-3">
              Inutilisée
          </div>
          <div class="flex justify-center items-center py-1">
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
  getImageUploads,
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
      images: [],
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
    useCase(image) {
      return image.block_id
        ? "Utilisée dans un bloc"
        : image.page_id
        ? "Utilisée dans une gallerie de page"
        : null;
    },
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
          this.images.push(result.data.data);
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
          this.images = this.images.filter((image) => image.id !== id);
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
  created() {
    getImageUploads().then((result) => {
      this.images = result.data.data;
    });
  },
};
</script>