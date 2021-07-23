<template>
  <div class="card">
    <div class="card-title">Général</div>
    <base-input
      v-model="name"
      name="name"
      label="Nom de la page"
      :maxlength="60"
      :inputIsInvalid="validateName(name)"
      invalidText="Le nom est requis."
    ></base-input>
    <div class="card-subtitle mt-4">Référencement de la page</div>
    <base-input
      v-model="title"
      name="title"
      label="Balise Title"
      :maxlength="60"
      :inputIsInvalid="validateTitle(title)"
      invalidText="La balise Title est requise."
    ></base-input>
    <base-text-area
      :rows="2"
      :maxlength="150"
      v-model="description"
      name="description"
      label="Description (entre 70 et 150 car.)"
      invalidText="La description doit être comprise entre 70 et 150 caractères."
      :inputIsInvalid="validateDescription(description)"
    ></base-text-area>
    <base-button
      class="w-full pt-4"
      text="Enregistrer"
      :isDisabled="
        validateTitle(title) ||
        validateDescription(description) ||
        validateName(name)
      "
      @button-click="saveGeneral()"
    ></base-button>
  </div>
</template>

<script>
import BaseInput from "../../../shared/base-components/BaseInput.vue";
import BaseTextArea from "../../../shared/base-components/BaseTextArea.vue";
import BaseButton from "../../../shared/base-components/BaseButton.vue";

export default {
  components: {
    BaseInput,
    BaseTextArea,
    BaseButton,
  },
  data() {
    return {
      name: "",
      title: "",
      description: "",
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
    validateName(data) {
      return data.trim() ? false : true;
    },
    validateTitle(data) {
      return data.trim() ? false : true;
    },
    validateDescription(data) {
      return data.length > 70 ? false : true;
    },
    saveGeneral() {
      this.$store.dispatch("updatePage", this.currentPage);
    },
  },
  watch: {
    currentPageKey() {
      this.currentPage = {
        ...this.$store.getters.getPage(this.currentPageKey),
      };
    },
  },
  created() {
    this.name = this.currentPage.name;
    this.title = this.currentPage.title;
    this.description = this.currentPage.description;
  },
};
</script>