<template>
  <div class="w-full h-full">
    <div class="flex flex-col w-full justify-center items-center">
      <div class="card">
        <div class="card-title">Gestion des blocs - {{ currentPage.name }}</div>
        <p class="text-gray-200 py-4">Un bloc est un ensemble de texte, image et bouton que vous pouvez ajouter à votre page.</p>
      <base-button
        class="w-full pb-4"
        text="Nouveau Bloc"
        :isDisabled="false"
        @button-click="addBlock()"
      ></base-button>
      </div>
      <draggable
        v-model="currentPage.blocks"
        @change="change()"
        class="py-5 flex flex-col justify-start items-center"
        handle=".handle"
      >
        <transition-group>
          <base-block
            :block="block"
            v-for="(block, index) in currentPage.blocks"
            :key="block.id"
            :position="position(index)"
          ></base-block>
        </transition-group>
      </draggable>
      <div>
        <p v-if="currentPage.blocks.length === 0" class="text-gray-200 italic">Vous n'avez pas encore de bloc pour cette page...</p>
      </div>
    </div>
    <div v-if="isLoading" class="w-full h-full">
      <div
        class="
          fixed
          top-0
          right-0
          left-0
          bottom-0
          bg-opacity-80 bg-primary
          z-40
          w-full
          h-full
          flex
          justify-center
          items-center
        "
      >
        <div class="text-9xl text-gray-200 animate-spin">
          <svg
            aria-hidden="true"
            focusable="false"
            data-prefix="fas"
            data-icon="spinner"
            class="svg-inline--fa fa-spinner fa-w-16"
            role="img"
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 512 512"
          >
            <path
              fill="currentColor"
              d="M304 48c0 26.51-21.49 48-48 48s-48-21.49-48-48 21.49-48 48-48 48 21.49 48 48zm-48 368c-26.51 0-48 21.49-48 48s21.49 48 48 48 48-21.49 48-48-21.49-48-48-48zm208-208c-26.51 0-48 21.49-48 48s21.49 48 48 48 48-21.49 48-48-21.49-48-48-48zM96 256c0-26.51-21.49-48-48-48S0 229.49 0 256s21.49 48 48 48 48-21.49 48-48zm12.922 99.078c-26.51 0-48 21.49-48 48s21.49 48 48 48 48-21.49 48-48c0-26.509-21.491-48-48-48zm294.156 0c-26.51 0-48 21.49-48 48s21.49 48 48 48 48-21.49 48-48c0-26.509-21.49-48-48-48zM108.922 60.922c-26.51 0-48 21.49-48 48s21.49 48 48 48 48-21.49 48-48-21.491-48-48-48z"
            ></path>
          </svg>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import BaseInput from "../../../shared/base-components/BaseInput.vue";
import BaseTextArea from "../../../shared/base-components/BaseTextArea.vue";
import BaseButton from "../../../shared/base-components/BaseButton.vue";
import BaseBlock from "../../../shared/base-components/BaseBlock.vue";
import { createBlock, updateBlock } from "../../../shared/db/blockService";
import { VueDraggableNext } from "vue-draggable-next";

export default {
  components: {
    BaseInput,
    BaseTextArea,
    BaseButton,
    BaseBlock,
    draggable: VueDraggableNext,
  },
  data() {
    return {
      orderedBlocks: [],
      isLoading: false,
    };
  },
  computed: {
    currentPage() {
      return this.$store.getters.getPage(this.currentPageKey);
    },
    currentPageKey() {
      return this.$route.params.key;
    },
  },
  methods: {
    change() {
      this.orderedBlocks = [];
      this.currentPage.blocks.forEach((block, index) => {
        if (block.image_upload) {
          this.orderedBlocks.push({
            ...block,
            order: index,
            page_id: this.currentPage.id,
            image_upload_id: block.image_upload.id,
          });
        } else {
          this.orderedBlocks.push({
            ...block,
            order: index,
            page_id: this.currentPage.id,
          });
        }
      });

      const blockToUpdate = [];
      this.orderedBlocks.forEach((block, index) => {
        const currentBlock = this.currentPage.blocks.find(
          (b) => b.id === block.id
        );
        if (block.order !== currentBlock.order) {
          blockToUpdate.push(block);
        }
      });
      blockToUpdate.forEach((block, index) => {
        if (index === 0) {
          this.isLoading = true;
        }
        updateBlock(block)
          .then(() => {})
          .catch((error) => {
            console.log(error);
          })
          .then(() => {
            if (index === blockToUpdate.length - 1) {
              this.isLoading = false;
            }
          });
      });
    },
    position(index) {
      if (index === 0) {
        return "first";
      } else if (index === this.currentPage.blocks.length - 1) {
        return "last";
      } else {
        return "center";
      }
    },
    addBlock() {
      createBlock({
        title: this.currentPage.blocks
          ? "Nouveau Bloc " + (this.currentPage.blocks.length + 1)
          : "Nouveau Bloc 1",
        content:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis risus sed vulputate odio. Nunc mi ipsum faucibus vitae. Sagittis id consectetur purus ut faucibus pulvinar elementum. Facilisi cras fermentum odio eu feugiat pretium nibh ipsum consequat. Enim diam vulputate ut pharetra sit. Risus ultricies tristique nulla aliquet enim. Morbi tincidunt augue interdum velit euismod in pellentesque massa placerat. Gravida cum sociis natoque penatibus et magnis dis. Nibh tellus molestie nunc non blandit massa enim nec dui. Cras ornare arcu dui vivamus. Netus et malesuada fames ac turpis egestas maecenas pharetra. Aliquam ultrices sagittis orci a scelerisque. Condimentum lacinia quis vel eros donec ac odio. Sit amet volutpat consequat mauris nunc congue nisi. Sapien et ligula ullamcorper malesuada proin libero nunc. Orci sagittis eu volutpat odio facilisis mauris. Elit sed vulputate mi sit amet mauris commodo quis. Felis imperdiet proin fermentum leo vel. Facilisi cras fermentum odio eu. Lacus sed turpis tincidunt id aliquet. Dui vivamus arcu felis bibendum ut tristique. Mi sit amet mauris commodo quis imperdiet massa tincidunt. At tellus at urna condimentum mattis pellentesque id nibh. Sed euismod nisi porta lorem mollis aliquam ut porttitor leo. Dolor sit amet consectetur adipiscing elit ut aliquam purus sit. Faucibus pulvinar elementum integer enim neque volutpat.",
        order: this.currentPage.blocks ? this.currentPage.blocks.length : 0,
        image_on_right: true,
        enabled: true,
        page_id: this.currentPage.id,
      })
        .then((result) => {
          this.$store.dispatch("loadPages");
          console.log("create block result", result);
        })
        .catch((error) => {
          console.log("create block error", error);
        });
    },
  },
  created() {},
};
</script>