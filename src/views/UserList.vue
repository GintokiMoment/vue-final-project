<template>
    <div class="user-list">
        <table border="1">
            <tr>
                <th>User</th>
                <th>Email</th>
                <th>Role</th>
                <th>Active</th>
                <th></th>
            </tr>
            <tr v-for="u in users" :key="u.id">
                <td>{{u.firstName + " " + u.lastName}}</td>
                <td>{{u.email}}</td>
                <td>{{getRoleNameById(u.roleId)}}</td>
                <td>{{u.active ? "yes" : "no"}}</td>
                <td>
                    <button @click="editUser(u.id)">Edit</button>
                </td>
            </tr>
        </table>

        <button @click="$router.push({name: 'AddUser' })">Add New User</button>
        
    </div>
</template>

<script>
import {getAllUsers, getAllRoles} from "@/api"

export default {
    data(){
        return {
            users: [],
            roles:[]
        }
    },
    mounted(){
        getAllUsers().then(users => this.users = users);
        getAllRoles().then(roles => this.roles = roles);
    },
    methods:{
        getRoleNameById(id){
          const role = this.roles.find(r => r.id == id);
          return role?.name;
          // Note the nullish operator - I noticed that this method gets called even before the roles have been fetched!
        },
        editUser(id){
             this.$router.push({name:'UserDetails', params: {userId:id}});
        }
    }
}
</script>

<style scoped>
  /*Put CSS styles here*/
</style>