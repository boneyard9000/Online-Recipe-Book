

<template>
<div id="entire-page" style="background-color:transparent; text-align: center;">
    <div style="width: 80%; height: 800px; display: inline-block; background-color: rgba(50, 58, 66, 0.8);">
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

                <div class="item-line">
                


                <li v-for="(thing, index) in newGroceriesArray.sort()" :key="index" class="all-li" style="width: 450px; text-align: left; border-radius: 20px;">
                    {{thing}}
                    <b-button v-on:click="deleteGrocery(index)" variant="danger" style="float: right;"><i class="fa fa-trash-o"></i></b-button>

                </li>
                </div>
                
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
            groceriesArray: [],
            currentGrocery: '',
            newGroceriesArray: [],
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
        this.getNewArray();


        });

        

        
    },

    methods: {
        getNewArray() {
            console.log(map);
            let map = new Map();
            for (let i = 0; i < this.groceriesArray.length; i++) {

                let myString = this.groceriesArray[i];
                let num = myString.substring(0, myString.indexOf(' '));
                let item = myString.substring(myString.indexOf(' ') + 1);

                if (map.has(item)) {
                    num = (+num) + (+map.get(item));
                    console.log("A map exists");
                }

                map.set(item, num);
            }

            for (let [k, v] of map) {
                console.log(k, v);
                this.newGroceriesArray.push(v + " " + k);
            }
            for (let g = 0; g < this.newGroceriesArray.length; g++) {
                this.newGroceriesArray[g].trim();
            }
        },
        deleteGrocery: function(index) {
            this.newGroceriesArray.splice(index, 1);
        },
        addGrocery: function() {
            this.currentGrocery = this.currentGrocery.trim();
            if (this.currentGrocery.length > 0) {
                this.newGroceriesArray.push(this.currentGrocery);
                this.currentGrocery = '';
            }
        },
        goBack: function(){
             window.history.back();
        },
        clearGroceryList: function() {
            this.newGroceriesArray = [];
        },
        updateGroceryList() {
            this.groceries = '';
            for (let i = 0; i < this.newGroceriesArray.length; i++) {
                if (this.newGroceriesArray === ", ") {
                    continue;
                } else {
                    this.groceries += this.newGroceriesArray[i] + ", ";
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
    height:180%; 
    
 } 

#todo-list {
    width: 450px;
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

/* .item-line {
    display: inline-block;
} */
.all-li {
    font-size: 24px;
    border-bottom:1px solid #f2f2f2;
    padding:10px 20px;
    width: 90%;
}

.all-li p {
    float: left;
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

.trash {
    float: right;
    font-size: 1vw;
    border: none;
}
input[type="checkbox"] {
    font-size:40px;
    vertical-align: middle;
    margin-top:0px;
}

#child {
    height: 80%;
    margin-bottom: 30px;
    width: 100%;
}

#my-list{height:400px; width:100%;}
#my-list{overflow:hidden; overflow-y:scroll;}




</style>