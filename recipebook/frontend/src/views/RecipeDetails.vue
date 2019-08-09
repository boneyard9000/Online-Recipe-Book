<template>
    <div id="recipe-details" class="container my-container">
        <br><br><br><br>

        <div class="row my-row">
            <div class="col-6 my-column">
                <img style="max-width:550px;" src="../assets/stock.jpg">
            </div>
            <div class="col-6 my-column-2">
                 <h2>{{currentRecipe.recipeName}}<br>
                        {{currentRecipe.category}}</h2>
             <div>Cook Time: {{currentRecipe.cookMins}}</div>

            <label>Ingredients</label>
            <ul v-for="item in ingredientsArray" :key="item">
                <li>{{item}}</li>
            </ul>


            <label>Directions</label>
            <ul v-for="step in directionsArray" :key="step">
                <li>{{step}}</li>
            </ul>
            </div>
        </div>

    </div>
</template>

<script>
import auth from '../auth';

export default {
    name: 'RecipeDetails',
    
    data() {
        return {
            currentRecipe: {},
           
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

  computed: {
  
  directionsArray () {
      if(this.currentRecipe.directions){
      return this.currentRecipe.directions.split('. ');
      }
      else {
          return [];
      }
  },
   ingredientsArray () {
      if(this.currentRecipe.ingredients){
      return this.currentRecipe.ingredients.split(',');
      }
      else {
          return [];
      }
  }

  }

}
</script>

<style scoped>
#recipe-details {
    background-color: rgb(175, 240, 145);
    color: black;
}
ul {
    background-color: rgb(175, 240, 145);
}
.my-row {
    height: 100%;
    width: 100%;
}
.my-column-2 {
    padding: 2em;
}
.my-container {
    height: 100%;
    margin: auto;
    padding: 1em;
}
</style>