<template>
  <div class="home">
  <hello-world></hello-world>
  </div>
</template>

<script>
// @ is an alias to /src
import HelloWorld from '@/components/HelloWorld.vue'

export default {
  name: 'HomeView',
  components: {
    HelloWorld
  }
}
</script>

<style scoped>

.home {
  background-image: url('../assets/cute_panda.jpeg');
  background-size: cover;
  background-position: center;
  background-attachment: fixed;
}
</style>
