<template>
    <the-sidebar></the-sidebar>
    <the-header></the-header>
    <main class="pt-20">
        <router-view></router-view>
    </main>
</template>

<script>
import TheHeader from './components/navigation/TheHeader.vue'
import TheSidebar from './components/navigation/TheSidebar.vue'

export default {
    components: {
        TheHeader,
        TheSidebar
    },
    beforeCreate() {
        this.$store.dispatch('loadPages');
    }
}
</script>