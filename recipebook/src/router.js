import Vue from 'vue'
import Router from 'vue-router'
import Home from './views/Home.vue'
import HomePage from './views/HomePage.vue'
import LandingPage from './views/LandingPage.vue'
import Login from './views/Login.vue'
import Register from './views/Register.vue'

Vue.use(Router)

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home
    },
    {
      path: '/login',
      name: 'login',
      component: Login
    },
    {
      path:'/Register',
      name: 'Register',
      component: Register},
    
    {
      path:'/HomePage',
      name: 'HomePage',
      component: HomePage},
      {

      path:'/landingPage',
      name: 'landingPage',
      component: LandingPage
    },
    {
      path: '/about',
      name: 'about',
      // route level code-splitting
      // this generates a separate chunk (about.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import(/* webpackChunkName: "about" */ './views/About.vue')
    }
   
  ]
})
