<template>
  <div class="card">
    <h1 class="card-title">Général</h1>
    <h2 class="card-subtitle">Réglages généraux du site</h2>

    <div class="relative h-10 input-component my-6" :class="empty">
      <input
        type="text"
        name="suffix"
        class="
          input
          h-full
          w-full
          px-4
          py-6
          transition-all
          rounded
          bg-primary
          text-gray-200
          text-base
        "
        @input="setSiteSuffix($event)"
        :value="suffix"
      />
      <label
        for="suffix"
        class="label absolute left-2 transition-all px-1 text bg-primary my-1"
        :class="labelColor"
      >
        Suffixe du Titre
      </label>
    </div>
  </div>
</template>

<script>
export default {
  computed: {
    suffix() {
      return this.$store.state.siteSuffix;
    },
    empty() {
      return !this.suffix ? "empty" : "";
    },
    labelColor() {
      return !this.suffix ? "text-secondary" : "text-gray-400";
    },
  },
  methods: {
    setSiteSuffix(event) {
      this.$store.commit("setSiteSuffix", event.target.value);
    },
  },
};
</script>