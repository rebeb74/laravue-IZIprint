<template>
  <div class="py-4 border-transparent hover:border-gray-200 border-b-2">
    <div class="relative h-10 input-component" :class="empty">
      <select
        :name="name"
        :id="name + randomString"
        class="
          input
          h-14
          w-full
          px-4
          pt-4
          transition-all
          rounded-t-xl
          border-b
          box-border
          border-gray-200
          bg-primary-light
          text-gray-200 text-base
        "
        @change="setData($event)"
        v-model="modelValue"
        :maxlength="maxlength"
      >
        <option value="">Aucun</option>
        <option v-for="option in options" :key="option.id" :value="option.key">{{ option.name }}</option>
      </select>
      <label
        :for="name + randomString"
        class="
          label
          absolute
          left-2
          transition-all
          -ml-2
          px-3
          py-0.5
          text
          bg-primary-light
          my-1
          rounded-xl
        "
        :class="labelColor"
      >
        {{ label }}
      </label>
    </div>
    <p v-if="inputIsInvalid" class="mt-4 ml-4 text-secondary-light">
      {{ invalidText }}
    </p>
  </div>
</template>

<script>
export default {
  props: {
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
    invalidText: {
      type: String,
    },
    inputIsInvalid: {
      type: Boolean,
    },
    modelValue: {
      type: String,
    },
    options: {}
  },
  emits: ["update:modelValue"],
  data() {
    return {
      randomString: Math.random().toString(36).substr(2, 5),
    };
  },
  computed: {
    labelColor() {
      return this.inputIsInvalid ? "text-secondary-light" : "text-primary";
    },
    empty() {
      return !this.modelValue ? "empty" : "";
    },
  },
  methods: {
    setData(event) {
      this.$emit("update:modelValue", event.target.value);
    },
  },
};
</script>

<style scoped>
label {
  max-width: 250px;
}
</style>