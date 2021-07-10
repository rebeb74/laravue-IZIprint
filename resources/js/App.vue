<template>
  <router-view></router-view>
</template>

<script>
export default {
  beforeCreate() {
    this.$store.dispatch("loadPages");
  },
};
</script>

