<template>
  <div id="home-page">
    <div class="home-page-background">
      <div class="page-wrapper">
        <div class="greeting">
          <h1>Welcome {{currentUser.firstName}}!</h1>
        </div>
        <div class="click-info">Click on a recipe below to learn more information</div>

        <h4 class="rod-header">Recipe Of The Day</h4>
        <div class="container recipe-of-day recipes">
          <h2>{{recipes[randomRecipeId].recipeName}}</h2>
          <h3>{{recipes[randomRecipeId].description}}</h3>

          <router-link
            :to="{name: 'RecipeDetails', params: {id: recipes[randomRecipeId].recipeId}}"
          >
            <img class="img-fluid rod-pic" src="../assets/stock.jpg" />
          </router-link>
          <b-button
            class="btn-sm"
            @click="saveToUser(recipes[randomRecipeId].recipeId, currentUser.id)"
          >Add To Favorites</b-button>
        </div>

        <div class="extra-recipes-container">
          <div class="recipes" v-for="recipe in testRecipes" :key="recipe.recipeName">
            <h3>
              {{recipe.recipeName}}
              <div class="personal-category">{{recipe.category}}</div>
            </h3>
            <router-link :to="{name: 'RecipeDetails', params: {id: recipe.recipeId}}">
              <img class="personal-recipe-pic" src="../assets/forkAndKnife.jpeg" />
            </router-link>
            <div class="personal-description">{{recipe.description}}</div>
            <div class="personal-cook-time">Cook Time: {{recipe.cookMins}}</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import auth from "../auth";

export default {
  name: "HomePage",

  props: {
    recipes: Array
  },
  data() {
    return {
      currentUser: auth.getUser(),
      testRecipes: [],
      randomRecipeId: 3
    };
  },

  methods: {
    updateCurrentRecipe() {
      this.$emit("updateCurrentRecipe", this.currentRecipe);
    },
    createRandomId() {
      return Math.floor(Math.random() * this.recipes.length() + 1);
    },
    saveToUser(recipeId, userId) {
          fetch(`${process.env.VUE_APP_REMOTE_API}/api/saveRecipeToUser`, {
        method: 'POST',
        headers: {
          Accept: 'application/json',
          'Content-Type': 'application/json',
          Authorization: 'Bearer ' + auth.getToken()
        },
        body: JSON.stringify(this.recipeId, this.userId),
      })
      .then (() => {
          this.$router.push('/HomePage/' + auth.getUser().uid)
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
      });

    this.randomRecipeId = Math.floor(Math.random() * this.recipes.length());
  }
};
</script>

<style scoped>
.home-page-background {
  background-image: url(../assets/foodBG.jpg);
  padding-top: 20px;
  background-position: stretch;
  background-repeat: no-repeat;
  background-size: 100% 100%;
  width: auto;
}
h1 {
  font-size: 1.5em;
}

.greeting {
  float: right;
  padding-right: 3.4%;
  font-size: 1em;
  color: white;
}

.click-info {
  color: white;
  text-align: left;
  padding-left: 2%;
}

ul {
  list-style-type: none;
  margin: 0;
  padding: 20px;
  overflow: hidden;
  background-color: lightgrey;
}
#home-page {
  background-color: rgb(197, 214, 208);
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
  display: block;
  height: 170px;
  width: 72%;
  padding-bottom: 15px;
  background-color: rgba(175, 240, 145, 0.4);
  margin-bottom: 10px;
  margin-left: 2%;
  border: 3px solid rgb(121, 107, 128);
  border-radius: 25px;
}

.recipes h3 {
  text-align: left;
  padding-left: 4%;
  font-size: 1.5em;
  padding-top: 0.5%;
  font-weight: 800;
}

.recipes .personal-recipe-pic {
  height: 75%;
  width: 35%;
  float: left;
  margin-left: 1%;
  border: 4px solid white;
  border-radius: 20px;
}

.personal-category {
  float: right;
  font-size: 0.7em;
  padding-right: 1%;
}

.personal-description {
  margin-top: auto;
  margin-bottom: auto;
  font-size: 1.5em;
  text-align: center;
}

.personal-cook-time {
  position: relative;
  right: 0px;
  bottom: 0px;
  padding-top: 10px;
  text-align: center;
}

.recipes div:first-of-type {
  display: block;
}

p {
  text-decoration: underline;
  color: white;
}
.recipe-of-day {
  width: 35%;
  background-color: rgb(96, 121, 86);
  height: 25%;
  border: 4px solid rgb(121, 107, 128);
  border-radius: 25px;
  margin: 1.5% auto 1% auto;
}

.recipe-of-day h2 {
  padding-top: 1%;
  font-weight: 900;
  text-align: center;
}

.btn {
  margin: 2% auto auto auto;
  opacity: 0.8;
}

.rod-header {
  line-height: 2px;
  margin-top: 20px;
  color: white;
  text-align: center;
}

.rod-pic {
  height: 60%;
  width: 95%;
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
