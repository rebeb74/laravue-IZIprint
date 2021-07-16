<template>
  <div>
    <div
      type="button"
      :disabled="$store.state.isLoading"
      :class="isDisabled"
      @click.prevent
      class="
        disabled:opacity-0
        px-2
        py-1
        lg:px-3
        lg:py-2
        rounded
        text-gray-200 text-center
        w-full
        flex
        justify-center
        items-center
      "
    >
      <span v-if="!isLoading">
        {{ text }}
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
    </div>
  </div>
</template>

<script>
export default {
  props: {
    text: {
      required: true,
      type: String,
    },
    color: {
      type: String,
    },
  },
  emits: ["button-click"],
  computed: {
    isDisabled() {
      return this.$store.state.isLoading
        ? "bg-primary-light"
        : this.color ? this.color + " hover:bg-secondary-dark cursor-pointer" : "bg-primary-dark hover:bg-secondary-dark cursor-pointer";
    },
    isLoading() {
      return this.$store.state.isLoading;
    },
  },
};
</script>