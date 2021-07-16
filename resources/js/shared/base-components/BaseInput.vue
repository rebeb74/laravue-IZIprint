<template>
  <div class="relative z-0 h-10 input-component my-6" :class="empty">
    <input
      type="text"
      :name="name"
      class="
        input
        h-full
        w-full
        px-4
        py-6
        transition-all
        rounded
        bg-primary
        text-gray-200 text-base
      "
      @input="setData($event)"
      v-model="value"
      :maxlength="maxlength"
    />
    <label
      :for="name"
      class="label absolute left-2 transition-all px-1 text bg-primary my-1"
      :class="labelColor"
    >
      {{ label }}
    </label>
  </div>
</template>

<script>
export default {
  props: {
    value: {
      type: String,
    },
    name: {
      required: true,
      type: String,
    },
    label: {
      type: String,
    },
    maxlength: {
      type: Number,
    },
  },
  emits: ["value-change"],
  data() {
    return {
    }
  },
  computed: {
    labelColor() {
      return !this.value ? "text-secondary" : "text-gray-400";
    },
    empty() {
      return !this.value ? "empty" : "";
    },
  },
  methods: {
    setData(event) {
      this.$emit("value-change", event.target.value);
    },
  },
};
</script>

<style scoped>
label {
  max-width: 250px;
}
</style>