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
              id="input-group-6"
              label="Category:"
              label-for="category"
          >
 
        <select v-model="recipe.category" class="form-control">
          <option disabled value="">Please select one</option>
          <option v-for="option in categories" :key="option.id">{{option.name}}</option>
        </select>

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
              id="input-group-5"
              label="Ingredients:"
              label-for="ingredients"
          >
            <b-form-textarea
            id="ingredients"
            placeholder="Example: Buns, Patty, BBQ Sauce"
            v-model="recipe.ingredients"
            type="text"

            rows="3"
            max-rows="20"
            />
            </b-form-group>

            <b-form-group class="control-label text-left"
              id="input-group-4"
              label="Directions:"
              label-for="textarea"
          >
                <b-form-textarea
                    id="textarea"
                    placeholder="Put each direction on a new line"
                    v-model="recipe.directions"

                    rows="3"
                    max-rows="20"
                >
                </b-form-textarea>
            </b-form-group>
            <b-button pill variant="success" type="submit">
                Add Recipe
            </b-button>
        </b-form>
    </div>
    

</template>

<script>
import auth from '../auth';
import { isNull } from 'util';

export default {
    name: 'SubmitRecipe',
    props: {
      recipeToEdit: {
        type: Object,
        default() {
          return {
            recipeId: null,
            recipeName: '',
            description: '',
            cookMins: '',
            directions: '',
            ingredients: '',
            category: '',
          }
        }
      }  
    },

    data() {
      return {
        categories: [
              {name:"Appetizer", id: 1},
              {name:"Beverage", id: 2},
              {name:"Breakfast", id: 3},
              {name:"Desert", id: 4},
              {name:"Dinner", id: 5},
              {name: "Lunch", id: 6}
            ],

        recipe: this.recipeToEdit,
        recipeErrors: false
      };
    },
    methods: {
    addRecipe() {
      if(this.recipe.recipeId==null) {
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
      } else {
        fetch(`${process.env.VUE_APP_REMOTE_API}/api/recipes/`+ this.recipe.recipeId, {
          method: 'PUT',
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
      }
    },
  },

}
</script>

<style>

/* #addRecipe {
  opacity: .9;
} */
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
.container {
  background-color: rgb(50, 58, 66);
}



</style>
