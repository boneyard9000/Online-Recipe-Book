<template>
<div id="grocery-list">
    
    {{currentUser.firstName}}
    {{ currentUser.lastName}}
    {{currentUser.groceryList}}
</div>
  
</template>

<script>
import auth from '../auth';

export default {

    data() {
        return {
            currentUser: auth.getUser(),
            

        }
    },

    created() {
        fetch(`${process.env.VUE_APP_REMOTE_API}/api/user`, {
        headers: {
          Accept: 'application/json',
          'Content-Type': 'application/json', 
          Authorization: 'Bearer ' + auth.getToken()
        }
        })
        .then((response) => {
        return response.json();
        })
        .then((test) => {
        this.currentUser = test;
        });
    }

}
</script>

<style scoped>

#grocery-list {

}

</style>