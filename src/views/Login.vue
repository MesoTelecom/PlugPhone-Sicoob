<template>
  <v-container class="fill-height" fluid>
    <v-card-text class="mt-12" id="centralizado">
      <!--text--accent-NUMBER altera a cor da letra do texto-->
      <h1 class="text-center display-1">Seja bem-vindo ao PlugPhone OmniChannel</h1>
      <!--div que trata botões de Facebook, Google e Linkedin-->
      <br />
      <div class="text-center" mt-4>
        <img
          alt="PlugPhone logo"
          src="../assets/PlugPhoneCentro.png"
          width="200"
          height="135,5"
        />
      </div>
      <br />
      <v-form style="width: 53%; margin-left: 23%">
        <v-text-field
          label="Digite seu usuário"
          name="usuario"
          type="text"
          color="#ffffff"
          v-model="usuario"
        />

        <v-text-field
          id="password"
          label="Digite sua senha"
          name="senha"
          type="password"
          color="#ffffff"
          v-model="senha"
        />
      </v-form>
    </v-card-text>
    <div class="text-center" style="width: 100%">
      <v-btn
        rounded
        @click="exibe"
        color="#61a5e8"
        class="centralizado"
        style="color: white"
        >Login</v-btn
      >
    </div>
  </v-container>
</template>

<script>
// @ is an alias to /src

import { api } from "@/conf/api";
export default {
  name: "HomeView",
  data() {
    return {
      usuario: "",
      senha: "",
    };
  },
  components: {
    //
  },
  

  methods: {
    exibe: async function () {
      //return console.log(this.usuario, this.senha)
      try {
        let body = {
          login: this.usuario,
          senha: this.senha,
        };
        let res1 = await api.post("/loginconfere", body);
        console.log("login aqui",res1.data.dados);
        if (res1.data && res1.data.dados.length > 0) {
          //this.$store.commit("setLogado");
          this.$router.push("Dashboard");
        } else {
          alert("Usuário ou senha estão incorretos!");
        }
        //

        //
      } catch (e) {
        console.log(e.message);
      }
    },
  },
};
</script>

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
.col-md-4 {
  color: transparent;
}
.v-btn__content {
  position: center;
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
