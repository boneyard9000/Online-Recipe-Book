<template>

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
          item.recipePic = require(`../assets/${item.category}.jpg`);
        })
      });
    }
}
</script>

<style scoped>

.personal-recipe-pic{
  height: 70%;
  width: 95%;
  margin-left: 1%;
  border: 4px solid white;
  border-radius: 20px;
}

</style>