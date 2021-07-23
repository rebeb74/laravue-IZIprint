<template>
  <div
    class="flex justify-between items-center"
    @click="toggleActive = !toggleActive"
  >
    <div
      class="
        w-10
        h-6
        flex
        items-center
        rounded-full
        p-1
        duration-300
        ease-in-out
      "
      :class="[setColors, setWidth]"
    >
      <div
        class="
          bg-gray-200
          w-4
          h-4
          rounded-full
          shadow-md
          transform
          duration-300
          ease-in-out
        "
        :class="setTranslate"
      ></div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    modelValue: {
      type: Boolean,
    },
    activeColor: {
        type: String
    },
    notActiveColor: {
        type: String
    },
    width: {
        type: Number
    }
  },
  emits: ["update:modelValue"],
  data() {
    return {
      toggleActive: false,
    };
  },
  computed: {
      setColors() {
          return this.toggleActive ? this.activeColor : this.notActiveColor;
      },
      setWidth() {
          return 'w-' + this.width;
      },
      setTranslate() {
          return this.toggleActive ? 'translate-x-' + (this.width-6): '';
      }
  },
  watch: {
      toggleActive(val) {
          this.$emit('update:modelValue', val)
      }
  },
  created() {
      this.toggleActive = this.modelValue;
  }
};
</script>