<template>
  <v-app>
    <Navbar />

    <v-main>
      <v-container>
        <h2>Enviar Arquivo CSV</h2>
        <v-file-input label="Selecione o arquivo" @change="onFileChange" :error-messages="fileError"></v-file-input>
        <v-select label="Campanha" :items="dadosGrupo" v-model="grupo"></v-select>
        <v-text-field label="Digite o nome da campanha" name="usuario" type="text" color="#61a5e8"
          v-model="nomeCampanha" />
        <v-btn @click="uploadFile" color="primary">Enviar</v-btn>
        <v-btn @click="testaGrupo" color="primary">teste</v-btn>

        <v-alert v-if="uploadStatus" :type="uploadStatus.type" dismissible>
          {{ uploadStatus.message }}
        </v-alert>
        <router-link to="./menurealtime" class="linkp">
          <v-btn dark class="botaoSair">voltar</v-btn>
        </router-link>
      </v-container>
      <br><br>
      <v-data-table :headers="headers" :items="dados" :search="search" class="elevation-1"></v-data-table>
    </v-main>
    <Footer />
  </v-app>
</template>

<script>
import { api } from "@/conf/api";
import { apiWP } from "@/conf/apiWP";

import Navbar from "../components/Navbar";
import Footer from "../components/footer.vue";
import verificaAcesso from "../acess/verificaAcessoMixin"
//import { forEach } from "core-js/core/array";


export default {
  mixins: [verificaAcesso],
  async beforeMount() {
    this.listarGrupo()

    let usuario = JSON.parse(localStorage.getItem('usu'));
    console.log('usuario oque?', usuario)
    this.id = usuario.id
    this.tipo = usuario.tipo;
    this.usuario = usuario.usuario + "-Meso"
  },

  data() {
    return {
      fileError: "", // Para armazenar a mensagem de erro
      selectedFile: null, // Para armazenar o arquivo selecionado
      uploadStatus: null,
      idsetinterval: null,
      dadosGrupo: [],
      d1: '',
      pin: '',
      grupo: '',
      ramal: '',
      d2: '',
      fila: '',
      search: "",
      ano: "",
      nomeCampanha: "",
      orgao: "",
      processo: "",
      liquidacao: "",
      valor_da_face: "",
      credor: "",
      documento: "",
      idade: "",
      renda: "",
      tipo: "",
      telefone: "",
      id: "",
      atendeu: "",
      reagendar: "",
      interesse: "",
      negociar: "",
      obs: "",
      status: "",
      headers: [
        { text: "nome", value: "nome" },
        { text: "Telefone", value: "telefone" },
      ],
      dados: [],
      items: [],

    };
  },
  components: {
    Navbar,
    Footer,
  },
  methods: {
    async listarGrupo() {
      let buscaGrupo = await api.get(`/listargrupo`)
      let grupo = buscaGrupo.data.dados

      this.dadosGrupo = [] // zera pra não duplicar

      grupo.forEach(element => {
        this.dadosGrupo.push({
          text: element.nome,
          value: element.id_agencia
        });
      });
      console.log('Teste grupo', this.grupo)
      console.log("Grupo formatado:", this.dadosGrupo)

    },

    listar: async function () {

      let buscarCsv = await apiWP.get(`/buscarcsv/${this.nomeCampanha}`);
      console.log('buscarCSV', buscarCsv)
      this.dados = buscarCsv.data.dados
      console.log('dados csv', this.dados.length)
      if (this.dados.length > 0) {
        clearInterval(this.idsetinterval)
        console.log('To aquiiiiiiiiiiiiiiiiiiiiiiiiiiiii')
      }
      let nome = ""
      let telefone = ""
      console.log('grupo', this.grupo)

      console.log('eu sou o this.dados', this.dados)
      apiWP.get(`/criaCampanha/${this.usuario}/${this.nomeCampanha}/${this.grupo}`)

      this.dados.forEach((d) => {
        console.log('kyojin karate eu sou o dan', d)
        nome = d.nome
        telefone = d.telefone

        console.log('nome:', nome)
        console.log('telefone:', telefone)
        console.log(apiWP)
        //apiWP.get(`/adicionaContato/${nome}/${telefone}/${this.grupo}/${this.nomeCampanha}`)

      })

    },
    async testaGrupo() {
      console.log('eu sou o grupo', this.grupo)
      console.log('eu sou o nome campanha', this.nomeCampanha)
    },
    onFileChange(file) {
      this.fileError = ""; // Limpa a mensagem de erro
      this.selectedFile = null; // Reseta o arquivo selecionado
      this.uploadStatus = null; // Reseta o status do upload

      if (file && file.name) {
        const fileExtension = file.name.split(".").pop().toLowerCase();
        if (fileExtension !== "csv") {
          this.fileError = "Por favor, selecione um arquivo CSV.";
        } else {
          this.selectedFile = file; // Armazena o arquivo válido
        }
      }
    },
    uploadFile() {
      this.uploadStatus = ""
      console.log('Olha eu aquui', this.Grupo)
      if (this.selectedFile) {

        console.log("Enviando arquivo:", this.selectedFile);

        const formData = new FormData();
        formData.append('file', this.selectedFile);
        formData.append('usuario', this.usuario);
        formData.append('grupo', this.grupo);
        formData.append('campanha', this.nomeCampanha)
        console.log('CUCHULAIN', formData)
        apiWP.post('/upload', formData, {
          headers: {
            'Content-Type': 'multipart/form-data'
          },
        })
          .then(response => {
            console.log('Arquivo enviado com sucesso:', response.data);
            console.log('eu sou o formData', response)

            this.uploadStatus = { type: 'success', message: 'Arquivo enviado com sucesso!' };
            this.idsetinterval = setInterval(() => this.listar(), 1000);

          })
          .catch(error => {
            console.error('Erro ao enviar o arquivo:', error);
            this.uploadStatus = { type: 'error', message: 'Erro ao enviar o arquivo.' };
          });
      } else {
        this.fileError = "Nenhum arquivo CSV válido selecionado.";
      }

    }
  }
};
</script>

<style>
.botaoSair {
  left: 1%;
  background-color: green !important;
  text-decoration: none !important;
}
</style>
