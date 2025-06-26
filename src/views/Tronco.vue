<template>
  <div class="limiter">
    <Navbar />
    <v-card class="filtrorelatorios">
      <!--Entrada do Período da API-->
      <input type="date" class="datest" v-model="d1" required />

      <!--Saída do Período da API-->
      <input type="date" class="datest" v-model="d2" required />
      <v-select
        :items="items"
        label="Tronco de atendimento"
        v-model="tronco"
        class="filtro"
      ></v-select>
      <v-btn class="botaoA" @click="exibir()"> Consultar </v-btn>

      <br />

      <router-link to="./menu" class="linkp">
        <v-btn dark class="botaoSair">voltar</v-btn>
      </router-link>
      <v-btn class="botaoB" @click="saveCSV()"> Download<br />CSV </v-btn>
    </v-card>

    <br />
    <v-card class="cardform">
      <v-card-title class="cardtitulo">
        <v-text-field
          v-model="search"
          append-icon="mdi-magnify"
          label="Search"
          single-line
          hide-details
        ></v-text-field>
      </v-card-title>
      <v-data-table
        :headers="headers"
        :items="dados"
        :search="search"
      ></v-data-table>
    </v-card>
    <br />
    <Footer />
  </div>
</template>
<script>
import { api } from "@/conf/api";
import Navbar from "../components/Navbar";
import Footer from "../components/footer.vue";

export default {
    name: "HelloView",
  async beforeMount() {
    this.listar();
  },
  components: {
    Navbar,
    Footer,
  },

  data() {
    return {
      d1: "",

      d2: "",

      tronco: "",

      items: [],

      search: "",
      headers: [
        {
          text: "nometronco",
          align: "start",
          filterable: true,
          value: "nometronco"
        },
        { text: "mensagem", value: "mensagem" },
        { text: "statuspeer", value: "statuspeer" },
        { text: "datahora", value: "datahora" },
      ],
      dados: [],
    };
  },
  methods: {
    dataF: function (d2) {
      let d = d2;
      return (
        d.substr(0, 4) +
        "-" +
        d.substr(5, 2) +
        "-" +
        d.substr(8, 2) +
        " " +
        d.substr(11, 2) +
        ":" +
        d.substr(14, 2) +
        ":" +
        d.substr(17, 2)
      );
    },
    listar: async function () {
      let listartronco = await api.get(`/listartronco`);
      // let entrajoin = join.data.dados;
      //console.log(listartronco);
      let listtronco = listartronco.data.dados;
      //console.log("Lista as filas", listtronco);
      let nometronco = [];
      //let nomefila = [];
      listtronco.forEach((d) => {
        // nomefila = d.descr;
        nometronco = d.channelid;
        //console.log("nome da fila:", nometronco);
        // this.listafila = [nomefila];
        //this.items = nomefila;
        this.items.push([nometronco]);
      });
    },
    exibir: async function () {
      //// console.log(this.fila)
      //// console.log(filareal, pinreal);
      //Lista filas

      let troncoArray = await api.get(
        `/buscartronco/${this.d1}/${this.d2}/${this.tronco}`
      );
      let tronco = troncoArray.data.dados;
   
    

      this.dados = tronco;
      console.log(this.dados)
      //console.log(this.dados);
    },

    saveCSV() {
      this.filename = "PlugPhone troncos";
      //================================================================
      let csvFile = `"channelid do Tronco";"Entrada";"Atendidas";"Abandonadas";"Na Fila";\n`;
      this.dados.forEach((a) => {
        csvFile += `"${a.nome}";"${a.entrar}";"${a.agentcomplete}";"${a.numabandon}";"${a.entrart}"\n`;
      });

      var blob = new Blob(["\ufeff", csvFile], {
        type: "text/csv;charset=utf-8;",
      });
      if (navigator.msSaveBlob) {
        navigator.msSaveBlob(blob, this.filename);
      } else {
        var link = document.createElement("a");
        if (link.download !== undefined) {
          var url = URL.createObjectURL(blob);
          link.setAttribute("href", url);
          link.setAttribute("download", this.filename);
          link.style.visibility = "hidden";
          document.body.appendChild(link);
          link.click();
          document.body.removeChild(link);
        }
      }
      //================================================================

      //alert(this.filename)
      this.filename = "PlugPhone Troncos";
    },
  },
};
</script>
<style scoped>
/*//////////////////////////////////////////////////////////////////
[ FONT ]*/

/*//////////////////////////////////////////////////////////////////
[ RESTYLE TAG ]*/
* {
  margin: 0px;
  padding: 0px;
  box-sizing: border-box;
}
body,
html {
  height: 100%;
  font-family: sans-serif;
}

/* ------------------------------------ */
a {
  margin: 0px;
  transition: all 0.4s;
  -webkit-transition: all 0.4s;
  -o-transition: all 0.4s;
  -moz-transition: all 0.4s;
}

.filtro {
  width: 0%;
  margin-left: 8%;
  right: 6%;
  margin-bottom: -1%;
}
.filtro2 {
  width: 0%;
  margin-left: 14%;
  right: 19%;
  margin-bottom: -1%;
}
.filtrorelatorios {
  display: flex;
  align-items: self-end;
    background-color: rgba(255, 255, 255, 0.717);

}
.datest {
  border-style: solid !important;
  display: inline;
  border-radius: 0% !important;
  margin-top: 19px;
  width: 125px;
  margin-left: 0.2%;
  margin-bottom: 0%;
  border-color: black;
  border-width: 3% !important;
}

a:focus {
  outline: none !important;
}

a:hover {
  text-decoration: none;
}
.cardform {
  background-color: #61a5e8;
}
/* ------------------------------------ */
h1,
h2,
h3,
h4,
h5,
h6 {
  margin: 0px;
}

p {
  margin: 0px;
  font-size: 25px;
  color: #fff;
}

ul,
li {
  margin: 0px;
  list-style-type: none;
}

/* ------------------------------------ */

textarea {
  display: block;
  outline: none;
}

.botaoA {
  margin-left: -5%;
  right: 1%;
  background-color: rgb(97 165 232) !important;
  color: white;
}

.botaoB {
  margin-left: 6%;
  right: 5%;
  background-color: rgb(88, 202, 109) !important;
  color: white;
}

.botaoSair {
  margin-left: 1%;
  background-color: green !important;
  text-decoration: none !important;
}
</style>