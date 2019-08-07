<template>
  <div id="login" class="container">
    <b-form cols="4" class="form-signin" @submit.prevent="login">

      <h1 class="h3 mb-3 font-weight-normal">Please Sign In</h1>
      <div class="alert alert-danger" role="alert" v-if="invalidCredentials">
        Invalid username and password!
      </div>

      <div class="alert alert-success" role="alert" v-if="this.$route.query.registration">
        Thank you for registering, please sign in.
      </div>

       <b-form-group id="input-group-1">
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
      
      <b-form-group id="input-group-2">
          <b-form-input
            type="password"
            id="password"
            class="form-control"
            placeholder="Password"
            v-model="user.password"
            required
          />
      </b-form-group>

      <b-button pill variant="success" type="submit">Sign in</b-button>

      <br/>
      
      <router-link :to="{ name: 'Register' }">Need an account?</router-link>
      
    </b-form>
  </div>
</template>

<script>
import auth from '../auth';

export default {
  name: 'login',
  components: {},
  data() {
    return {
      user: {
        username: '',
        password: '',
      },
      invalidCredentials: false,
    };
  },
  methods: {
    login() {
      fetch(`${process.env.VUE_APP_REMOTE_API}/login`, {
        method: 'POST',
        headers: {
          Accept: 'application/json',
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(this.user),
      })
        .then((response) => {
          if (response.ok) {
            return response.text();
          } else {
            this.invalidCredentials = true;
          }
        })
        .then((token) => {
          if (token != undefined) {
            if (token.includes('"')) {
              token = token.replace(/"/g, '');
            }
            auth.saveToken(token);
            this.$router.push('/');
          }
        })
        .catch((err) => console.error(err));
    },
  },
};
</script>

<style scoped>
.form-signin {
  max-width: 50%;
  margin: auto;
}
</style>