<template>
  <div
    class="
      flex
      h-32
      lg:h-16
      bg-primary-dark
      justify-center
      items-center
      fixed
      w-full
      z-10
      shadow-xl
      text-gray-200
      flex-col
      lg:flex-row
    "
  >
    <div
      class="w-full mb-2 mt-4 lg:my-0 lg:w-3/5 self-start flex lg:h-full justify-start items-center"
    >
      <div v-if="$store.state.sidenavIcon"
        @click="openSidebar()"
        class="text-3xl mx-4 lg:hidden cursor-pointer"
      >
        <i class="fas fa-bars"></i>
      </div>
      <div class="w-16 justify-center items-center mx-2">
        <router-link to="/admin">
          <img
            src="../../../../assets/logo/logo-light.png"
            alt="Logo IZIprint light"
          />
        </router-link>
      </div>
      <div class="text-secondary justify-center items-center mx-2 text-2xl">
        Administration
      </div>
      <div
        class="
          hidden
          text-gray-200 text-sm
          mx-0.5
          lg:mx-1
          xl:mx-2
          lg:text-base
          self-center
          lg:flex
          lg:justify-center
          lg:items-center
        "
      >
        <router-link
          :to="'/admin/site'"
          class="px-2 py-1 lg:px-3 lg:py-2 rounded hover:bg-secondary-dark mx-2"
        >
          Gestion du site
        </router-link>
        <router-link
          :to="'/admin/pages'"
          class="px-2 py-1 lg:px-3 lg:py-2 rounded hover:bg-secondary-dark mx-2"
        >
          Gestion des pages
        </router-link>
      </div>
    </div>

    <div class="lg:hidden text-gray-200 text-lg self-center mt-2 mb-4">
      <router-link
        :to="'/admin/site'"
        class="bg-primary px-4 py-2 mx-2  rounded hover:bg-secondary-dark"
      >
        Gestion Site
      </router-link>
      <router-link
        :to="'/admin/pages'"
        class="bg-primary px-4 py-2 mx-2  rounded hover:bg-secondary-dark"
      >
        Gestion Pages
      </router-link>
    </div>

    <div class="hidden w-2/5 self-end lg:flex justify-end items-center h-full">
      <router-link
        :to="'/'"
        class="px-2 py-1 lg:px-3 lg:py-2 rounded hover:bg-secondary-dark mx-2 cursor-pointer"
      >
        Retour au site
      </router-link>
      <div
        class="px-2 py-1 lg:px-3 lg:py-2 rounded hover:bg-secondary-dark mx-2 cursor-pointer"
        @click="logout()"
      >
        Se déconnecter de l'admin
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import { mapState } from 'vuex';
export default {
  data() {
    return {};
  },
  computed: {
    ...mapState({
      isAuth: 'isAuth'
    })
  },
  methods: {
    openSidebar() {
      this.$store.commit("toogleSidebar");
    },
    async logout() {
      try {
        await axios.post('/logout');
        this.$store.dispatch('logout');
        this.$router.replace('/home');
      } catch (error) {
        this.$store.dispatch('logout');
      }
    }
  },
  computed: {},
  created() {},
};
</script>