<template>
    <div id="recipe-details">
        this is recipe details page
        <h2>Name: {{currentRecipe.name}}</h2>
        <div>Cook Time: </div>
        <div><button>➕</button> Add to Favorites</div>
        <img src="../assets/stock.jpg">
        <label>Ingredients</label>
        <ul class="ingredients-list" v-for="item in recipes[1].ingredients" :key="item">
            <li>{{item}}</li>
        </ul>
        <label>Steps</label>
        <ul class="steps-list" v-for="step in recipes[1].steps" :key="step">
            <li>{{step}}</li>
           
        </ul>



    </div>
</template>

<script>
import auth from '../auth';

export default {
    name: 'RecipeDetails',
    props: {
        recipes: Array,
        currentRecipeId: String
    },
    data() {
        return {
            currentRecipe: {}
        }
    },
    created() {
         fetch(`${process.env.VUE_APP_REMOTE_API}/api/recipeDetails/${this.$route.params.id}`, {
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
      this.currentRecipe = test;
    })
  },
    

}
</script>

<style scoped>
#recipe-details {
    background-color: rgb(175, 240, 145);
    color: white;
}
</style>
