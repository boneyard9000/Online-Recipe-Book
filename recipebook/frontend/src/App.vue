<template>
  <div id="app" style = "margin:0">
    <div id="headerDiv">
    <header>
    <div id="nav">
      
      <router-link to="/landingPage">Landing Page</router-link> |
      <router-link to="/login"> Login </router-link>|
      <router-link to="/register"> Register </router-link> |
      <router-link :to="{name: 'HomePage'}" >HomePage</router-link> |
      <button @click="logout"> Logout </button>


    </div>
    </header>
    
    </div>
    <router-view/>
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

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}


/* header {
  background-image:url(./assets/cookingHeader.jpg);
  background-size: cover;
  background-position:center;
  height: 150px;
} */

* {
  padding: 0;
  margin: 0;
}


</style>
