<template>
    <div id="recipe-details" class="container my-container">
        <br><br><br>

        <div class="row my-row">
            <div class="lg-col-6 my-column">
                <img class="img-fluid recipeImg" style="max-width:550px;" src="../assets/stock.jpg">
            </div>
            <div class="lg-col-6 my-column-2" font-family: >
                 <h2>{{currentRecipe.recipeName}}<br>
                        {{currentRecipe.category}}</h2>
             <div class="left" >Cook Time: {{currentRecipe.cookMins}}</div>
            <br>
            <label class="left">Ingredients</label>
            <ul class="detailList" v-for="item in ingredientsArray" :key="item">
                <li>{{item}}</li>
            </ul>
            <br>

            <label class="left">Directions</label>
            <ul class="detailList" v-for="step in directionsArray" :key="step">
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
@import url('https://fonts.googleapis.com/css?family=Open+Sans&display=swap');
#recipe-details {
    /* background-color: rgb(175, 240, 145); */
    color: black;
}
.left {
    display: flex;
    float: left;
}
.detailList {

    background-color: transparent;
}
.my-row {
    height: 100%;
    width: 100%;
}
.my-column-2 {
    display: flex;
    flex-direction: column;
    width: 100%;
    padding-top: 0em;
    padding-left: 2em;
    padding-right: 2em;
}
.my-column-2 h2 {
    font-family: 'Open Sans';
    color:white;
    text-align: left;
    background: rgb(175, 240, 145);
    font-weight: 600;
    margin-top: 1em;
    padding: 10px;
    width: 100%;
    
}
.my-row label {
    font-family: 'Open Sans';
    text-decoration: underline;
    font-weight: 800;
    font-size: 18pt;
}
.my-container {
    
    margin-top: 100px;
  
    margin: auto;
    padding: 1em;
}
.recipeImg {
    margin-left: 20px;
    align-self: auto;
    width:90%;
    height:auto;
    max-width: 300px;
}
</style>