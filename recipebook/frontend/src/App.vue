<template>
  <div id="app" style = "margin:0">
    <div id="headerDiv">
    <header>

      <nav style="width:100%; float:right;">
        <ul>
          <li style="padding-left:20px;"><router-link to="/landingPage">Landing Page</router-link></li>
          <li><router-link to="/register"> Register </router-link> </li>
          <li><router-link :to="{name: 'HomePage'}" >HomePage</router-link></li>
          <li><router-link :to="{name: 'SubmitRecipe'}" >SubmitRecipe</router-link></li>

          
          <router-link v-if="isLoggedIn()" to="/landingPage">
            <b-button style="float:right; " pill variant="outline-primary" @click="logout" class="btn"> Logout </b-button>
          </router-link>  
          <router-link v-if="!isLoggedIn()" to="/login">
            <b-button  style="float:right; margin-right:15px;" pill variant="outline-primary" class="btn"> Login </b-button>
          </router-link>
        </ul>
      </nav>

      

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
    },
    isLoggedIn(){
       return auth.getToken() != null;
     }
  },


  computed: {  
 
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
          currentRecipe: {},
          isFalse: false,
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




.btn {

  color: #0099CC; 
  background: transparent; 
  border: 2px solid #0099CC;
  margin-top: 5px;
  margin-right: 50px;

}



ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover {
  background-color: #111;
}

#logo {
  width: 75px;
  height: 75px;
  padding-left: 20px;
}


* {
  padding: 0;
  margin: 0;
}


</style>
