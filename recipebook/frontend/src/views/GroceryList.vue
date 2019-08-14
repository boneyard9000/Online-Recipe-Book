<template>
<div id="entire-page">
    <h1 style="text-align: center;">WELCOME TO YOUR GROCERY LIST</h1>
    <div style="text-align:center;">PUSH IT DOWN!!!!!</div>
    <div id="todo-list">
        <div id="child" >
            <h1>My Groceries</h1> <button v-on:click="updateGroceryList">SAVE GROCERY LIST</button>
            <ul id="my-list">
                <li v-for="(thing, index) in groceriesArray" class="all-li">
                    {{thing}}
                    <button class="da-btn" v-on:click="deleteGrocery(index)" >REMOVE</button>
                </li>
                
            </ul>
            
        </div>
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
            todos: [
               { task: 'Wake up' },
               { task: '5 Minute Morning Movement' },
               { task: 'Meditate' },
               { task: 'Brush Teeth' },
               { task: 'Shower' },
           ],
           currentGroceryList: {
               allGroceries: ''
           }
            

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
        deleteGrocery: function(index) {
            this.groceriesArray.splice(index, 1);
        },
        updateGroceryList() {
            this.groceries = '';
            for (let i = 0; i < this.groceriesArray.length; i++) {
                this.groceries += this.groceriesArray[i] + ", "
            }
            this.groceries = this.groceries.substring(0, this.groceries.length - 2);
            this.currentGroceryList.allGroceries = this.groceries
          fetch(`${process.env.VUE_APP_REMOTE_API}/api/groceries`, {
              method: 'PUT',
        headers: {
          Accept: 'application/json',
          'Content-Type': 'application/json', 
          Authorization: 'Bearer ' + auth.getToken()
        },
        body: JSON.stringify(this.currentGroceryList)
        }).then(() => {
             location.reload();
        }
        )

      }
    },

    computed: {
      
    }

}
</script>

<style scoped>

html, body {
    margin:0;
    padding:0;
    height:200%; 
 } 

#todo-list {
    width:450px;
    background: #fff;
    font-family: 'Roboto Condensed', sans-serif;
    border-radius: 10px;
    text-align: center;
    margin: auto;
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
#my-list {
    list-style-type: none;
    margin:0px;
    padding:0px;
    
}
.all-li {
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