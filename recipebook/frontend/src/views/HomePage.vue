<template>
  <div id="home-page">
    <div class="home-page-background">
      <div class="page-wrapper">
        <div class="greeting">
        </div>
        <div class="click-info" style="font-size: 30px; text-align: center;">Welcome {{currentUser.firstName}}! Click on a recipe below to learn more information</div>

        <h4 class="rod-header">Recipe Of The Day</h4>
        <div class="container recipe-of-day recipes">
          <h2>{{recipes[randomRecipeId].recipeName}}</h2>
          <h3>{{recipes[randomRecipeId].description}}</h3>

          <router-link
            :to="{name: 'RecipeDetails', params: {id: recipes[randomRecipeId].recipeId}}"
          >
            <img class="img-fluid rod-pic" :src="recipes[randomRecipeId].recipePic" />
          </router-link>
          <b-button
            class="btn-sm"
            @click="saveToUser(recipes[randomRecipeId])"
          >Add To Favorites</b-button>
        </div>

        <div class="extra-recipes-container">
          <div class="container recipes" v-for="recipe in testRecipes" :key="recipe.recipeName">
             <div class="recipe-left-side">

            <div class="recipes-name">
              {{recipe.recipeName}}
            </div>
            <router-link :to="{name: 'RecipeDetails', params: {id: recipe.recipeId}}">
              <img class="personal-recipe-pic" :src="recipe.recipePic" />
            </router-link>
          </div>
            <div class="recipe-right-side">
            <div class="personal-category">{{recipe.category}}</div>
            <div class="personal-description">{{recipe.description}}</div>
            <div class="personal-cook-time">Cook Time: {{recipe.cookMins}}</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import auth from "../auth";
import { createHash } from 'crypto';

export default {
  name: "HomePage",

  props: {
    recipes: Array
  },
  data() {
    return {
      currentUser: auth.getUser(),
      testRecipes: [],
      randomRecipeId: 3,
      recipePic: ''
    };
  },

  methods: {
      emptyRecipe(currentRecipe){
      this.$emit('emptyRecipe', this.currentRecipe)
      },
    getRecipeImg(category) {
      return `../assets/${category}.jpg`
    },
    updateCurrentRecipe() {
      this.$emit("updateCurrentRecipe", this.currentRecipe);
    },
    
    saveToUser(recipe) {
          fetch(`${process.env.VUE_APP_REMOTE_API}/api/saveRecipeToUser`, {
        method: 'POST',
        headers: {
          Accept: 'application/json',
          'Content-Type': 'application/json',
          Authorization: 'Bearer ' + auth.getToken()
        },
        body: JSON.stringify(this.recipes[this.randomRecipeId]),
      })
      .then (() => {
             location.reload();
      });
    }
  },
  created() {
    fetch(`${process.env.VUE_APP_REMOTE_API}/api/user`, {
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
        Authorization: "Bearer " + auth.getToken()
      }
    })
      .then(response => {
        return response.json();
      })
      .then(test => {
        this.currentUser = test;
      });

    fetch(`${process.env.VUE_APP_REMOTE_API}/api/recipes/user`, {
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
        Authorization: "Bearer " + auth.getToken()
      }
    })
      .then(response => {
        return response.json();
      })
      .then(recipe => {
        this.testRecipes = recipe;
        this.testRecipes.forEach((item) => { 
          if(item.recipePic === '') {
          item.recipePic = require(`../assets/${item.category}.jpg`);
          }
        })
      });
       
      

    this.randomRecipeId = Math.floor(Math.random() * this.recipes.length);
  },
};
</script>

<style scoped>

h1 {
  font-size: 1.5em;
}

.greeting {
  float: right;
  padding-right: 3.4%;
  font-size: 1em;
  color: white;
  font-weight: 800;
}

.click-info {
  color: white;
  text-align: left;
  padding-left: 2%;
  font-weight: 800;
}

ul {
  list-style-type: none;
  margin: 0;
  padding: 20px;
  overflow: hidden;
  background-color: lightgrey;
}

h2 {
  font-size: 1.5em;
  font-weight: 800;
}

.left {
  display: flex;
  float: left;
  font-family: "Open Sans";
  text-decoration: underline;
  font-weight: 800;
  font-size: 18pt;
}

.myRow {
  width: 100%;
  align-content: center;
}

.myCol2 {
  margin-left: 2em;
}
.myCol2 h2 {
  font-family: "Open Sans";
  color: white;
  background: rgb(175, 240, 145);
  font-weight: 600;
  padding: 10px;
  padding-right: 3em;
}
.extra-recipes-container {
  padding-bottom: 30px;
  width: 100%;
}
.detailList {
  background-color: transparent;
}
.recipe-steps {
  display: flex;
  flex-direction: column;
  list-style-position: inside;
  text-align: justify;
  text-justify: left;
  background-color: transparent;
}

h3 {
  font-size: 1em;
}

h4 {
  font-size: 2em;
}
.recipes {
  display: flex;
  height: 170px;
  width: 72%;
  padding-bottom: 0px;
  padding-top: 10px;
  background-color: rgba(86, 110, 75, 0.8);
  margin-bottom: 10px;
  margin-left: 2%;
  border: 3px solid rgb(121, 107, 128);
  border-radius: 25px;
}

.recipe-left-side{
  display: inline-block;
  width: 35%;
  height: 95%;
}

.recipe-right-side {
  display: inline-block;
  width: 70%;
  height: 95%;

}

.recipes .recipes-name {
  text-align: left;
  padding-left: 4%;
  height: 25%;
  font-size: 1.7vw;
  padding-top: 0.5%;
  font-weight: 900;
  color: rgb(41, 38, 38);
  white-space: nowrap;
}

.recipes .personal-recipe-pic {
  height: 70%;
  width: auto;
  margin-left: 1%;
  border: 4px solid white;
  border-radius: 20px;
}

.personal-category {
  font-size: 1.3vw;
  text-align: right;
  padding-right: 1%;
  color: rgb(41, 38, 38);
  font-weight: 800;
}

.personal-description {
  margin-top: auto;
  margin-bottom: auto;
  font-size: 1.4vw;
  text-align: center;
    color: rgb(41, 38, 38);
    font-weight: 700;
}

.personal-cook-time {
  text-align: right;
   color: rgb(41, 38, 38);
  font-weight: 700;
  font-size: 1.3vw;
  }

.recipes div:first-of-type {
  display: block;
}



p {
  text-decoration: underline;
  color: white;
}

button {
  margin-left: auto;
  margin-right: auto;
}

.recipe-of-day {
  width: 35%;
  display: flex;
  flex-direction: column;
  background-color: rgb(96, 121, 86, 0.8);
  height: 25%;
  border: 4px solid rgb(121, 107, 128);
  border-radius: 25px;
  margin: 1.5% auto 1% auto;
  align-content: center;
  margin-bottom: 60px;

}

.recipe-of-day h2 {
  padding-top: 1%;
  font-weight: 900;
  text-align: center;
}

.recipe-of-day h3 {
  text-align: center;
}


.btn {
  opacity: 0.8;

}

.btn-sm {
  color:white;
}

.rod-header {
  line-height: 2px;
  margin-top: 20px;
  color: white;
  text-align: center;
}

.rod-pic {
  width: auto;
  border: 4px solid white;
  border-radius: 25px;
  margin: 0 auto 0 auto;
}
.rod-header h2 {
  font-family: "Open Sans";
  color: white;
  background: rgb(175, 240, 145);
  font-weight: 600;
  margin-top: 1em;
  padding: 10px;
  width: 100%;
}
.RofDay {
  height: auto;
  padding: 2em;
  display: flex;
  text-align: left;
}
</style>
