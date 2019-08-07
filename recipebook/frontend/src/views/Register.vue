<template>
  <div id="register" class="container">
    <b-form cols="4" class="form-register" @submit.prevent="register">

          <h1 class="h3 mb-3 font-weight-normal">Create Account</h1>
          <div class="alert alert-danger" role="alert" v-if="registrationErrors">
            There were problems registering this user.
          </div>

          <b-form-group id="input-group-1">
          <b-form-input
            type="text"
            id="firstname"
            class="form-control"
            placeholder="First Name:"
            v-model="user.firstName"
            required
            autofocus
          />
          </b-form-group>

          

          <b-form-group id="input-group-2">
          <b-form-input
            type="text"
            id="lastname"
            class="form-control"
            placeholder="Last Name:"
            v-model="user.lastName"
            required
            autofocus
          />
          </b-form-group>
          
          

          <b-form-group id="input-group-3">
          <b-form-input
            type="password"
            id="password"
            class="form-control"
            placeholder="Password"
            v-model="user.password"
            required
          />
          </b-form-group>
          
          

          <b-form-group id="input-group-4">
          <b-form-input
            type="password"
            id="confirmPassword"
            class="form-control"
            placeholder="Confirm Password"
            v-model="user.confirmPassword"
            required
          />
          </b-form-group>
          
          

            <b-form-group id="input-group-5">
          <b-form-input
            type="text"
            id="email"
            class="form-control"
            placeholder="email"
            v-model="user.email"
            required
            autofocus
          />
            </b-form-group>
          
          

            <b-form-group id="input-group-6">
          <b-form-input
            type="text"
            id="phone"
            class="form-control"
            placeholder="Phone Number"
            v-model="user.phoneNumber"
            required
            autofocus
          />
            </b-form-group>
        
         

          <b-button pill variant="success" type="submit">
            Create Account
          </b-button>
          
         <br/>

          <router-link :to="{ name: 'login' }">
            Have an account?
          </router-link>
    </b-form>
  </div>
</template>

<script>
export default {
  name: 'register',
  data() {
    return {
      user: {
        firstName: '',
        lastName: '',
        password: '',
        confirmPassword: '',
        email: '',
        phoneNumber: '',
      },
      registrationErrors: false,
    };
  },
  methods: {
    register() {
      fetch(`${process.env.VUE_APP_REMOTE_API}/register`, {
        method: 'POST',
        headers: {
          Accept: 'application/json',
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(this.user),
      })
        .then((response) => {
          if (response.ok) {
            return (response.json());
          } else {
            this.registrationErrors = true;
            throw 'Register returned: ' + response.status;
          }
        })
        .then ((parsedData) => {
            if (parsedData.success) {
              this.$router.push({ path: '/login', query: { registration: 'success' } });
            } else {
              this.registrationErrors = true;
            }
        })
        .catch((err) => console.log(err));
    },
  },
};
</script>

<style>
.form-register {
  max-width: 50%;
  margin: auto;
}
</style>