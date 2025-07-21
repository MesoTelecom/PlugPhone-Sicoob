<template>

  <v-container class="fill-height" fluid>
    <v-card-text class="mt-12" id="centralizado">

      <div style="width: 100%;
    position: relative;
    margin-top: -9% !important;">
        <!--text--accent-NUMBER altera a cor da letra do texto-->
        <!--<img src="../assets/plugbranco3.png" alt="" class="icone">-->
        <br>
        <br>


        <h1 class="text-center display-1" style="color: white;">Seja bem-vindo ao PlugPhone Cloud</h1>
        <br>
        <br>

        <br>
        <!--div que trata botões de Facebook, Google e Linkedin-->
      </div>
      <v-form style="        top: 44% !important;
    width: 55% !important;
    left: 21% !important;
    position: relative;">
        <v-row style="width: 60% !important;margin-left: 20% !important;">
          <v-icon style="
          left: 20% !important;
          height: 50px;
          font-size: 40px;
          color: white;">mdi-account</v-icon>
          <v-text-field label="Digite seu usuário" name="usuario" type="text" v-model="usuario"
            class="custom-text-field" solo />
        </v-row>

        <v-row style="    width: 60% !important;
    margin-left: 20% !important;">
          <v-icon style="
          left: 20% !important;
          height: 50px;
          font-size: 40px;
          color: white;">mdi-lock</v-icon>
          <v-text-field id="password" label="Digite sua senha" name="senha" type="password" v-model="senha"
            class="custom-text-field" solo />
        </v-row>
        <div class="text-center" style="width: 100%">
          <br>
          <br>
          <br>
          <v-btn rounded @click="login" color="#61a5e8" class="centralizado"
            style="color: white;    margin-bottom: 1px;margin-left: 20px;">Login</v-btn>



        </div>
      </v-form>
    </v-card-text>

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
/* Centralização */
#centralizado {
  margin-left: 4% !important;

}

/* Estilização do título */
h1 {
  color: #ffffff;
}

/* Fundo do container */
#fill-height {
  background-color: #ffffff;
}

/* Ajuste dos campos de texto */
.v-text-field {
  width: 50%;
  margin-left: 24%;
}

/* Fundo branco e bordas arredondadas nos v-text-field */
.v-text-field .v-input__control {
  background-color: white !important;
  /* Deixa os campos com fundo branco */
  border-radius: 8px;
  /* Bordas arredondadas */
  border: 2px solid #ccc;
  /* Borda cinza leve */
}

/* Texto digitado dentro do v-text-field */
.v-text-field input {
  color: black !important;
  /* Deixa o texto preto */
}

/* Placeholder (label) dentro do v-text-field */
.v-text-field .v-label {
  color: black !important;
  /* Placeholder preto */
  font-weight: bold;
  /* Deixa o texto do label mais forte */
}

/* Ícones dentro dos campos */
.v-text-field .v-icon {
  color: black !important;
  /* Ícones pretos */
}

/* Estilização do botão */
.v-btn {
  margin-left: 0%;
}

/* Estilização do conteúdo do botão */
.v-btn__content {
  position: center;
}

/* Animações de entrada e saída */
.show-enter-active,
.show-leave-enter {
  transform: translateX(0);
  transition: all 0.3s linear;
}

.show-enter,
.show-leave-to {
  transform: translateX(100%);
}

/* Estilização do container principal */
.fill-height {
  background-repeat: no-repeat;
  background-size: cover !important;
  background-image: url(../assets/mesofundoPlug.jpg);
  padding: 15px;
  background-repeat: no-repeat;
  background-size: 100%;
  background-position: bottom;
}

/* Hover para manter fundo transparente */
.text-center:hover,
.col-md-4:hover {
  background-color: transparent;
}

/* Outros ajustes */
.text-center {
  color: #ffffff;
  position: center;
}

.text-center1 {
  color: #ffffff;
  position: center;
  background-color: transparent;
}

/* Ajuste de fundo para evitar erros em divs invisíveis */
.cardanna {
  background-repeat: no-repeat;
  background-size: 0%;
}

.col-md-4 {
  color: transparent;
}

.icone {
  width: 14%;
  margin-left: 42%;
}
</style>
