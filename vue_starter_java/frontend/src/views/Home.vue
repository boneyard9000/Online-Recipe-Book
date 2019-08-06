<template>
  <div class="home">
    <h1>Home</h1>
    <p>You must be authenticated to see this. You are logged in as {{user.sub}}.</p>
    <button @click="logout">logout</button>
  </div>
</template>

<script>
import auth from '@/auth.js'

export default {
  name: 'home',
  data() {
    return {
      user: auth.getUser()
    }
  },
  methods: {
    logout() {
      auth.logout();
      this.$router.push('/login');
    }
  }
}
</script>
