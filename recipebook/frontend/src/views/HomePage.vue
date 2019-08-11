<template>
<div id="home-page">
<h1> Welcome to your Recipe Book {{currentUser.firstName}} {{currentUser.lastName}}!</h1>
<p>Click on a recipe below to learn more information<p>




<div class="extra-recipes-container">

<div class="recipes" v-for="recipe in testRecipes" :key="recipe.recipeName">
<div> <h3>{{recipe.recipeName}}</h3> </div>
<router-link :to="{name: 'RecipeDetails', params: {id: recipe.recipeId}}"> <img src="../assets/forkAndKnife.jpeg"> </router-link>
</div>


</div>





</div>

</template>

<script>
import auth from '../auth';

export default {
    name: 'HomePage',

    props: {
        recipes: Array,
    },
    data() {
        return {
            currentUser: auth.getUser(),
            testRecipes: []


        }
    },

    methods:
    {
        updateCurrentRecipe() {
            this.$emit('updateCurrentRecipe', this.currentRecipe);
        }
        
    },
    created() {
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
        .then((test) => {
        this.currentUser = test;
        });

        fetch(`${process.env.VUE_APP_REMOTE_API}/api/recipes/user`, {
        headers: {
          Accept: 'application/json',
          'Content-Type': 'application/json', 
          Authorization: 'Bearer ' + auth.getToken()
        }
        })
        .then((response) => {
        return response.json();
        })
        .then((recipe) => {
        this.testRecipes = recipe;
        });
  },

}
</script>

<style scoped>

    ul {
        list-style-type: none;
        margin: 0;
        padding: 20px;
        overflow: hidden;
        background-color: lightgrey;
    }
    #home-page {
        /* background-color: rgb(86, 133, 64); */
    }
    h2 {
        font-size: 2.5em;
    }

    .left {
    display: flex;
    float: left;
    font-family: 'Open Sans';
    text-decoration: underline;
    font-weight: 800;
    font-size: 18pt;
    }

    .rod-header {
        line-height: 2px;
    }
      .rod-header h2 {
        font-family: 'Open Sans';
        color:white;
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
    .myRow {
        width:100%;
        align-content: center;
    }
    .myCol1 {

    }
    .myCol2 {
        margin-left: 2em;
    }
    .myCol2 h2 {
        font-family: 'Open Sans';
        color:white;
        background: rgb(175, 240, 145);
        font-weight: 600;
        padding: 10px;
        padding-right: 3em;
        
    }
    .extra-recipes-container {
        padding-bottom: 30px;
    }
    .detailList {
        background-color: transparent;
    }
    .recipe-steps{
        display: flex;
        flex-direction: column;
        list-style-position: inside;
        text-align: justify;
        text-justify: left;
        background-color: transparent;
        
    }

h3 {
    font-size: 2em;
}
.recipes {
    display: inline-block;
    width: 18%;
    border: 1px solid rgb(138, 184, 196);
    padding-bottom: 15px;
    /* background-color: rgb(175, 240, 145); */

}

.recipes div:first-of-type {
    display: block;
}

.dialyImg {
    margin-left: 20px;
    width:90%;
    height:auto;
    max-width: 300px;
}

p{
    text-decoration: underline;
}
</style>
