<template>
<v-app>
    
    <SideBar />
  <v-container class="pa-4 text-center">
    <v-row
      class="fill-height"
      align="center"
      justify="center"
    >
      <template v-for="(item, i) in items">
        <v-col
          :key="i"
          cols="12"
          md="4"
        >
          <v-hover v-slot="{ hover }">
            <router-link :to= item.url class="router">
            <v-card
              :elevation="hover ? 12 : 2"
              :class="{ 'on-hover': hover }"
            >
              <v-img
                :src="item.img"
                height="225px"
                class="imagem"
              >
                <v-card-title class="text-h6 white--text">
                  <v-row
                    class="fill-height flex-column"
                    justify="space-between"
                  >
                    <p class="mt-4 subheading text-left">
                    <b>  {{ item.title }}</b>
                    </p>

                    <div>
                      <p class="ma-0 text-body-1 font-weight-bold font-italic text-left">
                      <b>  {{ item.text }}</b>
                      </p>
                      <p class="text-caption font-weight-medium font-italic text-left">
                      <b>  {{ item.subtext }}</b>
                      </p>
                    </div>

                   
                  </v-row>
                </v-card-title>
              </v-img>
            </v-card>
            </router-link>
          </v-hover>
        </v-col>
      </template>
    </v-row>
  </v-container>
</v-app>
</template>

<script>
import SideBar from "../components/SideBar";
  export default {
    name: "HomeView",
    data: () => ({
      items: [
        {
          title: 'TMA',
          text: 'Tempo de Atendimento',
          img: 'https://images.pexels.com/photos/5877662/pexels-photo-5877662.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          url: '/poragente'
        },
        {
          title: 'TME',
          text: `Tempo de Espera`,
          img: 'https://images.pexels.com/photos/5899079/pexels-photo-5899079.jpeg?cs=srgb&dl=pexels-karolina-grabowska-5899079.jpg&fm=jpg',
          url: '/porespera'
        },
        {
          title: 'Pausa',
          text: 'Pausa dos Agentes',
          img: 'https://images.pexels.com/photos/1422292/pexels-photo-1422292.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          url: '/hold'
        },
        {
          title: 'Service(%)',
          text: 'Serviço do agente',
          img: 'https://images.pexels.com/photos/5467594/pexels-photo-5467594.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          url: '/porservico'
        },
        {
          title: 'Conexão do agente',
          text: `Conexão do agente`,
          img: 'https://images.pexels.com/photos/8866777/pexels-photo-8866777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          url: '/inforagentes'
        },
        {
          title: 'Detalhes de Ligações',
          text: 'Detalhes das chamadas do callcenter',
          img: 'https://images.pexels.com/photos/95916/pexels-photo-95916.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          url: '/detalhe'
        },
       {
          title: 'Filas de Atendimento',
          text: 'Filas utilizadas no callcenter',
          img: 'https://images.pexels.com/photos/3184418/pexels-photo-3184418.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          url: '/recebidas'
        },
        {
          title: 'Troncos usados por hora',
          text: `Troncos usados pelo CallCenter`,
          img: 'https://images.pexels.com/photos/714701/pexels-photo-714701.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          url: '/troncos'
        },
        {
          title: 'Fluxo de Chamadas por Hora',
          text: 'Chamadas em cada hora',
          img: 'https://images.pexels.com/photos/5624978/pexels-photo-5624978.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          url: '/porhora'
        },
  

      ],
      transparent: 'rgba(255, 255, 255, 0)',
    }),
  components: {
    SideBar,
    //Table
  },
  }
</script>
<style scoped>
.v-card {
  
  transition: opacity .4s ease-in-out;
}
.imagem{
  box-shadow: inset 0 0 0 1000px rgba(0, 0, 0, 0.356) !important;
}
.mt-4{
  background-color: rgba(0, 0, 0, 0.356);
  color: rgb(255, 255, 255) !important

}
.ma-0{
  background-color: rgba(0, 0, 0, 0.356);
  color: rgb(255, 255, 255) !important
}
.router{
  text-decoration: none;
}

.v-card:not(.on-hover) {
  opacity: 0.6;
 }

</style>