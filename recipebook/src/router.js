import Vue from 'vue'
import Router from 'vue-router'
import Home from './views/Home.vue'
<<<<<<< HEAD
import HomePage from './views/HomePage.vue'
=======
import LandingPage from './views/LandingPage.vue'
>>>>>>> 81a97fa786a744307627e025423cfac4ca81e598

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
<<<<<<< HEAD
      path:'/HomePage',
      name: 'HomePage',
      component: HomePage
=======
      path:'/landingPage',
      name: 'landingPage',
      component: LandingPage
>>>>>>> 81a97fa786a744307627e025423cfac4ca81e598
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
