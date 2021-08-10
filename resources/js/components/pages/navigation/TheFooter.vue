<template>
  <div
    class="
			h-96
      lg:h-52
      bg-primary-dark
      flex flex-col
      justify-center
      items-center
      text-gray-200
      z-10
    "
  >
    <div class="flex flex-col lg:flex-row justify-center items-center">
      <div class="flex justify-center items-center mx-8">
        <img
          class="w-48 mr-8"
          src="../../../../assets/logo/logo-500.png"
          alt="Logo IZIprint full"
        />
      </div>
      <div class="flex flex-col justify-center lg:items-start items-center mx-8">
        <a
          href="tel:+262692448106"
          class="text-secondary text-decoration-none text-4xl my-1"
        >
          06 92 44 81 06
        </a>
        <a
          href="mail:info@iziprint.re"
          class="text-decoration-none text-3xl my-1"
          >info@iziprint.re</a
        >
      </div>
      <div class="flex flex-col justify-center items-center mx-8">
        <div class="lg:text-3xl text-2xl my-2">Suivez-nous...</div>
        <a href="https://www.facebook.com/benarddavidiziprint">
          <i class="fab fa-facebook-square text-4xl lg:my-2"></i>
        </a>
      </div>
    </div>
    <div class="hidden lg:flex justify-center items-end">
			<div
      class="block mx-0.5 text-gray-200 text-sm lg:mx-1 xl:mx-2 pt-2"
      v-for="page in $store.state.pages"
      :key="page.id"
    >
      <router-link
        :to="'/' + page.key"
        class="px-2 lg:px-3 bg-transparent"
      >
        {{ page.name }}
      </router-link>
    </div>
		</div>
  </div>
</template>