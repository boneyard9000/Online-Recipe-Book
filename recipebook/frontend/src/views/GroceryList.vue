<template>
    <div class="todo-list">
        <div id="please-move">
        <h1>My Grocery List</h1> 
        <ul>
            <li v-for="grocery in groceriesArray" :key="grocery">

                <div v-if="grocery != 'Sample Ingredient' ">
                <input type="checkbox"/>
                {{grocery}} 
                </div>
                
            </li>
        </ul>
        </div>
    </div>
  
</template>

<script>
import auth from '../auth';

export default {

    data() {
        return {
            currentUser: auth.getUser(),
            groceries: '',
            groceriesArray: {},
            

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
        this.groceries = test.groceryList;
        this.groceriesArray = test.groceryList.split(", ");
        });
    },

    methods: {
        changeStatus(id) {
            const arrIndex = this.todos.findIndex((todo) => todo.id == id);
            this.todos[arrIndex].completed = !this.todos[arrIndex].completed;
        }
    },

    computed: {
      
    }

}
</script>

<style scoped>

.todo-list {
    width:450px;
    background: #fff;
    margin: 50px auto;
    font-family: 'Roboto Condensed', sans-serif;
    border-radius: 10px;
    padding-top: 10px;
}

#please-move {
    top: 200px;
}

h1 {
    background:#f2f2f2;
    color:#4b86A6;
    padding:10px;
    font-size:24px;
    text-transform: uppercase;
    text-align: center;
    margin-bottom: 0px;
    border-top-left-radius: 10px;
    border-top-right-radius: 10px;
}
ul {
    list-style-type: none;
    margin:0px;
    padding:0px;
}
li {
    font-size: 24px;
    border-bottom:1px solid #f2f2f2;
    padding:10px 20px;
}
li:nth-child(odd) {
    /* background-color: rgb(129, 182, 129); */
}
li:last-child{
    border:0px;
}
li.todo-completed {
    text-decoration: line-through;
    color: darkgray;
}
i.far.fa-check-circle { 
    float:right;
    color: darkgray;
}

i.far.fa-check-circle.completed {
    color:green;
}
input[type="checkbox"] {
    font-size:40px;
    vertical-align: middle;
    margin-top:0px;
}



</style>