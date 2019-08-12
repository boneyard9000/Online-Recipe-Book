<template>

    <div id="addRecipe" class="container">
        <h1>Submit a new recipe</h1>
        <b-form cols="4" @submit.prevent="addRecipe">

            <div class="alert alert-danger" role="alert" v-if="recipeErrors">
                There were problems submitting this recipe.
          </div>

            <b-form-group class="control-label text-left"
              id="input-group-1"
              label="Recipe Name:"
              label-for="recipeName"
          >
            <b-form-input
            id="recipeName"
            class="form-control"
            placeholder="Example: BBQ Burger"
            v-model="recipe.recipeName"
            type="text"
            required
            autofocus
            />
            </b-form-group>

            <b-form-group class="control-label text-left"
              id="input-group-2"
              label="Description:"
              label-for="description"
          >
            <b-form-input
            id="description"
            class="form-control"
            placeholder="Example: A hamburger marinated with barbeque sauce."
            v-model="recipe.description"

            type="text"
            required
            autofocus
            />
            </b-form-group>

             <b-form-group class="control-label text-left"
              id="input-group-3"
              label="Cook Time:"
              label-for="cooktime"
          >
            <b-form-input
            id="cooktime"
            class="form-control"
            placeholder="Example: 25 minutes"
            v-model="recipe.cookMins"

            type="text"
            required
            autofocus
            />
            </b-form-group>

            <b-form-group class="control-label text-left"
              id="input-group-4"
              label="Directions:"
              label-for="textarea"
          >
                <b-form-textarea
                    id="textarea"
                    placeholder="STEP 1: Cook patty for 15 minutes. STEP 2: Do this next."
                    v-model="recipe.directions"

                    rows="3"
                    max-rows="6"
                >
                </b-form-textarea>
            </b-form-group>

            <b-form-group class="control-label text-left"
              id="input-group-5"
              label="Ingredients:"
              label-for="ingredients"
          >
            <b-form-input
            id="ingredients"
            class="form-control"
            placeholder="Example: Buns, Patty, BBQ Sauce"
            v-model="recipe.ingredients"
            type="text"
            required
            autofocus
            />
            </b-form-group>

             <b-form-group class="control-label text-left"
              id="input-group-6"
              label="Category:"
              label-for="category"
          >
 
        <select v-model="recipe.category">
          <option disabled value="">Please select one</option>
          <option v-for="option in recipe.categories" :key="option">{{option.name}}</option>
        </select>
    
  <!-- <label for="Category">Please select a Category</label>
            <select class="form-control" name="category" id="category" v-model="category">
              <option :value="null" disabled selected>Select a Category</option>
              <option v-for="option in recipe.categories" :value="option.id" v-bind:key="option.name">{{option.name}}</option>
            </select> -->

          <!-- <v-menu offset-y>
         <template v-slot:activator="{ on }">
        <v-btn v-on="on" color="grey">
            <v-icon left>expand_more</v-icon>
            <span>Categories</span>
            </v-btn>
         </template>
            <v-list>
              <v-list-tile v-for="category in categories" :key="category.name">
                <v-list-tile-title>{{category.name}} </v-list-tile-title>
              </v-list-tile>
            </v-list>
          </v-menu> -->
          <!-- <div>
  <b-dropdown id="dropdown-1" text="Dropdown Button" class="m-md-2">
    <b-dropdown-item text="hahaha">First Action</b-dropdown-item>
    <b-dropdown-item>Second Action</b-dropdown-item>
    <b-dropdown-item>Third Action</b-dropdown-item>
    <b-dropdown-divider></b-dropdown-divider>
    <b-dropdown-item active>Active action</b-dropdown-item>
    <b-dropdown-item disabled>Disabled action</b-dropdown-item>
  </b-dropdown>
</div> -->


             <!-- <b-form-input
            id="firstname"
            class="form-control"
            placeholder="Example: Desserts, Breakfast amd Brunch, Appetizers and Snacks, Dinner, or Drinks"
            v-model="recipe.category"
            type="text"
            required
            autofocus
            /> -->

            </b-form-group>

            <b-button @click="redirect" pill variant="success" type="submit">
                Add Recipe
            </b-button>
        </b-form>
    </div>
    

</template>

<script>
import auth from '../auth';

export default {
    name: 'SubmitRecipe',
    data() {
      return {
        recipe: {
            recipeName: '',
            description: '',
            cookMins: '',
            directions: '',
            ingredients: '',
            category: '',
            categories: [
              {name:"Appetizer", id: 1},
              {name:"Beverage", id: 2},
              {name:"Breakfast", id: 3},
              {name:"Desert", id: 4},
              {name:"Dinner", id: 5},
              {name: "Lunch", id: 6}
            ]
        },
        recipeErrors: false
      };
    },
    methods: {
    addRecipe() {
      fetch(`${process.env.VUE_APP_REMOTE_API}/api/SubmitRecipe`, {
        method: 'POST',
        headers: {
          Accept: 'application/json',
          'Content-Type': 'application/json',
          Authorization: 'Bearer ' + auth.getToken()
        },
        body: JSON.stringify(this.recipe),
      })
      .then (() => {
          this.$router.push('/HomePage/' + auth.getUser().uid)
      });
    },
  },

}
</script>

<style >
h1 {
  color: white;
}
.input-group-1 label     {
  font-weight: 500;
  align-content: flex-start;
}



.form-register {
  max-width: 50%;
  margin: auto;
  
}



</style>
