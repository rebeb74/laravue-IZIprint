<template>
    <admin-sidebar></admin-sidebar>
    <admin-header></admin-header>
    <admin-content class="h-full pt-20"></admin-content>
</template>

<script>
import AdminSidebar from './navigation/AdminSidebar.vue'
import AdminHeader from './navigation/AdminHeader.vue'
import AdminContent from './AdminContent.vue'

export default {
    components: {
        AdminHeader,
        AdminContent,
        AdminSidebar
    }    
}
</script>