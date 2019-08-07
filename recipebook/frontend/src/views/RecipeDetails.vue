<template>
    <div id="recipe-details">
        this is recipe details page
        <h2>Name: {{recipes[1].name}}</h2>
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
export default {
    name: 'RecipeDetails',
    props: {
        recipes: Array,
    }

}
</script>

<style scoped>
#recipe-details {
    background-color: rgb(175, 240, 145);
}
</style>
