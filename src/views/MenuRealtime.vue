<template>
  <v-app>

    <SideBar />
    <v-container class="pa-4 text-center">
      <v-row class="fill-height" align="center" justify="center">
        <template v-for="(item, i) in items">

          <v-col link :key="i" cols="12" md="4">
            <link rel="stylesheet" href="/DashboardPrincipal">
            <router-link :to=item.url class="router">
              <v-hover v-slot="{ hover }">
                <v-card :elevation="hover ? 12 : 2" :class="{ 'on-hover': hover }">

                  <v-img :src="item.img" :href="'/DashboardPrincipal'" height="225px">
                    <v-card-title class="text-h6 white--text">
                      <v-row class="fill-height flex-column" justify="space-between">
                        <p class="mt-4 subheading text-left">
                          {{ item.title }}
                        </p>

                        <div>
                          <p class="ma-0 text-body-1 font-weight-bold font-italic text-left">
                            {{ item.text }}
                          </p>
                          <p class="text-caption font-weight-medium font-italic text-left">
                            {{ item.subtext }}
                          </p>
                        </div>


                      </v-row>
                    </v-card-title>
                  </v-img>

                </v-card>
              </v-hover>
            </router-link>
          </v-col>
        </template>
      </v-row>
    </v-container>
  </v-app>
</template>

<script>


import SideBar from "../components/SideBar";
export default {
  name: "HelloView",
  data: () => ({
    items: [
      {
        title: 'Real Time Agentes',
        text: 'Monitoramento dos operadores em tempo real',
        img: 'https://images.pexels.com/photos/7658355/pexels-photo-7658355.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        url: '/realoperador'

      },
      {
        title: 'Real Time Solicitantes',
        text: `Monitoramento das chamadas de entrada em tempo real`,
        img: 'https://images.pexels.com/photos/8121691/pexels-photo-8121691.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        url: '/realentrada'
      },

      {
        title: 'Real Time CallCenter',
        text: 'Monitoramento das filas em tempo real',
        img: 'https://images.pexels.com/photos/5453824/pexels-photo-5453824.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        url: '/campanhafila'
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

.router {
  text-decoration: none;
}

.v-card:not(.on-hover) {
  opacity: 0.6;
}

.mt-4 {
  background-color: rgba(0, 0, 0, 0.356);
  color: rgb(255, 255, 255) !important
}

.ma-0 {
  background-color: rgba(0, 0, 0, 0.356);

}
</style>