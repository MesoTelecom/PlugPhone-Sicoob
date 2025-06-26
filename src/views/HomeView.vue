<template>

  <v-container class="fill-height" fluid>
    <v-card-text class="mt-12" id="centralizado">

      <!--text--accent-NUMBER altera a cor da letra do texto-->
      <h1 class="text-center display-1">Seja bem-vindo ao PlugPhone Cloud</h1>
      <!--div que trata botões de Facebook, Google e Linkedin-->

      <v-form style="width: 53%; margin-left: 23%;">
        <v-text-field label="Digite seu usuário" name="usuario" type="text" color="#61a5e8" v-model="usuario"
          prepend-icon="email" />

        <v-text-field id="password" label="Digite sua senha" name="senha" type="password" color="#61a5e8"
          v-model="senha" prepend-icon="lock" />

      </v-form>
    </v-card-text>
    <div class="text-center" style="width: 100%">
      <v-btn rounded @click="login" color="#61a5e8" class="centralizado" style="color: white;">Login</v-btn>



    </div>
  </v-container>


</template>

<script>
import { api } from "@/conf/api";


export default {
  name: "HomeView",
  data: () => ({
    usuario: "",
    senha: "",
    id: "",
    error: false,
  }),
  methods: {
    async login() {
      try {
        this.error = false;

        const res = await api.post("loginconfere/", {
          login: this.usuario + "-Meso",
          senha: this.senha,
        });

        this.id = res.data.usuario2
        if (res.data && res.data.token) {
          const token = res.data.token;
          const idPermissao = res.data.idPermissao;

          this.$store.state.token = token;
          this.$store.state.idPermissao = idPermissao;

          // 🔐 Adiciona o token ao header padrão
          api.defaults.headers.common["x-access-token"] = token;

          // 🔎 Busca a permissão binária
          const resPermissao = await api.get("busca-permissao/" + idPermissao);
          const permissaoBinaria = resPermissao.data.permissao || '0'.repeat(16);
          let tipo = resPermissao.data.tipo
          // 🔁 Converte string binária em array de inteiros
          const rotas = permissaoBinaria.split('').map(p => parseInt(p));

          // 🔄 Atualiza Vuex
          this.$store.dispatch('insereRotas', rotas);

          const usu = {
            id: this.id,
            usuario: this.usuario,
            pin: token,
            tipo: tipo,
            tokenFirebase: this.$store.state.tokenFCM,
            rotas: rotas
          };

          // 💾 Salva no localStorage
          this.$store.dispatch('insereUsuario', usu);
          localStorage.setItem("usu", JSON.stringify(usu));
          localStorage.setItem("jwt", token);
          localStorage.setItem("insereRotas", JSON.stringify(rotas));

          // 🧭 Redirecionamento baseado no tipo (temporário?)
          if (["Técnico", "Comercial", "Financeiro"].includes(res.data.tipo)) {
            this.$router.push("DashboardPrincipal");
          } else if (res.data.tipo === "vendedor") {
            this.$router.push("DashboardPrincipal");
          } else {
            this.$router.push("DashboardPrincipal");
          }
        } else {
          this.error = true;
        }
      } catch (e) {
        console.error("Erro no login:", e);
        this.error = true;
      }
    }

  },
  mounted() {
    this.$store.state.logado = false;
    this.$store.state.adm = false;
  },
};
</script>

<style scoped>
#centralizado {
  margin-left: 3% !important;
  margin-top: 14% !important;
}

h1 {

  color: #595E71;
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

  color: #595E71;
  position: center;
}

.text-center1 {

  color: #595E71;
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
  transition: all .3s linear;
}

.show-enter,
.show-leave-to {
  transform: translateX(100%);
}

.fill-height {




  background-repeat: no-repeat;
  background-size: 100%;

  box-shadow: inset 0 0 0 1000px rgb(205 205 205 / 52%);
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