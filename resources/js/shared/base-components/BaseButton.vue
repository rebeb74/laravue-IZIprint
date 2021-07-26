<template>
  <div>
    <button
      type="button"
      :disabled="buttonIsDisabled"
      :class="buttonColor"
      @click.prevent="$emit('button-click')"
      class="
        disabled:opacity-0
        px-2
        py-1
        lg:px-3
        lg:py-2
        rounded
        text-center
        w-full
        flex
        justify-center
        items-center
      "
    >
      <span v-if="!isLoading">
        <i v-if="icon === 'edit'" class='far fa-edit ml-1'></i>
        <i v-if="icon === 'delete'" class="far fa-trash-alt"></i>
        <div>
        {{ text }}
        </div>
      </span>
      <div v-else class="w-8 animate-spin">
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
    </button>
  </div>
</template>

<script>
export default {
  props: {
    text: {
      type: String,
    },
    color: {
      type: String,
    },
    isDisabled: {
      type: Boolean,
    },
    icon: {
      type: String
    }
  },
  emits: ["button-click"],
  data() {
    return {
      buttonIsDisabled: this.isDisabled,
    };
  },
  computed: {
    isLoading() {
      return this.$store.state.isLoading;
    },
    buttonColor() {
      return this.buttonIsDisabled
        ? "bg-primary-light cursor-not-allowed text-primary"
        : this.color
        ? this.color + " hover:bg-secondary-dark cursor-pointer text-gray-200 "
        : "bg-primary-dark hover:bg-secondary-dark cursor-pointer text-gray-200 ";
    },
  },
  watch: {
    isDisabled(isDisabled) {
      isDisabled
        ? (this.buttonIsDisabled = true)
        : (this.buttonIsDisabled = false);
    },
    isLoading(isLoading) {
      isLoading
        ? (this.buttonIsDisabled = true)
        : (this.buttonIsDisabled = false);
    },
  },
};
</script>