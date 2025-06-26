<template>
  <v-card height="" flat color="transparent" class="mt-n5">
                <v-toolbar color="rgba(0,0,0,0)" flat class="py-4">
                 
                </v-toolbar>

<div class = "pizza">
	<GChart
    type="PieChart"
    :data="chartData"
    :options="chartOptions"
  
  
  />
</div>
              </v-card>
</template>

<script>
import { GChart } from 'vue-google-charts/legacy';
export default {
    name: "HelloView",
  components: {
    GChart
  },
data () {
    return {
      // Array will be automatically processed with visualization.arrayToDataTable function
chartData: [
          ['Task', 'Hours per Day'],
          ['Em fila',     11],
          ['Perdidas',      2],
          ['Abandonadas',  2],
          ['Atendidas', 2],

        ],

      chartOptions: {
           title: 'Classificação de chamadas',
           'width':600,
          'height':350,
          
      },

    }
  },
}
</script>

<style scoped>
#PieChart{
  width: 14%;
  height: 20%;
}
</style>