<template>

    <div id="addRecipe" class="container">
        <h1>Your recipe</h1>
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

            <b-form-group class="control-label text-left" id="input-group-5" label="Ingredients:" label-for="ingredients">
                <input v-model="quantity" type="text" style="margin-right: 30px; margin-left:20px;" placeholder="Enter Quantity Here">
                <select v-model="units" style="margin-right: 20px;">
                  <option>Misc</option>
                  <option>Cup(s)</option>
                  <option>Tbsp(s)</option>
                  <option>Tsp(s)</option>
                  <option>Fl oz</option>
                  <option>Milliliter(s)</option>
                  <option>Liter(s)</option>
                  <option>Pound(s)</option>
                  <option>Ounce(s)</option>
                  <option>Gram(s)</option>
                </select>
                <input v-model="ingredientName" type="text" style="margin-right: 30px; margin-left:20px;" placeholder="Enter Name Here">
                <b-button pill variant="success" v-on:click="addIngredient">Add Ingredient</b-button>
                <p v-for="(thing, index) in ingredientArray" style="color:white; margin-bottom: 10px; text-align: center;">{{ thing }} <b-button v-on:click="removeIngredient(index)" style="margin-left: 15px;">REMOVE</b-button></p>


           
            </b-form-group>

            <b-form-group class="control-label text-left"
              id="input-group-4"
              label="Directions:"
              label-for="textarea"
          >
                <b-form-textarea
                    id="textarea"
                    placeholder="Put each direction on a new line (ex: Preheat the oven to 325 °F)"
                    v-model="recipe.directions"

                    rows="3"
                    max-rows="20"
                >
                </b-form-textarea>
            </b-form-group>
            
            <b-form-group class="control-label text-left"
              id="input-group-3"
              label="Image URL (optional):"
              label-for="Img"
          >
            <b-form-input
            id="Img"
            class="form-control"
            placeholder="Example: http://foodpictureURL.com"
            v-model="recipe.recipePic"
            type="url"
            autofocus
            />
            </b-form-group>
            <b-button pill variant="success" type="submit">
                Save Recipe
            </b-button><br>
            <div class="space">.</div>
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
            specificIngredient: '',
            ingredients: '',
            category: '',
            recipePic: ''
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
              {name:"Dessert", id: 4},
              {name:"Dinner", id: 5},
              {name: "Lunch", id: 6}
            ],
        quantity: '',
        units: '',
        ingredientName: '',
        ingredientArray: [],
        recipe: this.recipeToEdit,
        recipeErrors: false
      };
    },
    methods: {
    
    addIngredient() {
      this.specificIngredient = this.quantity + ' ' + this.units + ' of ' + this.ingredientName;
      console.log(this.specificIngredient);
      this.ingredientArray.push(this.specificIngredient);
      if (this.ingredients === "") {
        this.ingredients = this.quantity + ' ' + this.units + ' of ' + this.ingredientName + '\n';
      } else {
        this.ingredients += this.quantity + ' ' + this.units + ' of ' + this.ingredientName + '\n';
      }
      this.quantity = '';
      this.units = '';
      this.ingredientName = '';
      this.recipe.ingredients = this.ingredients.substring(9);
    },
    removeIngredient(index) {
      this.ingredientArray.splice(index, 1);
      this.recipe.ingredients = '';
      for (let i =0; i < this.ingredientArray.length; i++) {
        this.recipe.ingredients += this.ingredientArray[i] + '\n';
      }
    },
    emptyRecipe(currentRecipe){
      this.$emit('emptyRecipe', currentRecipe)
    },
    addRecipe() {
      if(this.recipe.recipePic == null) {
        this.recipe.recipePic = '';
      }
      if(this.recipe.recipeId == null) {
        fetch(`${process.env.VUE_APP_REMOTE_API}/api/SubmitRecipe`, {
          method: 'POST',
          headers: {
            Accept: 'application/json',
            'Content-Type': 'application/json',
            Authorization: 'Bearer ' + auth.getToken()
          },
          body: JSON.stringify(this.recipe),
        })
        .then(this.$emit('emptyRecipe', this.currentRecipe))
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
        .then (this.$emit('emptyRecipe', this.currentRecipe))
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
  background-color: rgba(50, 58, 66, 0.8);
}

.space {
  margin:1px;
}

</style>
