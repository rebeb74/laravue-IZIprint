<template>
        <the-sidebar></the-sidebar>
    <the-header></the-header>
    <main class="pt-20 flex flex-col h-full m-0">
        <router-view class="flex-content"></router-view>
        <the-footer class="flex-shrink-0"></the-footer>
    </main>

</template>

<script>
import TheHeader from './navigation/TheHeader.vue'
import TheSidebar from './navigation/TheSidebar.vue'
import TheFooter from './navigation/TheFooter.vue'

export default {
    components: {
        TheHeader,
        TheSidebar,
        TheFooter
    },
}
</script>