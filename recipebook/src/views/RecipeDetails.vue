<template>
    <div id="recipe-details">
        this is recipe details page
        <h2>Name: {{}}</h2>
        <div>Cook Time: {{cookTime}}</div>
        <img src="../assets/stock.jpg">
        <label>Ingredients</label>
        <ul class="ingredients-list">
            <li>list 1</li>
            <li>list 2</li>
        </ul>
        <label>Steps</label>
        <ul class="steps-list">
            <li>step 1</li>
            <li>step 2</li>
            <li>step 3</li>
            <li>step 4</li>
            <li>step 5</li>
            <li>step 6</li>
            <li>step 7</li>
        </ul>



    </div>
</template>

<script>
export default {
    name: 'RecipeDetails'

}
</script>

<style scoped>
</style>
