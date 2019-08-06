<template>
<div id="home-page">
<div class="recipe-of-day">
<div class="rod-header">
<h2>Recipe of the Day</h2>
<h2>{{recipes[0].name}}</h2>
</div>
<a :href="`/RecipeDetails/${recipes[0].id}`"><img :src="recipes[0].picSrc"> </a>
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


<div class="recipes" v-for="recipe in recipes" :key="recipe.name">
<div> <h3>{{recipe.name}}</h3> </div>
<a :href="`/RecipeDetails/${recipe.id}`"><img :src="recipe.picSrc"> </a>
<div><button>➕</button> Add to Favorites</div>
</div>


</div>





</div>

</template>

<script>
export default {
    name: 'HomePage',

    data() {
        return {
            recipes: [
                {id: 1, name: 'Chicken Cheesecake', picSrc: require('../assets/stock.jpg'), description: 'sounds weird...is weird', steps: ['get a chicken',
                'kill and butcher, its easier if you do it quick', 'get a cheesecake', 'put chicken in to cheesecake', 'bake at 350 until golden brown']},
                {id: 2, name: 'Hot Dog Margarita', picSrc: require('../assets/stock.jpg'), description: 'technically edible', steps: ['purchase pack of 8 hot dogs minimum quality',
                'beat to pulp with mortar and pestal', 'cover in tequila', 'let cure in sun for half day']},
                {id: 3, name: 'Literal Dirt', picSrc: require('../assets/stock.jpg'), description: 'its literally just dirt', steps: ['go outside', 'find some dirt',
                'its not very hard to see where it goes from here', 'put said dirt in bowl of your choosing', 'dump out said dirt', 
                'repeat process until entire yard has been turned', 'wait 6-8 months for delicious veggies to grow', 'eat that, not the dirt.  Its better']},
                {id: 4, name: 'Oil Change', picSrc: require('../assets/stock.jpg'), description: 'this is not a recipe.  This is an oil change.  how did this get here',
                steps: ['let car sit at least 15 minutes to cool', 'jack up car and put on jack stands', 'open oil plug and drain in to drain pan', 'replace oil filter',
                'refill your oil', 'replace drain plug.  also change drain plug gasket if necessary', 'put car back on to ground', 'fill the oil and check level once settled',
                'Congratulations, you jsut changed you oil.  I bet youre hungry now...']},
                {id: 5, name: 'Unboiled Water', picSrc: require('../assets/stock.jpg'), description: 'tried of burnt water?  We can fix that', steps: ['Fill large pot with water', 
                'put on high an let reach a rolling boil', 'remove pot from flame and take it outside', 'throw that nastiness out', 'refill pot with fresh, unboiled wter from the tap.  the less boiled the better',
                'You have now learned how to make unboiled water.', 'profit']}
            ]
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
