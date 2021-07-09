<template>
    <the-sidebar></the-sidebar>
    <the-header></the-header>
    <main class="pt-20 flex flex-col h-full m-0">
        <router-view class="flex-content"></router-view>
        <the-footer class="flex-shrink-0"></the-footer>
    </main>

</template>

<script>
import TheHeader from './components/navigation/TheHeader.vue'
import TheSidebar from './components/navigation/TheSidebar.vue'
import TheFooter from './components/navigation/TheFooter.vue'

export default {
    components: {
        TheHeader,
        TheSidebar,
        TheFooter
    },
    beforeCreate() {
        this.$store.dispatch('loadPages');
    }
}
</script>

