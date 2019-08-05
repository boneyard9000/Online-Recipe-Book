<template>
  <div id="register" class="text-center">
    <form class="form-register" @submit.prevent="register">
      <h1 class="h3 mb-3 font-weight-normal">Create Account</h1>
      <div class="alert alert-danger" role="alert" v-if="registrationErrors">
        There were problems registering this user.
      </div>
      <label for="firstName" class="sr-only">First Name: </label>
      <input
        type="text"
        id="firstname"
        class="form-control"
        placeholder="First Name:"
        v-model="user.firstName"
        required
        autofocus
      />
      <br/>
      <br/>
      <label for="lastName" class="sr-only">Last Name: </label>
        <input
        type="text"
        id="lastname"
        class="form-control"
        placeholder="Last Name:"
        v-model="user.lastName"
        required
        autofocus
      />
       <br/>
      <br/>
      <label for="password" class="sr-only">Password: </label>
      <input
        type="password"
        id="password"
        class="form-control"
        placeholder="Password"
        v-model="user.password"
        required
      />
      <br/>
      <br/>
      <label for="confirmPassword" class="sr-only">Confrim Password: </label>
      <input
        type="password"
        id="confirmPassword"
        class="form-control"
        placeholder="Confirm Password"
        v-model="user.confirmPassword"
        required
      />
       <br/>
       <br/>
        <label for="email" class="sr-only">Email: </label>
        <input
        type="text"
        id="email"
        class="form-control"
        placeholder="email"
        v-model="user.email"
        required
        autofocus
      />
      <br/>
      <br/>
        <label for="phone" class="sr-only">Phone Number: </label>
        <input
        type="text"
        id="phone"
        class="form-control"
        placeholder="Phone Number"
        v-model="user.phone"
        required
        autofocus
      />
      <br/>
      <br/>
      <button class="btn btn-lg btn-primary btn-block" type="submit">
        Create Account
      </button>
      <br/>
      <br/>
      <router-link :to="{ name: 'login' }">
        Have an account?
      </router-link>
    </form>
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
        phoneNumber: 9999999999,
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
</style>