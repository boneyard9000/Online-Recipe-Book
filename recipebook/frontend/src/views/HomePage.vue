<template>
  <div id="home-page">
    <div class="home-page-background">
      <div class="page-wrapper">
        <div class="greeting">
        </div>
        <div class="click-info" style="font-size: 30px; text-align: center;">Welcome {{currentUser.firstName}}! Click on a recipe below to learn more information</div>

        <h4 class="rod-header">Featured Recipe</h4>
        <div class=" recipe-of-day">
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
          >Add To My Recipes</b-button>
        </div>






      <div class="container" style="background: lightgray;">
        <div class="box" v-for="recipe in testRecipes" :key="recipe.recipeName">
            <div class="imgBox">
              <img :src="recipe.recipePic" style="width: 100%; height: 250px;">
            </div>
            <div class="content" >
        <h3>{{ recipe.recipeName }}</h3>
        <p>Category: {{ recipe.category }}<br>
          <br>Description: {{ recipe.description }}<br>
          <br>Cook Time: {{ recipe.cookMins }}<br>
          <br>For further information such as recipe ingredients and directions click on the button below<br>
          <br><b-button :to="{name: 'RecipeDetails', params: {id: recipe.recipeId}}">Visit Recipe Page</b-button><br>
        </p>
        <b-button @click="deleteRecipe(recipe.recipeId)" class="trash-can" variant="danger"><i class="fa fa-trash-o"></i></b-button>
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

    deleteRecipe(recipeId) {
        fetch(`${process.env.VUE_APP_REMOTE_API}/api/deleteRecipeFromUser/${recipeId}`, {
          method: 'DELETE',
          headers: {Authorization: 'Bearer ' + auth.getToken()}
          })
             .then(() => location.reload());

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
  color: rgb(52, 62, 80);
  text-align: left;
  padding-left: 2%;
  font-weight: 900;
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


h3 {
  font-size: 1em;
}

h4 {
  font-size: 2em;
}




.trash-can {
  float: right;
  font-size: 1.2vw;
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
  background-color: rgb(182, 179, 179);
  border: 4px solid rgb(121, 107, 128);
  margin: 1.5% auto 1% auto;
  align-content: center;
  margin-bottom: 60px;
  box-shadow: 0 50px 50px rgba(0,0,0,0.7);
  opacity: .9;
  margin-top: 5vh;
}

.recipe-of-day h2 {
  padding-top: 1%;
  font-weight: 900;
  text-align: center;
  font-size: 2vw;
}

.recipe-of-day h3 {
  text-align: center;
  font-size: 2vw;
}


.btn {
  opacity: 0.8;
}

.btn-sm {
color: black;
}

.rod-header {
  line-height: 2px;
  margin-top: 20px;
  color: rgb(52, 62, 80);
  text-align: center;
}

.rod-pic {
  width: 80%;
  height: 80%;
  border: 4px solid white;
  border-radius: 25px;
  margin: 0 auto 0 auto;
  display: flex;
  justify-content: center;
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



.box {
  position: relative;
  width: 300px;
  height: 400px;
  background: rgba(0,0,0,0.7);
  box-shadow: 0 30px 30px rgba(0,0,0,0.7);
  margin-bottom: 20px;
  margin-left: auto;
  margin-right: auto;
}

.container p {
  color: black;
  text-decoration: none;
}


.box .imgBox {
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  width: 100%;
}

.box .imgBox img {
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  width: 100%;
  object-fit: cover;
  transition: 0.5s;
}

.box:hover .imgBox img {
  opacity: 0;
}

.box .content {
  position: absolute;
  bottom: 20px;
  left: 10%;
  width: 80%;
  height: 60px;
  background: #fff;
  transition: 0.5s;
  overflow: hidden;
  padding: 5px;
  box-sizing: border-box;
}

.box:hover .content {
  width: 100%;
  height: 100%;
  bottom: 0;
  left: 0;
  vertical-align: center;
}

.box .content h3 {
  margin: 0;
  padding: 0;
  font-size: 20px;
  text-align: center;
  vertical-align: center;
}

.box .content p {
  margin: 10px 0 0;
  padding: 0;
  opacity: 0;
  line-height: 1.2em;
  transition: 0.5s;
  text-align: justify;
}

.box:hover .content p {
  opacity: 1;
  transition-delay: 0.3s
}
.container {
  width: 80%;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}
</style>
