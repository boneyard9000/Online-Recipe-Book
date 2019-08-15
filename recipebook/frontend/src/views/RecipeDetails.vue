<template>
    
     <div id="recipe-details"><br><br>
       
        <div class="row my-row">
            <div class="my-column">
                <div class="imgDiv">
                        <!-- <img class="recipeImg"  src="../assets/Chicken Kiev.jpeg"> -->
                    <img class="recipeImg"  :src="currentRecipe.recipePic">
                </div>
                    <div><b-button
            class="btn-sm"
            @click="saveToUser(currentRecipe[recipeId])"
          >Add To My Recipes</b-button>
          </div>
                <div class="titleBlock">
                    <h2>{{currentRecipe.recipeName}}</h2>
                    <p>{{currentRecipe.description}}</p>
                </div> 

                <div class="detailList">Cook Time: {{currentRecipe.cookMins}}<br>
                Category: {{currentRecipe.category}}</div>
                <br>

                <label>Ingredients</label>
                    <ul class="detailList" v-for="item in ingredientsArray" :key="item">
                        <li>{{item}}</li>
                    </ul>
                <b-button squared variant="info" type="button" v-on:click="addToGroceryList">Add Ingredients to Grocery List!</b-button>
                <br>

                <label>Directions</label>
                    <ul class="detailList" v-for="step in directionsArray" :key="step">
                        <li>{{step}}</li>
                    </ul>
                <div class="recipeActions">
                    <b-button squared variant="info" href="#" class="edit-recipe" @click="editRecipe(currentRecipe)">Edit This Recipe
                    </b-button>
                </div>
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
            imageName: 'logo.png',
            currentUser: auth.getUser(),
            groceries: '',
            currentGroceryList: {
                allGroceries: ''
            }
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
      if(this.currentRecipe.recipePic === '') {
      this.currentRecipe.recipePic = require(`../assets/${this.currentRecipe.category}.jpg`);
      }
    });
    
    fetch(`${process.env.VUE_APP_REMOTE_API}/api/user`, {
        headers: {
          Accept: 'application/json',
          'Content-Type': 'application/json', 
          Authorization: 'Bearer ' + auth.getToken()
        }
        })
        .then((response) => {
        return response.json();
        })
        .then((myUser) => {
        this.currentUser = myUser;
        this.groceries = myUser.groceryList;
        });
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

  },

  methods: {
       saveToUser(recipe) {
        fetch(`${process.env.VUE_APP_REMOTE_API}/api/saveRecipeToUser`, {
        method: 'POST',
        headers: {
          Accept: 'application/json',
          'Content-Type': 'application/json',
          Authorization: 'Bearer ' + auth.getToken()
        },
        body: JSON.stringify(this.currentRecipe),
      })
      .then (() => {
             location.reload();
      });
    },

       editRecipe(currentRecipe) {
            this.$emit("editRecipe", currentRecipe)
        },
        
      addToGroceryList() {
          
          for (let i = 0; i < this.ingredientsArray.length; i++) {
              if (this.ingredientsArray[i] === '') {
                  console.log("is null");
              }

              else {
                this.groceries += ", " + this.ingredientsArray[i] ;
              }
          }
        this.currentGroceryList.allGroceries = this.groceries;
        this.contactDatabase();
      },
      contactDatabase() {
          fetch(`${process.env.VUE_APP_REMOTE_API}/api/groceries`, {
              method: 'PUT',
        headers: {
          Accept: 'application/json',
          'Content-Type': 'application/json', 
          Authorization: 'Bearer ' + auth.getToken()
        },
        body: JSON.stringify(this.currentGroceryList)
        }).then(() => {
             this.$router.push('/GroceryList');
        }
        )

      }
  }

}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css?family=Open+Sans&display=swap');
#recipe-details {
    color: black;
}

.hero-image {
  display:block;
  background-image: url("../assets/foodBG.jpg");
  padding-top: 20px;
  height: 100%;
  width: auto;
  background-position: stretch;
  background-repeat: no-repeat;
  background-size: cover;
  width: 1200px;
  
  
}

.detailList {
    padding: 10px;
    background-color: white;
}
.my-row {
    position: relative;
    height: 100%;
    width: 550px;
    margin-left: auto;
    margin-right: auto;
}

.my-column {
   
    width: 100%;
    padding:10px;
    background-color: rgba(50, 58, 66, 0.8);
}
.titleBlock {
    font-family: 'Open Sans';
    color:white;
    text-align: left;
    border: 2px solid darkslategrey;
    border-radius: 25px;
    background: slategrey;
    font-weight: 600;
    margin-top: .5em;
    margin-bottom: 1em;
    padding: 10px;
    padding-left: 20px;
    width: 100%;
    
}
.my-row label {
    font-family: 'Open Sans';
    text-decoration: underline;
    color:white;
    font-weight: 800;
    font-size: 18pt;
}
.my-container {
    
    margin-top: 3em;
    margin: 0;
    padding: 0;
    position: relative;
}
.imgDiv {
    display: flex;
    align-items:center;
    justify-content:center;
}
.recipeImg {
    
    width:90%;
    height:auto;
    border: 8px solid lightgrey;
    border-radius: 25px;
}
b-button {
    background-color: blue;
}
</style>