<template>
  

<div class="container-fluid bg-dark" id="top">
    <nav class="navbar navbar-expand-xl navbar-dark bg-dark text-light">
      <div class="container-lg">
        <!-- navbar brand / title -->
        <!-- 
          <span class="fw-bold">
          <a href="#top" class="text-light text-decoration-none">
            <i class="bi bi-bootstrap" style="font-size: 1.4rem;"></i>
            INT WEB DEV - Bootstrap Assignment
          </a>
        </span> 
        -->
        <i class="bi bi-bootstrap" style="font-size: 1.4rem;"></i>
        <span v-if="GStore.currentUser">
          <b>Hello {{GStore.currentUser.firstName}} &nbsp;</b>
        </span>

        <!-- toggle button for mobile nav -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#main-nav" aria-controls="main-nav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <!-- navbar links -->
        <div class="collapse navbar-collapse justify-content-start align-center bg-dark text-light" id="main-nav" >
          <ul class="navbar-nav">
            <li class="nav-item">
               
                <router-link class="nav-link" :to="{name:'home'}">
                  Home
                </router-link>

            </li>
            <li class="nav-item">
              
                <router-link class="nav-link" to="/about">
                  About
                </router-link>

            </li>
            <li class="nav-item" v-if="GStore.currentUser?.roleId == 2">
                <router-link class="nav-link" :to="{name: 'UserList'}" >
                  Users
                </router-link>
            </li>

            <li class="nav-item">
              <router-link class="nav-link" v-if="!GStore.currentUser" :to="{name: 'Login'}">Login</router-link>
              <a v-else @click="logout" class="nav-link" href="#">Log Out</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  </div>



</template>



<script>
export default {
    inject: ['GStore'],
    methods:{
        logout(evt){
            evt.preventDefault();
            this.GStore.currentUser = null;
            sessionStorage.removeItem("currentUser");
            this.$router.push({name:"Login"});
        }
    }
}
</script>

<style>

</style>