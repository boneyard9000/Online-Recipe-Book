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
        testRecipes: Array,
    },
    data() {
        return {
            currentRecipeId: 1,
            currentUser: auth.getUser(),

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
        background-color: rgb(86, 133, 64);
    }
    h2 {
        font-size: 2.5em;
    }

    .rod-header {
        line-height: 2px;
    }

    .recipe-of-day img {
            border: 7px solid rgb(138, 184, 196);
            border-radius: 3%;
    }

    .extra-recipes-container {
        padding-bottom: 30px;
    }

    .recipe-steps{
        display: flex;
        flex-direction: column;
        list-style-position: inside;
        text-align: justify;
        text-justify: left;

        padding-left: 400px;
    }

h3 {
    font-size: 2em;
}
.recipes {
    display: inline-block;
    width: 18%;
    border: 1px solid rgb(138, 184, 196);
    padding-bottom: 15px;
    background-color: rgb(175, 240, 145);

}

.recipes div:first-of-type {
    display: block;
}

.recipes img {
    width: 80%;
    height: 80%;
    border: 4px solid rgb(138, 184, 196);;
    border-radius: 3%;
}

p{
    text-decoration: underline;
}
</style>
