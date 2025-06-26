<template>
<div id= "main-fundo">
  <v-app>
    <v-content>
      <v-container class = "fill-height-a" fluid>
       <v-container fluid>
    <v-sparkline
      :fill="fill"
      :gradient="selectedGradient"
      :line-width="width"
      :padding="padding"
      :smooth="radius || false"
      :value="value"
      auto-draw
    ></v-sparkline>

    <v-divider></v-divider>

    <v-row>
      <v-col
        cols="12"
        md="6"
      >
        <v-row
          class="fill-height"
          align="center"
        >
          <v-item-group
            v-model="selectedGradient"
            mandatory
          >
            <v-row>
              <v-item
                v-for="(gradient, i) in gradients"
                :key="i"
                v-slot="{ active, toggle }"
                :value="gradient"
              >
                <v-card
                  :style="{
                    background: gradient.length > 1
                      ? `linear-gradient(0deg, ${gradient})`
                      : gradient[0],
                    border: '2px solid',
                    borderColor: active ? '#222' : 'white'
                  }"
                  width="30"
                  height="30"
                  class="mr-2"
                  @click.native="toggle"
                ></v-card>
              </v-item>
            </v-row>
          </v-item-group>
        </v-row>
      </v-col>

      <v-col
        cols="12"
        md="6"
      >
      </v-col>

      
    </v-row>
  </v-container>

      </v-container>
    </v-content>
  </v-app>
</div>


</template>

<script>
  const gradients = [
    ['#42b3f4'],
   
  ]

  export default {
    name: "HelloView",
    data: () => ({
      fill: true,
      selectedGradient: gradients[4],
      gradients,
      padding: 8,
      radius: 10,
      value: [0, 2, 5, 9, 5, 10, 3, 5, 0, 0, 1, 8, 2, 9, 0],
      width: 2,
    }),
  }
</script>

<style scoped>

h1{

  color: #243e57;
}
 
#fill-height{

  background-color: #243e57;
}



.text-center{

color: #243e57;
}


/*.cardanna{

  /*background-image: url(../assets/modelo.jpg);
 background-repeat: no-repeat;
  background-size:10%;
  


}*/


.show-enter-active,
.show-leave-enter {
    transform: translateX(0);
    transition: all .3s linear;
}
.show-enter,
.show-leave-to {
    transform: translateX(100%);
}

.fill-height-a{

background-repeat: no-repeat;
  background-size:100%;

  box-shadow: inset 0 0 0 1000px rgba(4, 81, 132, 0.85);
background-image: url(../assets/telamenu.jpg);
padding: 15px;
background-repeat: no-repeat;
background-size: cover;
background-position: center;


}

 .text-center:hover, .col-md-4:hover{

background-color: #61a5e8;
color:antiquewhite;

}





</style>

<script>


export default{

data: () => ({

step: 1



}),


props: {

source: String 

}

}
  

 

</script>
