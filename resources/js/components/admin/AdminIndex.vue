<template>
  <admin-header></admin-header>
  <main class="pt-32 lg:pt-16 flex flex-col h-full m-0">
    <router-view class="flex-content"></router-view>
  </main>
</template>

<script>
import AdminSidebar from "./navigation/AdminSidebar.vue";
import AdminHeader from "./navigation/AdminHeader.vue";

export default {
  components: {
    AdminHeader,
    AdminSidebar,
  },
};
</script>