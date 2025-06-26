<template>
  <v-footer
    color="primary lighten-1"
    padless
    
  >
    <v-row
      justify="center"
      no-gutters
      
    >
      
      <v-col
        class="nav py-4 text-center white--text"
        cols="12"
                
      >
      
        {{ new Date().getFullYear() }} — <strong>PlugPhone®</strong>
      </v-col>
    </v-row>
  </v-footer>
</template>
<style scoped>
.nav{
    background-color: #28556f !important;
}
.py-4 text-center{
      background-color: #28556f !important;

}
</style>
<script>
export default {
  name: "NavbarVue",
}
</script>