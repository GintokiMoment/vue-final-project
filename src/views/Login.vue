<template>
    <div class="login">
        <form @submit.prevent="onSubmit">
            <div>
                <label>Email:</label>
                <input v-model="email" />
            </div>
            <div>
                <label>Password:</label>
                <input type="password" v-model="password" />
            </div>
            <div>
                <input type="submit" id="btnSubmit" name="submit button">
            </div>
        </form>
    </div>
</template>

<script>
import {login} from '../api.js'
export default {
    inject: ['GStore'],
    data(){
        return {
            email: "",
            password: ""
        }
    },
    methods: {
        onSubmit(){
        if(this.validate()){
            login(this.email, this.password).then(user => {
                if(user){
                    this.GStore.currentUser = user;
                    sessionStorage.setItem("currentUser", JSON.stringify(user));
                    this.$router.push({name: "home"});
                }else{
                    alert("LOGIN FAILED!");
                }
            })
        }
    },
        validate(){
            if(!this.email || !this.password){
                alert("Invalid Input");
                return false;
            }
            return true;
        }
    }
}
</script>

<style scoped>
    label{ display: block; }
</style>