<template>

<body>

  <section class="intro">

    <div class="inner">

      <div class="content">

        <h1>CHEF'S CORNER</h1>
        <h4 style="color: white; ">SEARCH</h4>
        <h4 style="color: white; ">CREATE</h4>
        <h4 style="color: white; ">SAVE</h4>
        <br>
        <a class="mybtn" href="#">Get Started</a>

      </div>

    </div>

  </section>
  <p>
    This is a demo paragrpah that will do things but not too much, actually it will be a run on sentence that helps with my typing speed and making me look like I know what I am doing
  </p>
  <p>
    This is a demo paragrpah that will do things but not too much, actually it will be a run on sentence that helps with my typing speed and making me look like I know what I am doing
  </p>
  <p>
    This is a demo paragrpah that will do things but not too much, actually it will be a run on sentence that helps with my typing speed and making me look like I know what I am doing
  </p>

</body>


    
    
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

@import url('https://fonts.googleapis.com/css?family=Raleway');
@import url('https://fonts.googleapis.com/css?family=Oswald');

html, body {
  margin: 0;
  padding: 0;
  height: 100%;
  width: 100%;
  font-size: 12px;
}

.intro {
  height: 100%;
  width: 100%;
  margin: auto;
  background: linear-gradient(to bottom, rgba(245, 246, 252, 0.52), rgba(117, 19, 93, 0.73)), url(https://image.shutterstock.com/image-photo/set-old-kitchen-items-closeup-260nw-343666985.jpg) no-repeat 50% 50%;
  display: table;
  top: 0;
  background-size: cover;
}

.intro .inner {
  display: table-cell;
  vertical-align: middle;
  height: 500px;
  width: 100%;
  max-width: none;
}

.content {
  max-width: 500px;
  margin: 0 auto;
  text-align: center;
}

.content h1 {
  font-family: 'Raleway', sans-serif;
  color: #F9F3F4;
  text-shadow: 0px 0px 300px #000;
  font-size: 500%;
}

.mybtn {
  border-radius: 9px;
  border: solid black 3px;
  font-family: 'Oswald', sans-serif;
  color: black;
  font-size: 135%;
  padding: 10px 20px;
  text-transform: uppercase;
  text-decoration: none;
 
}

.mybtn:hover {
  color: white;
  border: solid white 3px;
}

p {
  font-size: 150%;
  line-height: 200%;
  text-align: justify;
  margin: 3%;
  font-family: sans-serif;
}
@media screen and (max-width: 768px) {
  .content h1 {
    font-size: 250%;
  }
  .mybtn {
    font-size: 110%;
    padding: 7px 15px;
  }
  p {
    font-size: 100%;
    line-height: 160%
  }
}





</style>

