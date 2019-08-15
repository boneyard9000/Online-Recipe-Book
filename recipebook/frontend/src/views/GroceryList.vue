

<template>
<div id="entire-page" style="background-color:transparent; text-align: center;">
    <div style="width: 80%; height: 800px; display: inline-block; background-color: rgba(50, 58, 66, 0.8);">
        <h2 style="text-align: center; color: white;">WELCOME TO YOUR GROCERY LIST</h2>
    <h2 style="text-align: center; color: white;">----------------------------------------------------------</h2>
    <div id="todo-list">
        <div id="child" style="transparent: none; border-radius: 50px;">
            <h1 style="background-color: gray; color: white;">My Groceries</h1> 
            <b-button pill variant="success" type="submit" v-on:click="updateGroceryList" style="margin: auto; margin-top:10px;">SAVE GROCERY LIST</b-button>
            <br>
            
            <b-button pill variant="danger" v-on:click="clearGroceryList" style="margin: auto; margin-top:10px; margin-bottom: 10px;">Empty Grocery List</b-button>
            
            <form v-on:submit.prevent="addGrocery">
                <input v-model="currentGrocery" type="text" style="margin-top: 10px;" maxlength="35">
                <b-button type="submit" style="float:right;">Add Grocery</b-button>
            </form>
            
            <br>
            <br>
            
            <ul id="my-list" style="background-color: white; border-radius: 50px;">

                <li v-for="(thing, index) in groceriesArray.sort()" :key="index" class="all-li" style="width: 450px; text-align: left; border-radius: 20px;">
                    {{thing}}
                    <b-button v-on:click="deleteGrocery(index)" variant="danger" style="float: right;"><i class="fa fa-trash-o"></i></b-button>
                </li>
                
            </ul>
            <b-button v-on:click="goBack">Return to Recipe Details</b-button>
            
        </div>
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
            currentGrocery: '',
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
        if (this.groceries.substring(0,1)===",") {
            this.groceries = this.groceries.substring(2);
        }
        this.groceriesArray = this.groceries.split(", ");
        if (this.groceriesArray[0] === "") {
            this.groceriesArray = [];
        }
        });

        
    },

    methods: {
        deleteGrocery: function(index) {
            this.groceriesArray.splice(index, 1);
        },
        addGrocery: function() {
            this.currentGrocery = this.currentGrocery.trim();
            if (this.currentGrocery.length > 0) {
                this.groceriesArray.push(this.currentGrocery);
                this.currentGrocery = '';
            }
        },
        goBack: function(){
             window.history.back();
        },
        clearGroceryList: function() {
            this.groceriesArray = [];
        },
        updateGroceryList() {
            this.groceries = '';
            for (let i = 0; i < this.groceriesArray.length; i++) {
                if (this.groceriesArray === ", ") {
                    continue;
                } else {
                    this.groceries += this.groceriesArray[i] + ", ";
                }
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