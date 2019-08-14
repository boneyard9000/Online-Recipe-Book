import Vue from 'vue'
import Router from 'vue-router'
import auth from './auth'
// import Home from './views/Home.vue'
import HomePage from './views/HomePage.vue'
import LandingPage from './views/LandingPage.vue'
import Login from './views/Login.vue'
import Register from './views/Register.vue'
import RecipeDetails from './views/RecipeDetails.vue'
import SubmitRecipe from './views/SubmitRecipe.vue'
import GroceryList from './views/GroceryList.vue'
import AllRecipes from './views/AllRecipes.vue'


Vue.use(Router)

const router = new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {

      path:'/',
      name: 'landingPage',
      component: LandingPage,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: '/AllRecipes',
      name: 'AllRecipes',
      component: AllRecipes,
      meta: {
        requiresAuth: true
      }
    },
    
    {
      path: '/login',
      name: 'login',
      component: Login,
      meta: {
        requiresAuth: false
      }
    },
    
    {
      path:'/Register',
      name: 'Register',
      component: Register,
      meta: {
        requiresAuth: false
      }
    },
    
    {
      path:'/HomePage/:userId',
      name: 'HomePage',
      component: HomePage,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: '/RecipeDetails/:id',
      name: 'RecipeDetails',
      component: RecipeDetails,
      meta: {
        requiresAuth: true
      }
    },

    {
      path:'/SubmitRecipe',
      name: 'SubmitRecipe',
      component: SubmitRecipe,
      meta: {
        requiresAuth: true
      }
    },
    {
      path:'/GroceryList',
      name: 'GroceryList',
      component: GroceryList,
      meta: {
        requiresAuth: true
      }
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

router.beforeEach((to, from, next) => {
  // Determine if the route requires Authentication
  const requiresAuth = to.matched.some(x => x.meta.requiresAuth);
  const user = auth.getUser();

  // If it does and they are not logged in, send the user to "/login"
  if (requiresAuth && !user) {
    next("/login");
  } else {
    // Else let them go to their next destination
    next();
  }
});

export default router;

