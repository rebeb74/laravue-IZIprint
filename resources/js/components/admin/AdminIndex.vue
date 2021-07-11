<template>
    <admin-sidebar></admin-sidebar>
    <admin-header></admin-header>
    <router-view></router-view>
</template>

<script>
import AdminSidebar from './navigation/AdminSidebar.vue'
import AdminHeader from './navigation/AdminHeader.vue'

export default {
    components: {
        AdminHeader,
        AdminSidebar
    }    
}
</script>