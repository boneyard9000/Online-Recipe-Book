<template>
  <div id="app" style = "margin:0">
    <div id="headerDiv">
    <header>
    <div id="nav">
      
      <router-link to="/landingPage">Landing Page</router-link> |
      <router-link to="/login"> Login </router-link>|
      <router-link to="/register"> Register </router-link> |
      <router-link :to="{name: 'HomePage'}" >HomePage</router-link> |
      <button @click="logout"> Logout </button>


    </div>
    </header>
    
    </div>
    <router-view :recipes="recipes" :testRecipes="testRecipes"/>

    
  </div>
</template>

<script>
import auth from './auth';




export default {
  name: 'app',
  components: {
    
  },

  methods: {
    logout() {
      auth.logout();
    }
  },

  created() {
    fetch(`${process.env.VUE_APP_REMOTE_API}/api/recipes`, {
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
      this.testRecipes = test;
    })
  },
  
    data() {
        return {

          testRecipes: [],

            recipes: [
                {id: 1, name: 'Chicken Cheesecake', picSrc: require('./assets/stock.jpg'), description: 'sounds weird...is weird', steps: ['get a chicken',
                'kill and butcher, its easier if you do it quick', 'get a cheesecake', 'put chicken in to cheesecake', 'bake at 350 until golden brown'], 
                ingredients: ['Chicken - live', 'cheesecake', 'killing block']},
                {id: 2, name: 'Hot Dog Margarita', picSrc: require('./assets/stock.jpg'), description: 'technically edible', steps: ['purchase pack of 8 hot dogs minimum quality',
                'beat to pulp with mortar and pestal', 'cover in tequila', 'let cure in sun for half day'], ingredients: ['hot dogs', 'tequila']},
                {id: 3, name: 'Literal Dirt', picSrc: require('./assets/stock.jpg'), description: 'its literally just dirt', steps: ['go outside', 'find some dirt',
                'its not very hard to see where it goes from here', 'put said dirt in bowl of your choosing', 'dump out said dirt', 
                'repeat process until entire yard has been turned', 'wait 6-8 months for delicious veggies to grow', 'eat that, not the dirt.  Its better'],
                ingredients: ['4 lbs of dirt', 'good soil', '6-7 hrs a day of sun', 'a yard that doesnt suck too hard']},
                {id: 4, name: 'Oil Change', picSrc: require('./assets/stock.jpg'), description: 'this is not a recipe.  This is an oil change.  how did this get here',
                steps: ['let car sit at least 15 minutes to cool', 'jack up car and put on jack stands', 'open oil plug and drain in to drain pan', 'replace oil filter',
                'refill your oil', 'replace drain plug.  also change drain plug gasket if necessary', 'put car back on to ground', 'fill the oil and check level once settled',
                'Congratulations, you jsut changed you oil.  I bet youre hungry now...'], ingredients: ['oil (motor)', 'car jack', 'jack stands', '17 and 14 millimeter wrenches']},
                {id: 5, name: 'Unboiled Water', picSrc: require('./assets/stock.jpg'), description: 'tried of burnt water?  We can fix that', steps: ['Fill large pot with water', 
                'put on high an let reach a rolling boil', 'remove pot from flame and take it outside', 'throw that nastiness out', 'refill pot with fresh, unboiled wter from the tap.  the less boiled the better',
                'You have now learned how to make unboiled water.', 'profit'], ingredients: ['water (preboiled is OK (not ideal))', 'large pot', 'stove']}
            ]
        }
    }
}

</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}


/* header {
  background-image:url(./assets/cookingHeader.jpg);
  background-size: cover;
  background-position:center;
  height: 150px;
} */

* {
  padding: 0;
  margin: 0;
}


</style>
