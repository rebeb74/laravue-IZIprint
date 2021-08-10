<template>
  <div
    class="rounded-t-xl shadow-card flex flex-col justify-center items-center"
  >
    <router-link :to="data.link">
      <div class="image">
        <img :src="data.imageUrl" :alt="data.imageAlt" class="rounded-t-xl"/>
      </div>
      <div
        class="
          h-12
          bg-primary-dark
          text-gray-200
          uppercase
          flex
          justify-center
          items-center
        "
      >
        <p>
          {{ data.text }}
        </p>
      </div>
    </router-link>
  </div>
</template>

<script>
export default {
  props: {
    data: {
      type: Object,
      required: true,
    },
  },
};
</script>

<style scoped>
.image {
  width: 300px;
  height: 300px;
}
</style>