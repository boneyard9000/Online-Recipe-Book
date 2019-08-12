<template>
    <div id="recipe-details" ><br><br>
       
        <div class="row my-row">
            <div class="lg-col-6 my-column">
                <img class="img-fluid recipeImg" style="max-width:550px;" src="../assets/Chicken Kiev.jpeg">
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
            imageName: 'logo.png'
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
      return this.currentRecipe.directions.split('\n');
      }
      else {
          return [];
      }
  },
   ingredientsArray () {
      if(this.currentRecipe.ingredients){
      return this.currentRecipe.ingredients.split('\n');
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

.hero-image {
  display:block;
  background-image: url("../assets/foodBG.jpg");
  z-index: 2;
  padding-top: 20px;
  height: 100%;
  width: auto;
  background-position: stretch;
  background-repeat: no-repeat;
  background-size: cover;
  width: 1200px;
  
  
}
.left {
    display: flex;
    float: left;
}
.detailList {

    background-color: white;
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
    
    margin-top: 3em;
    margin: 0;
    padding: 0;
    position: relative;
}
.recipeImg {
    margin-left: 20px;
    
    width:90%;
    height:auto;
    max-width: 300px;
    border: 4px solid black;
    border-radius: 25px;
}
</style>