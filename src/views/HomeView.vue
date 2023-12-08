<template>
  <div class="home">
    <hello-world></hello-world>
    <a href="https://wallpaper.mob.org/pc/image/animals-panda-vetka-sidet-sneg-129049.html" class="hefty btn btn-dark btn-sm " target="_blank"> <i>Panda Image &copy; mob.org</i> </a>
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
  padding: 50px;
}

.hefty {
  margin-block: 20px;
  font-size: 11px;
}
</style>
