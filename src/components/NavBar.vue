<template>
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #aed9e0;">
      <div class="container">
        <router-link class="navbar-brand" to="/">
          Pawsitively Yours <span class="cat-paw-icon">&#128060;</span>
        </router-link>
  
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <span class="firstName" v-if="GStore.currentUser">
            <b>Hello, {{GStore.currentUser.firstName}} &nbsp;</b> 
            <i class="fa fa-paw"></i>
        </span>
  
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav ms-auto">
            <li class="nav-item">
              <router-link class="btn btn-dark" to="/" exact>Home</router-link>
            </li>
            <li class="nav-item">
              <router-link class="btn btn-dark" to="/about">About</router-link>
            </li>
  
            <li v-if="GStore.currentUser?.roleId == 2" class="nav-item">
              <router-link class="btn btn-dark" :to="{ name: 'UserList' }">Users</router-link>
            </li>
  
            <li v-if="!GStore.currentUser" class="nav-item">
              <router-link class="btn btn-dark" :to="{ name: 'Login' }">Login</router-link>
            </li>
  
            <li v-else class="nav-item">
              <a class="btn btn-dark" @click="logout" href="#">Log Out</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
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
  .collapse {
    transition: height 0.3s ease-in-out;
  }
  
  .collapsing {
    height: 0;
    overflow: hidden;
  }

  .navbar-nav .btn {
    background-color: whitesmoke;
    color: rgb(66, 82, 96);
    font-family: 'Georgia', sans-serif; 
    margin: 5px;

  }

  .navbar-brand {
    font-family: 'Trebuchet MS', sans-serif;
    color:black;
  }
  .navbar-brand:hover {
    color: white;
  }

  .cat-paw-icon {
    font-size: 1.5em; 
    margin-left: 0.5em; 
  }

  .firstName {
    margin-top: 5px;
    font-family: "Trebuchet MS", sans-serif;
  }
</style>