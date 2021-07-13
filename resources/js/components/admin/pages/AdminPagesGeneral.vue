<template>
    <div>GENERAL {{ $route.params.key }}</div>
</template>

<script>
import { useRoute } from 'vue-router'
export default {
    setup() {
        const route = useRoute();
        console.log(route.params)
    },
}
</script>