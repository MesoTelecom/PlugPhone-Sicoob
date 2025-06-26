<template>
<v-app>
    <Navbar/>
    <v-main>
        <router-link>

        </router-link>
    </v-main>

</v-app> 
</template>


<script>
import Navbar from './components/Navbar';
export default {
  name: 'principal2',
  components:{
      Navbar,
  },

  data: () => ({
    //
  }),
};
</script>
