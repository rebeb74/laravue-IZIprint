<template>
  <div class="h-full w-full flex justify-center items-center">
    <div class="card w-80">
      <div class="card-title text-center">Connexion</div>
      <div>
        <base-input
          v-model="email"
          name="email"
          label="Email"
          @keydown.enter="submit()"
        ></base-input>
        <base-input
          v-model="password"
          name="password"
          label="Password"
          type="password"
          @keydown.enter="submit()"
        ></base-input>
        <div v-if="!!error" class="py-2 text-secondary-light">
          {{ error }}
        </div>
        <base-button
          class="w-full pt-4"
          text="Ok"
          @button-click="submit()"
        ></base-button>
      </div>
    </div>
  </div>
</template>

<script>
import BaseInput from "./../shared/base-components/BaseInput.vue";
import BaseButton from "./../shared/base-components/BaseButton.vue";
import axios from "axios";
import { login } from "../shared/utils/auth";

export default {
  components: {
    BaseButton,
    BaseInput,
  },
  data() {
    return {
      email: null,
      password: null,
      error: null,
    };
  },
  methods: {
    async submit() {
      this.$store.commit("setIsLoading");
      this.error = null;
      try {
        await axios.get("/sanctum/csrf-cookie");
        await axios.post("/login", {
          email: this.email,
          password: this.password,
        });
        login();
        this.$store.dispatch('loadUser');
        this.$router.replace("/admin");
      } catch (error) {
        this.error = error.response.data.errors;
        console.log(error.response);
      }
      this.$store.commit("setIsLoading");
    },
  },
};
</script>