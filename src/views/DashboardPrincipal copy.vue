<template>
  <v-app id="inspire" class="papel">
    <navbar />

    <SideBar />

    <v-divider color="white" class="mt-1" dark></v-divider>
    <v-container>
      <v-row>
        <v-col cols="12" sm="12">
          <v-toolbar flat color="rgba(0,0,0,0)" class="mt-n5">
            <v-spacer></v-spacer>
          </v-toolbar>

          <v-row class="px-5 mt-n6 ml-5">
            <v-col cols="12" v-for="(list, index) in lists" :key="index">
              <v-card
                align="center"
                class="rounded-circle border pt-10"
                width="200"
                height="200"
                flat
              >
                <v-icon size="60">
                  {{ list.icon }}
                </v-icon>

                <v-card-text class="grey--text text-lg-h6">
                  {{ list.title }}
                </v-card-text>

                <v-btn
                  absolute
                  color="#243e57"
                  class="white--text"
                  fab
                  left
                  top
                >
                  <h2>{{ list.count }}</h2>
                </v-btn>
              </v-card>
            </v-col>
          </v-row>
          <div style="display: flex; margin-left: -82px; margin-top: -58px">
            <v-col cols="12" sm="7">
              <History />
            </v-col>
            <br />
            <br />
            <v-col cols="12" sm="5">
              <v-card height="" flat color="transparent" class="mt-n5">
                <v-toolbar color="rgba(0,0,0,0)" flat class="py-4"> </v-toolbar>

                <div class="pizza">
                  <GChart
                    type="PieChart"
                    :data="chartData"
                    :options="chartOptions"
                  />
                </div>
              </v-card>
            </v-col>
          </div>
        </v-col>
      </v-row>
    </v-container>
  </v-app>
</template>

<script>
import History from "../components/History";
import { GChart } from 'vue-google-charts/legacy';

import Navbar from "../components/Navbar.vue";
import SideBar from "../components/SideBar.vue";
import { api } from "@/conf/api";

export default {
  name: "DashboardPrincipal",
  async beforeMount() {
    let a = await api.get(`/dashpizza/${this.PastDateTime()}/${this.currentDateTime()}`);
    console.log(a.data.dados);
    if (!a.data.dados) {
      return alert("não veio nada");
    }
    if (a.data.dados.length == 0) {
      return alert("Não existe ligação");
    }
    let join = a.data.dados.length;

    let b = await api.get(`/filaabandono/${this.PastDateTime()}/${this.currentDateTime()}`);
    console.log(`${this.PastDateTime()}/${this.currentDateTime()}`)
    if (!b.data.dados) {
      return alert("não veio nada2");
    }
    if (b.data.dados.length == 0) {
      return alert("Não existe ligação2");
    }
    let abandon = b.data.dados.length;
    console.log(abandon, join); 

    let atendida = join - abandon;
    console.log(atendida);

    this.chartData.push(["Ligações", "Quantidade"]);
    this.chartData.push(["Atendidas", atendida]);
    this.chartData.push(["Abandonadas", abandon]);
  },
  data: () => ({
    lists: [
      {
        id: 1,
        icon: "fa fa-user-plus",
        title: "Operadores Logados",
        count: 21,
      },
      {
        id: 2,
        icon: "fa fa-user-times",
        color: "red",
        title: "Operadores Deslogados",
        count: 41,
      },
      {
        id: 3,
        icon: "fa fa-pause-circle",
        title: "Operadores em pausa",
        count: 35,
      },
      {
        id: 4,
        icon: "fa fa-phone-square",
        title: "Em ligação",
        count: null, value: "atendida",
      },
    ],
    dados: [],
    chartData: [],
    chartOptions: {
           title: 'Classificação de chamadas',
           'width':600,
          'height':350,
          
      },
  }),

  components: {
    SideBar,
    History,
    GChart,
    //Table
    Navbar,
  },

   methods: {
    currentDateTime() {
      const current = new Date();
      const date = current.getFullYear()+'-'+(current.getMonth()+1)+'-'+current.getDate();
      const time = "23:59:59";
      const dateTime = date +' '+ time;

      return dateTime;
    },
    PastDateTime() {
      const current = new Date();
      const date = current.getFullYear()+'-'+(current.getMonth()+1)+'-'+current.getDate();
      const time = "00:00:00";
      const dateTimeB = date +' '+ time;

      return dateTimeB;
    }
  }
};
</script>
<style scoped>
.fa-user-plus {
  color: green;
}
.fa-user-times {
  color: red;
}
.fa-pause-circle {
  color: orange;
}
.fa-phone-square {
  color: steelblue;
}

.border {
  border: 2px solid #243e57 !important;
}
.v-btn--fab.v-size--default.v-btn--absolute.v-btn--top {
  top: 65px !important;
}
.v-btn--absolute.v-btn--left,
.v-btn--fixed.v-btn--left {
  left: -26px !important;
}
</style>