<template>
<div id="home-page">
<div class="recipe-of-day">
<div class="rod-header">
<h2>Recipe of the Day</h2>

<ul v-for="item in testRecipes" :key="item.name">
      <li>{{item.description}}</li>
    </ul>

<h2>{{recipes[0].name}}</h2>
</div>
<a @click="updateCurrentRecipe" :recipe="recipes[{id}]" :href="`/RecipeDetails/${recipes[0].id}`"><img :src="recipes[0].picSrc"> </a>
<div class="recipe-description">{{recipes[0].description}}
</div>
<div class="recipe-text">
    <ul class="recipe-steps" v-for="step in recipes[0].steps" :key="step">
        <li>
        {{step}}
        </li>
    </ul>
</div>

</div>


<div class="extra-recipes-container">

<div class="recipes" v-for="recipe in testRecipes" :key="recipe.recipeName">
<div> <h3>{{recipe.recipeName}}</h3> </div>
<router-link :to="{name: 'RecipeDetails', params: {id: recipe.recipeId}}"> <img src="../assets/stock.jpg"> </router-link>
<div><button>➕</button> Add to Favorites</div>
</div>


</div>





</div>

</template>

<script>
export default {
    name: 'HomePage',

    props: {
        recipes: Array,
        testRecipes: Array

    },
    data() {
        return {
            currentRecipeId: 1
        }
    },

    methods:
    {
        updateCurrentRecipe() {
            this.$emit('updateCurrentRecipe', this.currentRecipe);
        }

    }

}
</script>

<style scoped>
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
</style>
