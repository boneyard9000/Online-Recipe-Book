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

      <div class="alert alert-warning" role="alert" v-if="this.$route.query.landingPage">
        You must log in to access the home page.
      </div>

       <b-form-group class="control-label text-left"
          id="input-group-1"
          label="Your Email:"
          label-for="email"
        >  
          <b-form-input
            type="email"
            id="email"
            class="form-control"
            placeholder="example@mail.com"
            v-model="user.email"
            required
            autofocus
          />
       </b-form-group>
      
      <b-form-group class="control-label text-left"
          id="input-group-2"
          label="Your Password:"
          label-for="confirmPassword"
          >
          <b-form-input
            type="password"
            id="password"
            class="form-control"
            placeholder="Type your password here"
            v-model="user.password"
            required
          />
      </b-form-group>

    <router-link :to="{ name: 'login' }"><b-button pill variant="success" v-on:click="login">Sign in</b-button></router-link>

      <br/>
      <br/>
      
    <router-link class="needAcct" :to="{ name: 'Register' }">Need an account?</router-link>
      
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
            this.$router.push('/HomePage');
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
.needAcct {
  padding-right: 38px;
  text-decoration: underline;
}
</style>