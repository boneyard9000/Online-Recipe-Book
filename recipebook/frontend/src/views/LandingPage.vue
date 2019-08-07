<template>
    <div id="LandingPage">
            <h1>Discover New Recipes</h1>
            <div>
                <p>This information describes what our website will do.</p>
            </div>
    </div>
    
</template>

<script>
export default {

    name: 'landingPage',
    components: {
        
    },
    methods: {

    }

}
</script>

<style scoped>

#LandingPage {
    background-image:url(../assets/cookingImageForLandingPage.jpg);
    background-size: cover;
    background-position:center;
    height: 700px;
}

#LandingPage h1 {
    padding:0;
    margin:0;
}

h1 {
    font-size: 60px;
}




</style>
