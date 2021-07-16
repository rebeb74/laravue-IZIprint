<template>
  <div class="relative h-32 input-component" :class="empty">
    <textarea
      type="text"
      name="name"
      class="
        textarea
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
      :rows="rows"
      :maxlength="maxlength"
    ></textarea>
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
  props: ["value", "name", "label", "rows", "maxlength"],
  emits: ["value-change"],
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
      this.$emit('value-change', event.target.value);
    },
  },
};
</script>