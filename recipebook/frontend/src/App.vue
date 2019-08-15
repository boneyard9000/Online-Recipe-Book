<template>
  <div id="app" style = "margin:0">
    <div id="headerDiv">
    <header>
      
      <nav style="width:100%; float:right; z-index:1"> 
        <ul id="nav-bar">
          <li><a style="pointer-events: none; color: green; font-weight: 900;">CHEF'S CORNER</a></li>
          <li><router-link v-if="isLoggedIn()" :to="{name: 'HomePage', params: {userId: getUserId()}}" >My Recipes</router-link></li>
          <li><router-link v-if="isLoggedIn()" :to="{name: 'SubmitRecipe'}" >Submit Recipe</router-link></li>
          <li><router-link v-if="isLoggedIn()" :to="{name: 'GroceryList'}">Grocery List</router-link></li>
          <li><router-link v-if="isLoggedIn()" :to="{name: 'AllRecipes'}">All Recipes</router-link></li>


          
          <router-link v-if="isLoggedIn()" to="/">
            <b-button style="float:right; " pill variant="outline-primary" @click="logout" class="btn"> Logout </b-button>
          </router-link>  
            <router-link v-if="!isLoggedIn()" to="/Register">
            <b-button style="float:right; " pill variant="outline-primary" class="btn"> Register </b-button>
          </router-link> 
          <router-link v-if="!isLoggedIn()" to="/login">
            <b-button  style="float:right; margin-right:15px;" pill variant="outline-primary" class="btn"> Login </b-button>
          </router-link>
        </ul>
      </nav>

    </header>
    </div>
    <router-view :recipes="recipes" :testRecipes="testRecipes" 
        @editRecipe="editRecipe" @emptyRecipe="emptyRecipe" :recipeToEdit="currentRecipe" :groceryList="groceryList" style="z-index:2"/>
  </div>
</template>

<script>
import auth from './auth';

export default {

  name: 'app',
  components: {
    
  },

  methods: {
    logout() {
      auth.logout();
    },
    isLoggedIn(){
       return auth.getToken() != null;
     },
     getUserId() {
       if(auth.getUser() != null){
       return auth.getUser().uid;
       }
       else {
         return 0;
       }
     },
     editRecipe(recipe) {
       this.currentRecipe = recipe;
       this.$router.push ("/SubmitRecipe");
     },
     emptyRecipe(){
       this.currentRecipe = {};
      //  this.$router.push("/HomePage/" + auth.getUser().uid);
     }
  },


  computed: {  

  },

  created() {
    fetch(`${process.env.VUE_APP_REMOTE_API}/api/recipes`, {
      headers: {
          Accept: 'application/json',
          'Content-Type': 'application/json', 
          Authorization: 'Bearer ' + auth.getToken()
        }
    })
    .then((response) => {
      return response.json();
    })
    .then((test) => {
      this.testRecipes = test;
      this.recipes = test;


      this.recipes.forEach((item) => item.recipePic = require(`./assets/${item.category}.jpg`))

    })
  },
  
    data() {
        return {
          currentRecipe: {},
          isFalse: false,
          testRecipes: [],
          recipes: [],
          groceryList: ['kiwi', 'chicken nuggs', 'capri suns']
    }
    }
}

</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  
  color: #2c3e50;
}
#app {
  background-image: url("assets/cuttingBoard5.jpeg");
  background-repeat: repeat-y;
  background-size: 100% auto;
  background-attachment: fixed;
  min-height: 1000px;
  
}
#nav {
  padding: 30px;
}




.btn {

  color: #0099CC; 
  background: transparent; 
  border: 2px solid #0099CC;
  margin-top: 5px;
  margin-right: 50px;

}



ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: black;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover {
  background-color: #111;
}




* {
  padding: 0;
  margin: 0;
}


</style>
