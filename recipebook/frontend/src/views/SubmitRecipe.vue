<template>

    <div id="addRecipe" class="container">
        <h1>Submit a new recipe</h1>
        <b-form cols="4">
            <b-form-group class="control-label text-left"
              id="input-group-1"
              label="Recipe Name:"
              label-for="recipename"
          >
            <b-form-input
            id="firstname"
            class="form-control"
            placeholder="Example: BBQ Burger"
            type="text"
            required
            autofocus
            />
            </b-form-group>

            <b-form-group class="control-label text-left"
              id="input-group-1"
              label="Description:"
              label-for="description"
          >
            <b-form-input
            id="firstname"
            class="form-control"
            placeholder="Example: A hamburger marinated with barbeque sauce."
            type="text"
            required
            autofocus
            />
            </b-form-group>

             <b-form-group class="control-label text-left"
              id="input-group-1"
              label="Cook Time:"
              label-for="cooktime"
          >
            <b-form-input
            id="firstname"
            class="form-control"
            placeholder="Example: 25 minutes"
            type="text"
            required
            autofocus
            />
            </b-form-group>

<b-form-group class="control-label text-left"
              id="input-group-1"
              label="Directions:"
              label-for="textarea"
          >
            <b-form-textarea
                id="textarea"
                v-model="text"
                placeholder="STEP 1: Cook patty for 15 minutes"
                rows="3"
                max-rows="6"
            >
            </b-form-textarea>
</b-form-group>

            <pre class="mt-3 mb-0">{{ text }}</pre>

        </b-form>
    </div>

</template>

<script>
export default {

}
</script>

<style>
.input-group-1 label     {
  font-weight: 500;
  align-content: flex-start;
}



.form-register {
  max-width: 50%;
  margin: auto;
  
}



</style>
