<template>
  <div id="main-fundo">
    <v-app>
      <v-content>
        <v-container class="fill-height" fluid>
          <v-card-text class="mt-12" id="centralizado">
            <div id="logoutB" class="text-center" style="width: 105%">
              <v-btn
                @click="logout"
                rounded
                color="#61a5e8"
                style="
                  background-color: rgb(238, 35, 35);
                  border-color: rgb(97, 165, 232);
                  color: white;
                  margin-left: -101%;
                  margin-top: -11%;
                  border-radius: 5%;
                "
              >
                Logout
                <p></p>
                <v-icon> mdi-logout</v-icon></v-btn
              >
            </div>

            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <!--text--accent-NUMBER altera a cor da letra do texto-->
            <h1 class="text-center display-1">Painel do Agente PlugPhone</h1>
            <!--div que trata botões de Facebook, Google e Linkedin-->

            <v-form style="width: 55%; margin-left: 24%">
              <v-text-field
                v-model="itenslogin.pin"
                label="Digite seu código pin"
                name="Email"
                type="text"
                color="#ffffff"
              />

              <v-select
                :items="Selfila"
                label="Informar o número da fila"
                v-model="itenslogin.fila"
                class="filtro"
              ></v-select>

              <v-select
                :items="items"
                label="Informar o número da ramal"
                v-model="itenslogin.ramal"
              ></v-select>

              <div id="btn"></div>
            </v-form>
          </v-card-text>
          <div class="text-center" style="width: 100%">
            <v-btn
              @click="salvar"
              rounded
              color="#61a5e8"
              style="color: white; margin-left: 3%"
              >Login</v-btn
            >

            <br />
            <br />
          </div>
        </v-container>
      </v-content>
    </v-app>
  </div>
</template>

<style scoped>
#centralizado {
  margin-left: 3%;
}

h1 {
  color: #595e71;
}

#fill-height {
  background-color: #243e57;
}

.v-text-field {
  width: 50%;
  margin-left: 24%;
}

.v-btn {
  margin-left: 0%;
}
.text-center {
  color: #595e71;
  position: center;
}

.text-center1 {
  color: #595e71;
  position: center;
  background-color: transparent;
}

.cardanna {
  /* background-image: url(../assets/modelo.jpg);*/
  background-repeat: no-repeat;
  background-size: 0%;
}
.centralizado {
  margin-left: 48%;
}
.col-md-4 {
  color: transparent;
}
.v-btn__content {
  position: center;
}
.retomar {
}

.show-enter-active,
.show-leave-enter {
  transform: translateX(0);
  transition: all 0.3s linear;
}
.show-enter,
.show-leave-to {
  transform: translateX(100%);
}

.fill-height {
  background-repeat: no-repeat;
  background-size: 100%;

  /* box-shadow: inset 0 0 0 1000px rgba(4, 81, 132, 0.85);*/
  background-image: url(../assets/mesofundo.jpg);
  padding: 15px;
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center;
}

.text-center:hover,
.col-md-4:hover {
  background-color: transparent;
}
</style>

<script>
//import  from "../components/";
import { api } from "@/conf/api";

export default {
    name: "HelloView",
  async beforeMount() {
    this.exibirramal();
    this.exibir();
  },
  data() {
    return {
      items: [],
      Selfila: [],
      itenslogin: {
        usuario: "",
        pin: "",
        fila: "",
        ramal: "",
        image: "",
      },
      operador: {
        pin: "",
        ramal: "",
      },
      logado: {
        usuario: "",
        pin: "",
        fila: "",
        ramal: "",
      },
    };
  },
  components: {
    //Footer,
  },

  methods: {
    exibir: async function () {
      let listafila = await api.get(`/listafilastotais`);
      // let entrajoin = join.data.dados;

      let listatotalfilas = listafila.data.dados;

      let numerofila = [];
      //let nomefila = [];
      listatotalfilas.forEach((d) => {
        //nomefila = d.descr;
        numerofila = d.extension;

        // this.listafila = [nomefila];
        //this.items = nomefila;
        this.Selfila.push([numerofila]);
      });
    },

    exibirramal: async function () {
      let listaramal = await api.get(`/listaramais/`);
      // let entrajoin = join.data.dados;

      let listar = listaramal.data.dados;

      let numeroramal = [];
      //let nomefila = [];
      listar.forEach((d) => {
        //  nomefila = d.descr;
        numeroramal = d.extension;

        // this.listafila = [nomefila];
        //this.items = nomefila;
        this.items.push([numeroramal]);
        //console.log(this.items)
      });
    },
    async logout() {
      try {
        this.error = false;

        localStorage.removeItem("jwt");
        this.$router.push("/");

        // console.log(res.data.dados[0]);
      } catch (e) {
        window.alert("Não deu!");
      }
    },
    retomar: async function () {
      console.log(this.itenslogin);

      let res2 = await api.post("/verificapainel", this.logado);

      let respapi = res2.data.dados;

      respapi.forEach((d) => {
        this.logado.usuario = d.ramal_fisico;
      });

      if (res2.data.dados.length > 0) {
        let ramal = this.logado.ramal.replace(/[^\d]+/g, "");

        this.logado.ramal = ramal;

        this.$store.dispatch("guardaPin", this.logado);
        this.$router.push("painelAgente");
      } else {
        alert("login incorreto!");
      }
    },
    salvar: async function () {
      console.log(this.itenslogin);

      console.log("pin digitado: ", this.itenslogin.pin);

      let res2 = await api.post("/verificapainel", this.itenslogin);
      let res3 = await api.get(`/verificalogado/${this.itenslogin.pin}`);
      console.log("res3 retorna ", res3.data.dados);
      console.log("pin em uso quantidad: ", res3.data.dados.length);

      let resapi = res2.data.dados;
      console.log("res2 retorna", resapi);

      resapi.forEach((d) => {
        this.itenslogin.usuario = d.ramal_fisico;
        this.itenslogin.image = d.image;
      });
      let resapi2 = res3.data.dados;
      console.log("res2 retorna", resapi);

      resapi2.forEach((d) => {
        this.logado.ramal = d.ramal;
        this.logado.pin = d.pin;
        this.logado.fila = d.fila;
      });

      if (res2.data.dados.length > 0) {
        if (res3.data.dados.length > 0) {
          alert(`pin ja está em uso no callcenter no ramal: ${this.logado.ramal}`);
          this.retomar();
        } else {
          let logapainel = await api.post("/logarpainel", this.itenslogin);
          let a = logapainel.data.dados;
          console.log(a);
          let logapainelop = await api.post("/logarpainelop", this.itenslogin);
          let b = logapainelop.data.dados;
          console.log(b);

          let logs = await api.post("/logslogin", this.itenslogin);
          let c = logs.data.dados;
          console.log(c);

          this.operador.pin = this.itenslogin.pin;
          this.operador.ramal = this.itenslogin.ramal;
          let estadoop = await api.post("/estadoperador", this.operador);
          let e = estadoop.data.dados;
          console.log(e);
          this.$store.dispatch("guardaPin", this.itenslogin);
          this.$router.push("painelAgente");
        }
      } else {
        alert("login incorreto!");
      }
    },
  },
};
</script>
