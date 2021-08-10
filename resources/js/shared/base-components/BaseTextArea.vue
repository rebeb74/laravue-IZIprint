<template>
  <div class="pt-4">
    <div class="relative h-32 input-component border-transparent hover:border-gray-200 border-b" :class="empty">
      <textarea
        type="text"
        :name="name"
        :id="name + randomString"
        class="
          textarea
          h-full
          w-full
          px-4
          py-6
          transition-all
          rounded-t-xl
          border-b 
          border-gray-200
          bg-primary-light
          text-gray-200
          text-base
        "
        @input="setData($event)"
        v-model="modelValue"
        :rows="rows"
        :maxlength="maxlength"
        @blur="$emit('blur')"
      ></textarea>
      <label
        :for="name + randomString"
        class="label absolute left-2 transition-all -ml-2 px-2 py-0.5 text bg-primary-light my-1 rounded-xl"
        :class="labelColor"
      >
        {{ label }}
      </label>
    </div>
    <p v-if="inputIsInvalid" class="ml-2 text-secondary-light">
      {{ invalidText }}
    </p>
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
    rows: {
    },
    invalidText: {
      type: String,
    },
    inputIsInvalid: {
      type: Boolean,
    },
    modelValue: {
      type: String
    }
  },
  emits: ["update:modelValue", "blur", "change"],
  data() {
    return {
      randomString: Math.random().toString(36).substr(2, 5)
    }
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
      this.$emit('change')
    },
  },
};
</script>

<style scoped>
label {
  max-width: 250px;
}
</style>