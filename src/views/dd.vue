<template>
  <v-container fluid>
    <v-row class="d-flex ">
      <v-col cols="12">
        <v-card outlined>
          <v-row class="px-2">
            <v-col cols="12" sm="3">
              <v-menu
                v-model="menu1"
                :close-on-content-click="false"
                transition="scale-transition"
                offset-y
                max-width="290px"
                min-width="auto"
              >
                <template v-slot:activator="{ on, attrs }">
                  <v-text-field
                    v-model="data1Formatada"
                    label="Data Inicial"
                    persistent-hint
                    prepend-icon="mdi-calendar"
                    readonly
                    v-bind="attrs"
                    v-on="on"
                  ></v-text-field>
                </template>
                <v-date-picker
                  v-model="data1"
                  no-title
                  @input="menu1 = false"
                ></v-date-picker>
              </v-menu>
            </v-col>
            <v-col cols="12" sm="3">
              <v-menu
                v-model="menu2"
                :close-on-content-click="false"
                transition="scale-transition"
                offset-y
                max-width="290px"
                min-width="auto"
              >
                <template v-slot:activator="{ on, attrs }">
                  <v-text-field
                    v-model="data2Formatada"
                    label="Data Final"
                    persistent-hint
                    prepend-icon="mdi-calendar"
                    readonly
                    v-bind="attrs"
                    v-on="on"
                  ></v-text-field>
                </template>
                <v-date-picker
                  v-model="data2"
                  no-title
                  @input="menu2 = false"
                ></v-date-picker>
              </v-menu>
            </v-col>
            <v-col cols="12" sm="3">
              <v-row class="pa-8">
                <v-btn color="blue" class="white--text" @click="executar"
                  >EXECUTAR</v-btn
                >
              </v-row>
            </v-col>
          </v-row>
        </v-card>
      </v-col>
    </v-row>
    <v-row v-if="mostraGrafico">
      <v-col align="center" justify="center" cols="12">
        <h3>Média / Total de Avaliações</h3>

      </v-col>
      <v-col>
        <v-card outlined class="d-flex ">
          <v-row class="pa-6">
            <v-col cols="12" sm="4">
              <v-card color="#385F73" dark max-width="290">
                <v-card-title class="text-h3 ">{{$store.state.mediaP1.media}} / {{$store.state.mediaP1.qtd}}</v-card-title>
                <v-card-subtitle>MARLUVAS</v-card-subtitle>
                <v-row
        align="center"
        class="ma-4"
      >
        <v-rating
          :value="$store.state.mediaP1.media"
          color="amber"
          dense
          half-increments
          readonly
          size="14"
        ></v-rating>

        
      </v-row>

                <v-card-actions>
                  <v-btn outlined text to="/p1">Mais</v-btn>
                </v-card-actions>
              </v-card>
            </v-col>
            <v-col cols="12" sm="4">
              <v-card color="blue" dark max-width="290">
                <v-card-title class="text-h3">{{$store.state.mediaP2.media}} / {{$store.state.mediaP2.qtd}}</v-card-title>

                <v-card-subtitle>AGENTE</v-card-subtitle>
                <v-row
        align="center"
        class="ma-4"
      >
        <v-rating
          :value="$store.state.mediaP2.media"
          color="amber"
          dense
          half-increments
          readonly
          size="14"
        ></v-rating>

       
      </v-row>

                <v-card-actions>
                  <v-btn outlined text to="/p2">Mais</v-btn>
                </v-card-actions>
              </v-card>
            </v-col>
            <v-col cols="12" sm="4">
              <v-card color="green" dark max-width="290">
                <v-card-title class="text-h3">{{$store.state.mediaP3.media}} / {{$store.state.mediaP3.qtd}}</v-card-title>

                <v-card-subtitle>PRAZO</v-card-subtitle>
                <v-row
        align="center"
        class="ma-4"
      >
        <v-rating
          :value="$store.state.mediaP3.media"
          color="amber"
          dense
          half-increments
          readonly
          size="14"
        ></v-rating>

       
      </v-row>

                <v-card-actions>
                  <v-btn outlined text to="/p3">Mais</v-btn>
                </v-card-actions>
              </v-card>
            </v-col>
          </v-row>
        </v-card>
      </v-col>
    </v-row>
    <v-row v-if="mostraGrafico">
      <v-col cols="12">
        <GChart type="ColumnChart" :data="a4.data" :options="a4.opt" />
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import { GChart } from "vue-google-charts";
import { api } from "@/conf/api";
export default {
  name: "Dashboard",
  components: {
    GChart,
  },
  async beforeMount() {
    this.data1 = this.$store.state.d1;
    this.data2 = this.$store.state.d2;
    if(this.$store.state.temPeriodo){
      this.executar();
    }
   // await this.$store.dispatch("insereD1", new Date().toISOString().substr(0, 10));
    //await this.$store.dispatch("insereD2", new Date().toISOString().substr(0, 10));
  },
  data() {
    return {
      data1: null,
      menu1: false,
      data2: null,
      menu2: false,
      mostraGrafico: false,
      a4: {},
    };
  },
  
  methods: {
    dataF: function(d2) {
      let d = d2.substr(0, 10);
      return d.substr(8, 2) + "/" + d.substr(5, 2) + "/" + d.substr(0, 4);
    },
    executar: async function() {
      this.mostraGrafico = false;
      try{
        let dataini = new Date(this.data1);
        let datafim = new Date(this.data2);
        if(dataini > datafim){
          alert('Data inicial maior que a final');
          return;
        }
                 
        let res1 = await api.get(`/pesq/${this.data1}/${this.data2} `);
        //console.log(res1.data);
        if(res1.data.dados && res1.data.dados.length>0){
          this.$store.dispatch("inserePeriodo", res1.data.dados);
        }else{
          alert('Período sem Registros');
          return;

        }
        //console.log(this.$store.state.temPeriodo);
        await this.$store.dispatch("marcaPeriodo");
        //console.log(this.$store.state.temPeriodo);

        let d11 = this.data1.substr(8, 2) + "-" + this.data1.substr(5, 2) + "-" + this.data1.substr(0, 4);
        let d22 = this.data2.substr(8, 2) + "-" + this.data2.substr(5, 2) + "-" + this.data2.substr(0, 4);
        
        await this.$store.dispatch("insereArq", `_${d11}_${d22}.csv`);
        await this.$store.dispatch("insereD1", this.data1);
        await this.$store.dispatch("insereD2", this.data2);
        
        let periodo = this.$store.state.periodo;
        let datas = [];
        periodo.forEach((a) => {
           datas.push(a.datahorafim.substr(0, 10));
         });
        let datasUnicas = datas.filter(function (a) {
         //console.log("aaa", this[JSON.stringify(a)]);
           return !this[JSON.stringify(a)] && (this[JSON.stringify(a)] = true);
         }, Object.create(null));

         await this.$store.dispatch("insereDatasUnicas", datasUnicas);

        //console.log(this.$store.state.datasUnicas)

        let p1 = periodo.filter(a => a.p1=='p1');
        let p2 = periodo.filter(a => a.p1=='p2');
        let p3 = periodo.filter(a => a.p1=='p3');
        
        await this.$store.dispatch("insereP1", p1);
        await this.$store.dispatch("insereP2", p2);
        await this.$store.dispatch("insereP3", p3);

        let agentes=[];
        p2.forEach((a) => {
          if (a.agentenome!=="") {
             agentes.push(a.agentenome);
          }
        });

        let agentesUnicos = agentes.filter(function (a) {
         //console.log("aaa", this[JSON.stringify(a)]);
           return !this[JSON.stringify(a)] && (this[JSON.stringify(a)] = true);
         }, Object.create(null));

        await this.$store.dispatch("insereAgentes", agentesUnicos);
        //media p1
        let mediaP1;
        let mediaP2;
        let mediaP3;
        let notas = 0;
        p1.forEach(a => {
          notas += Number(a.p2)
        });
        //console.log(notas, p1.length, Math.floor(notas/p1.length));
        let media = Math.round(notas/p1.length)
        mediaP1 = {p: "p1",total: notas, qtd: p1.length,media};
        // media p2
        notas = 0;
        p2.forEach(a => {
          notas += Number(a.p2)
        });
        //console.log(notas, p2.length, Math.floor(notas/p2.length));
        media = Math.round(notas/p2.length)
        mediaP2 = {p: "p2",total: notas, qtd: p2.length,media}
        // media p3
        notas = 0;
        p3.forEach(a => {
          notas += Number(a.p2)
        });
        //console.log(notas, p2.length, Math.floor(notas/p2.length));
        media = Math.round(notas/p3.length)
        mediaP3 = {p: "p3",total: notas, qtd: p3.length,media}
        //console.log(mediaP1,mediaP2,mediaP3)
        await this.$store.dispatch("insereMediaP1", mediaP1);
        await this.$store.dispatch("insereMediaP2", mediaP2);
        await this.$store.dispatch("insereMediaP3", mediaP3);

        let agentesMedia = []
        agentesMedia.push( ["Agentes", "Média", "Total Avaliações"])

        agentesUnicos.forEach(a => {
          let notas2 = 0;
          let qtd2 = 0;
          p2.forEach( p => {
            if(a == p.agentenome){
              notas2 += Number(p.p2);
              qtd2++;

            }

          });

          let media2 = Math.round(notas2/qtd2);
          let linha = [a,media2,qtd2];
          agentesMedia.push(linha)
          
        });

        this.a4.data = agentesMedia;
        this.a4.opt = {
        title: "Comparativo entre Agentes",
        legend: { position: "top" },

        bars: "horizontal",
      };


         
        
        this.mostraGrafico = true;
      }catch(e){
        alert('erro: '+ e.message)
      }
    },
  },
  computed: {
    data1Formatada() {
      return this.dataF(this.data1);
    },
    data2Formatada() {
      return this.dataF(this.data2);
    },
  },
};
</script>

<style scoped></style>
