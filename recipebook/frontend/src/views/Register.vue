<template>
  <div id="register" class="container">
    <b-form cols="4" name="form1" class="form-register" @submit.prevent="register">

          <h1 class="h3 mb-3 font-weight-normal">Create Account</h1>
          <div class="alert alert-danger" role="alert" v-if="registrationErrors">
            There were problems registering this user.
          </div>

          <b-form-group class="control-label text-left"
              id="input-group-1"
              label="First Name:"
              label-for="firstname"
          >
            <b-form-input
            id="firstname"
            v-model="user.firstName"
            class="form-control"
            placeholder="Example: Nelly"
            type="text"
            required
            autofocus
            />
          </b-form-group>

          

          <b-form-group class="control-label text-left"
              id="input-group-2"
              label="Last Name:"
              label-for="lastname"   
          >
          <b-form-input
            type="text"
            id="lastname"
            class="form-control"
            placeholder="Example: Lovett"
            v-model="user.lastName"
            required
            autofocus
          />
          </b-form-group>
          
          

          <b-form-group class="control-label text-left"
              id="input-group-3"
              label="Password:"
              label-for="password"  
          >
          <b-form-input
            name="password"
            type="password"
            id="password"
            class="form-control"
            placeholder="Min. 4 characters, 1 number and both upper and lowercase letters."
            v-model="user.password"
            v-on:blur="CheckPassword"
            required
          />
          </b-form-group>
          
          

          <b-form-group class="control-label text-left"
              id="input-group-4"
              label="Confirm Password:"
              label-for="confirmPassword"
          >
          <b-form-input
            type="password"
            id="confirmPassword"
            class="form-control"
            placeholder="Type your password again"
            v-model="user.confirmPassword"
            v-on:blur="password_match"
            required
          />
          </b-form-group>
          
          

            <b-form-group class="control-label text-left"
                id="input-group-5"
                label="Email:"
                label-for="email"
            >
          <b-form-input
            type="email"
            id="email"
            class="form-control"
            placeholder="Example: n.lovett@sweeny.todd"
            v-model="user.email"
            required
            autofocus
          />
            </b-form-group>
          
          

            <b-form-group class="control-label text-left"
                id="input-group-6"
                label="Phone Number:"
                label-for="phone"
            >
          <b-form-input
            type="text"
            id="phone"
            class="form-control"
            placeholder="Example: 999-999-9999"
            v-model="user.phoneNumber"
            required
            autofocus
          />
            </b-form-group>
        
         

          <b-button pill variant="success" type="submit">
            Create Account
          </b-button>
          
         <br/>
         <br/>

          <router-link class="haveAcct" :to="{ name: 'login' }">
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

    CheckPassword() { 
    var p = document.getElementById('password').value,
        errors = [];
    if (p.length < 4) {
        errors.push("Your password must be at least 4 characters");
    }
    if (p.search(/[a-z]/i) < 0) {
        errors.push("Your password must contain at least one lowercase letter."); 
    }
    if (p.search(/[A-Z]/i) < 0) {
        errors.push("Your password must contain at least one uppercase letter."); 
    }
    if (p.search(/[0-9]/) < 0) {
        errors.push("Your password must contain at least one digit.");
    }
    if (errors.length > 0) {
        alert(errors.join("\n"));
        return false;
    }
    return true;
},

    password_match() {
      if (this.user.password != this.user.confirmPassword) {
        alert("Passwords do not match!");
      }
      console.log("Did it work?");
    }
  },
};
</script>

<style>
.control-label {
  color:white;
}

.h3 {
  color:white;
}

.haveAcct{
  padding-right: 43px;
  text-decoration: underline;
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