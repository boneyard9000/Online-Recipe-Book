<template>

<div class="text-color">
  <!-- The main-page div includes the nav bar -->
  <div id="main-page" style="text-align: center;">
    <div class="container" style="background: gray;">
        <div class="click-info" style="font-size: 30px; text-align: center; color: white;">Welcome {{currentUser.firstName}}!</div>
        <div class="click-info" style="font-size: 30px; text-align: center; color: white;">Hover over a recipe below to learn more information</div>

      <div class="box" v-for="recipe in testRecipes" :key="recipe.recipeName" style="float:left; margin: 10px;"> 
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
        </div>
      </div>
    </div>
  </div>
</div>
</template>

<script>
import auth from "../auth";

export default {

    name: "AllRecipes",

    props: {
        recipes: Array
    },

    data(){
        return{
            currentUser: auth.getUser(),
            testRecipes: [],
            recipes: [],
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
    },

    created(){
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
    
        .then(recipe => {
        this.testRecipes = recipe;
        this.testRecipes.forEach((item) => {
            if(item.recipePic == '' || item.recipePic == null){
          item.recipePic = require(`../assets/${item.category}.jpg`);
            }
        })
      });
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
    }
}
</script>

<style scoped>

body {
  margin: 0;
  padding: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  
}

.container {
  width: 1000px;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}

.box {
  position: relative;
  width: 300px;
  height: 400px;
  background: rgba(0,0,0,0.7);
  box-shadow: 0 30px 30px rgba(0,0,0,0.7);
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

</style>