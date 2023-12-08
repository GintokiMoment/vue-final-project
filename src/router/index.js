import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import UserList from '../views/UserList.vue'
import UserDetails from '../views/UserDetails.vue'
import Login from '../views/Login.vue'
import NotFound from '../views/NotFound.vue'

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView,
    meta: {title: "Home Page"}
  },
  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue'),
    meta: {title: "About Us"}
  },
  { path: '/users/',
     name: 'UserList', 
     component: UserList,
    meta: {title: "User Database"} },

  { path: '/users/:userId',
     name: 'UserDetails', 
     component: UserDetails, props: true,
     meta: {title: "User Details"} },
     
  { path: '/users/add', 
      name: 'AddUser', 
      component: UserDetails,
      meta: {title: "Add a User"} },
  { path: '/login', 
      name: 'Login', 
      component: Login,
      meta: {title: "Login"} },
      
  { path:"/404", 
      component: NotFound,
      name:"NotFound",
      meta: {title: "404 - Not Found"}},
  { path:"/:catchAll(.*)",
     redirect: "/404" }

]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

router.afterEach((to, from) => {
  document.title = to.meta.title || "NO PAGE TITLE SET!";
})

export default router
