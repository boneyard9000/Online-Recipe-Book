<template>
<div id="home-page">
    <div class="home-page-background">
        <div class="page-wrapper">
<div class="greeting"><h1> Welcome {{currentUser.firstName}}!</h1></div>
<p>Click on a recipe below to learn more information<p>

        <h4 class="rod-header">Recipe Of The Day</h4>
<div class="container recipe-of-day recipes">
        <h2>{{recipes[1].recipeName}}</h2> 
        <h3>{{recipes[1].description}}</h3>

    <router-link :to="{name: 'RecipeDetails', params: {id: recipes[1].recipeId}}"> <img class="img-fluid rod-pic" src="../assets/stock.jpg"> </router-link>
    <div class="btn like-button"><button @click="saveToUser(recipes[1].recipeId, currentUser.id)"><div>Add to Favorites</div></button></div>
</div>


<div class="extra-recipes-container">

<div class="recipes" v-for="recipe in testRecipes" :key="recipe.recipeName">
    <h3>{{recipe.recipeName}} <div class="personal-category">{{recipe.category}}</div></h3>
    <router-link :to="{name: 'RecipeDetails', params: {id: recipe.recipeId}}"> <img class="personal-recipe-pic" src="../assets/forkAndKnife.jpeg"> </router-link>
    <div class="personal-description">{{recipe.description}}</div>
    <div class="personal-cook-time">Cook Time: {{recipe.cookMins}}</div>
</div>


</div>
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
        },
        createRandomId() {
            return Math.floor((Math.random() * this.recipes.length()) + 1)

        },
       
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
        color: white ;
    }

    ul {
        list-style-type: none;
        margin: 0;
        padding: 20px;
        overflow: hidden;
        background-color: lightgrey;
    }
    #home-page {
    background-color:rgb(197, 214, 208);
    }
    h2 {
        font-size: 1.5em;
        font-weight: 800;
    }

    .left {
    display: flex;
    float: left;
    font-family: 'Open Sans';
    text-decoration: underline;
    font-weight: 800;
    font-size: 18pt;
    }

    .myRow {
        width:100%;
        align-content: center;
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
    font-size: 1em;
}

h4 {
    font-size: 2em;
}
.recipes {
    display: block;
    height: 160px;
    width: 65%;
    padding-bottom: 15px;
    background-color: rgb(175, 240, 145);
    margin-bottom: 10px;
    margin-left: 2%;
    border: 5px solid black;
    border-radius: 25px;

}

 

.recipes h3 {
    text-align: left;
    padding-left: 1.2%;
    font-size: 1.5em;
}

.recipes .personal-recipe-pic {
    height: 80%;
    width: 35%;
    float: left;
    margin-left: 1%;
    border: 4px solid black;
    border-radius: 25px;
}

.personal-category {
    float: right;
    font-size: .7em;
    padding-right: 1%;
}

.personal-description {
    margin-top: auto;
    margin-bottom: auto;
    font-size: 1.5em;
}

.personal-cook-time {
    float: right;
    bottom: 2%;
    padding-right: 1%;
}


.recipes div:first-of-type {
    display: block;
}

p{
    text-decoration: underline;
    color: white;
}
 .recipe-of-day {
        width: 40%;
        background-color: rgb(175, 240, 145);
        height: 400px;
        border: 7px solid black;
        border-radius: 25px;  
        margin: 1% auto 1% auto;

    }

    .recipe-of-day .like-button {
        padding-top: 3%;
        margin-top: 1%;
        margin: auto;
        margin-top: .6%;
        width: 35%;
        font-weight: 900;
        color: black;
        border-color: black;
        background-color: rgb(131, 219, 91);

    }

        .recipe-of-day .like-button div {
        background-color: rgb(131, 219, 91);
        border: none;
        }


       
    .rod-header {
        line-height: 2px;
        margin-top: 20px;
        color: white;
    }

    .rod-pic {
        height: 60%;
        width: 100%;
        border: 4px solid black;
        border-radius: 25px;
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

    
</style>
