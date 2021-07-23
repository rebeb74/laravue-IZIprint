<template>
  <div class="m-auto w-xs lg:w-5xl py-5 lg:px-5">
    <admin-site-order></admin-site-order>
    <admin-site-general></admin-site-general>
  </div>
</template>

<script>
import AdminSiteOrder from './AdminSiteOrder.vue';
import AdminSiteGeneral from './AdminSiteGeneral.vue';

export default {
  components: {
    AdminSiteOrder,
    AdminSiteGeneral,
  },
  setup() {
    
  },
  created() {
    this.$store.commit('hideSidenavIcon')
    },
};
</script>

