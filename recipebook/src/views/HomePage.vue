<template>
<div id="home-page">
<div class="recipe-of-day">
<div class="rod-header">
<h2>Recipe of the Day</h2>
<h2>Recipe Name</h2>
</div>
<a href="#"><img src="../assets/stock.jpg"> </a>
<div class="recipe-description">this is where the recipe description goes.  It will be an excellent recipe.  and a stellar description
    Much wow.  instant profit
</div>
<div class="recipe-text"><h4>This is where we tell you how to make the thing youre trying to make.</h4>
    <ul class="recipe-steps">
        <li>#1 figure out what youre trying to make.</li>
        <li>#2 make the thing youre trying to make.</li>
        <li>#3 actually thats pretty much it.</li>
        <li>#4 Consume product</li>
        <li>#5 dessert time</li>
    </ul>
</div>
</div>


<div class="extra-recipes-container">
<div class="recipes">
<div> <h3>Recipe Name</h3> </div>
<a href="#"><img src="../assets/stock.jpg"> </a>
</div>

<div class="recipes">
<div> <h3>Recipe Name</h3> </div>
<a href="#"><img src="../assets/stock.jpg"> </a>
</div>

<div class="recipes">
<div> <h3>Recipe Name</h3> </div>
<a href="#"><img src="../assets/stock.jpg"> </a>
</div>

<div class="recipes">
<div> <h3>Recipe Name</h3> </div>
<a href="#"><img src="../assets/stock.jpg"> </a>
</div>

<div class="recipes">
<div> <h3>Recipe Name</h3> </div>
<a href="#"><img src="../assets/stock.jpg"> </a>
</div>

</div>





</div>

</template>

<script>
export default {
    name: 'HomePage'
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
