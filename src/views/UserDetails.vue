<template>
    <div v-if="user">
        <form @submit.prevent="onSubmit">
            <div>
                <label>First Name:</label>
                <div class="validation">{{errors.firstName}}</div>
                <input v-model="user.firstName" />
            </div>
            <div>
                <label>Last Name:</label>
                <div class="validation">{{errors.lastName}}</div>
                <input v-model="user.lastName" />
            </div>
            <div>
                <label>Email:</label>
                <div class="validation">{{errors.email}}</div>
                <input v-model="user.email" />
            </div>
            <div>
                <label>Password:</label>
                <div class="validation">{{errors.password}}</div>
                <input type="password" v-model="user.password" />
            </div>
            <div>
                <label>Role:</label>
                <select v-if="roles.length > 0" v-model="user.roleId">
                	<option v-for="r in roles" :key="r.id" :value="r.id">{{r.name}}</option>
                </select>
            </div>
            <div>
                <label>Active:</label>
                <input type="checkbox" v-model="user.active">
            </div>
            <div>
                <input type="submit" id="btnSubmit" name="submit button">
                <input type="button" @click="$router.push({name:'UserList'})" value="Cancel">
            </div>
        </form>
    </div>
</template>

<script>
import {getUserById, getAllRoles, updateUser, insertUser} from "@/api"

export default {
    props:["userId"],
    data(){
        return{
            user:null,
            roles:[],// populates drop down list
            errors:{}
        }
    },
    mounted(){
        if(this.$route.name != "AddUser" && isNaN(this.userId)){
            this.$router.push({name:"NotFound"})
        }

        getAllRoles().then(roles => this.roles = roles);

        if(this.userId > 0){
            
            getUserById(this.userId)
                .then(user => this.user = user)
                .catch(err => this.$router.push({name:"NotFound"}));
        }else{
            // if the userId prop was not passed in, then we are creating a new empty user
            this.user = {id:0, firstName:"", lastName:"", email:"", password:"", roleId:1, active: true};
        }
    },
    methods:{
        onSubmit() {
            if(this.isValid()){
                if(this.userId > 0){
                    updateUser(this.user).then(resp => this.$router.push({name: 'UserList'}));
                }else{
                    insertUser(this.user).then(resp => this.$router.push({name: 'UserList'}));
                }
            }
        },
        
        isValid(){

            let valid = true;

            if(this.user.firstName == ""){
                this.errors.firstName = "Please enter your first name.";
                valid = false;
            } 
            
            if(this.user.lastName == ""){
                this.errors.lastName = "Please enter your last name.";
                valid = false;
            } 
            
            if(this.user.email == ""){
                this.errors.email = "Please enter your email.";
                valid = false;
            } else if(!this.validateEmailAddress(this.user.email)){
                this.errors.email = "The email address is not valid.";
                valid = false;
            }
            
            if(this.user.password == ""){
                this.errors.password = "Please enter your password.";
                valid = false;
            }

            return valid;
        },
        validateEmailAddress(email){
		    var regExp = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		    return regExp.test(email);
		}
    }
}
</script>

<style scoped>
label{ display: block; }
.validation {
    color: red;
    font-weight: bold;
    display: block;
  }
</style>