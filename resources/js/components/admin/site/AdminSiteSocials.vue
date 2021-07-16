<template>
  <div class="card">
    <div class="card-title">Réseaux sociaux</div>
    <div class="card-subtitle">
      Personnalisez vos liens venant de Facebook et Twitter
    </div>
    <base-input
      :value="siteData.title"
      @value-change="setSiteData($event)"
      name="title"
      label="Titre du site (max 60 car.)"
      class="mb-8"
      :maxlength="60"
    ></base-input>
  </div>
</template>

<script>
import BaseInput from "../../../shared/base-components/BaseInput.vue";
import BaseButton from "../../../shared/base-components/BaseButton.vue";

export default {
  components: {
    BaseInput,
    BaseButton,
  },
};
</script>