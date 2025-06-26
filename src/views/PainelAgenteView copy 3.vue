<template >
  <v-app id="inspire" class="papel">
    <Navbar2 />
    <div id="neo-contentbox" style="margin-top: -28%">
      <div id="neo-contentbox-maincolumn">
        <input type="hidden" id="_framework_module_id" value="agent_console" />
        <input type="hidden" id="_framework_webCommon" value="libs/" />
        <div class="neo-module-content">
          <!-- Viene del tpl menu.tlp-->

          <div
            id="callcenter-info-message"
            class="ui-state-highlight ui-corner-all"
            style="display: none"
          >
            <p>
              <span
                class="ui-icon ui-icon-info"
                style="float: left; margin-right: 0.3em"
              ></span>
              <span id="callcenter-info-message-text"></span>
            </p>
          </div>
          <div
            id="callcenter-error-message"
            class="ui-state-error ui-corner-all"
            style="display: none"
          >
            <p>
              <span
                class="ui-icon ui-icon-alert"
                style="float: left; margin-right: 0.3em"
              ></span>
              <span id="callcenter-error-message-text"></span>
            </p>

            &gt;
          </div>
          <div id="callcenter-area-principal">
            <div id="callcenter-titulo-consola" class="moduleTitle">&nbsp;</div>

            <hr style="border-top: 2px solid black" />
            <br />

            <div id="callcenter-wrap">
              <div id="callcenter-controles">
                <br />
                <h1>
                  <img src="../../src/assets/agent.png" style="width: 34px" /><b
                    style="color: black"
                  >
                    Atendendo na fila: {{ $store.state.usuario.usuario }} | Ramal:
                    {{ $store.state.usuario.ramal }}</b
                  >
                </h1>
                <v-btn
                
                  @click="saveform"
                  :class="salvarbtn"
                  :disable="isDisabled"
                >
                  <span class="ui-button-text"> Salvar forumlário </span>
                </v-btn>
                <v-btn>
                  <span class="ui-button-text" @click="hangup()"> Hangup</span>
                </v-btn>

                <v-dialog v-model="dialog" max-width="500px">
                  <template v-slot:activator="{ on, attrs }">
                    <v-btn v-bind="attrs" v-on="on"> {{ pausa }} </v-btn>
                  </template>

                  <v-card>
                    <v-card-title class="text-h5 grey lighten-2">
                      {{ pausa }} Pin
                    </v-card-title>

                    <v-card-text> </v-card-text>
                    <v-text-field
                      label="Por segurança Informe o PIN antes de "
                      outlined
                      v-model="pin"
                    ></v-text-field>
                    <v-divider></v-divider>

                    <v-card-actions>
                      <v-spacer></v-spacer>
                      <v-btn color="primary" text @click="dialog = false">
                        cancelar
                      </v-btn>
                      <v-btn
                        color="blue darken-1"
                        text
                        @click="pausar(), (dialog = false)"
                      >
                        {{ pausa }}
                      </v-btn>
                    </v-card-actions>
                  </v-card>
                </v-dialog>
            
                <v-dialog v-model="dialogSai" max-width="500px">
                  <template v-slot:activator="{ on, attrs }">
                    <v-btn v-bind="attrs" v-on="on"> Sair </v-btn>
                  </template>

                  <v-card>
                    <v-card-title class="text-h5 grey lighten-2">
                      Encerrar sessão
                    </v-card-title>

                    <v-card-text> </v-card-text>
                    <v-text-field
                      label="Por segurança Informe o PIN antes de Sair"
                      outlined
                      v-model="pinSai"
                    ></v-text-field>
                    <v-divider></v-divider>

                    <v-card-actions>
                      <v-spacer></v-spacer>
                      <v-btn color="primary" text @click="dialogSai = false">
                        cancelar
                      </v-btn>
                      <v-btn
                        color="blue darken-1"
                        text
                        @click="sair(), (dialogSai = false)"
                      >
                        Sair
                      </v-btn>
                    </v-card-actions>
                  </v-card>
                </v-dialog>
              </div>
              <br />
              <br />
              <img
                src="../assets/plugbranco.png"
                style="
                  width: 6%;
                  margin-left: 94%;
                  margin-top: 2%;
                  visibility: hidden;
                "
              />
              <br />
              <br />
              <div>
                <div
                  id="callcenter-cejillas-contenido"
                  class="ui-tabs ui-widget ui-widget-content ui-corner-all"
                >
                  <div id="callcenter-estado-agente" :class="estado">
                    <div id="callcenter-estado-agente-texto">
                      {{ chamadaestado }}
                    </div>
                  </div>

                  <div
                    id="callcenter-llamada-paneles"
                    aria-labelledby="ui-id-2"
                    class="
                      ui-tabs-panel
                      ui-widget-content
                      ui-corner-bottom
                      ui-layout-container
                    "
                    role="tabpanel"
                    aria-hidden="false"
                    style="overflow: hidden"
                  >
                    <div
                      id="callcenter-llamada-paneles-izq"
                      class="
                        ui-layout-west
                        ui-layout-pane
                        ui-layout-pane-west
                        ui-layout-container
                      "
                      style="
                        position: absolute;
                        margin: 0px;
                        inset: 0px auto 0px 0px;
                        height: 457px;
                        z-index: 0;
                        width: 300px;
                        display: block;
                        visibility: visible;
                        overflow: hidden;
                      "
                    >
                      <div
                        class="
                          ui-layout-center ui-layout-pane ui-layout-pane-center
                        "
                        style="
                          position: absolute;
                          margin: 0px; /* margin-right: 2px; */
                          inset: 0px 0px 0px 306px;
                          height: 457px;
                          z-index: 0;
                          display: block;
                          visibility: visible;
                        "
                      >
                        <fieldset class="ui-widget-content ui-corner-all">
                          <legend>
                            <b style="color: black">Informações</b>
                          </legend>
                          fila: {{ info.infofila }}<br />
                          chamador: {{ info.infocallerid1 }}<br />
                          atendente: {{ info.infocallerid2 }}<br />
                          uniqueid: {{ info.infouniqueid }}<br/>
                          cpf: {{ info.infocpf }}
                          <div id="callcenter-llamada-info"></div>
                        </fieldset>
                      </div>
                      <div
                        class="
                          ui-layout-south ui-layout-pane ui-layout-pane-south
                        "
                        style="
                          position: absolute;
                          margin: 0px;
                          inset: auto 0px 0px;
                          width: auto;
                          z-index: 0;
                          height: 250px;
                          display: block;
                          visibility: visible;
                        "
                      >
                        <fieldset class="">
                          <legend><b style="color: black">Script</b></legend>
                          <div
                            id="callcenter-llamada-script"
                            style="
                              background-color: #f9f9f999;
                              margin-bottom: 8%;
                            "
                          >
                            <b> {{ script.titulo }}</b>
                            <br />
                            {{ script.texto }}
                          </div>
                        </fieldset>
                      </div>
                    </div>
                    <div
                      class="
                        ui-layout-center ui-layout-pane ui-layout-pane-center
                      "
                      id="linha"
                      style="
                        position: absolute;
                        margin: 0px;
                        inset: 0px 0px 0px 306px;
                        height: 457px;
                        z-index: 0;
                        display: block;
                        visibility: visible;
                      "
                    >
                      <fieldset class="ui-widget-content ui-corner-all">
                        <legend><b style="color: black">Formulários</b></legend>
                        <div id="form" :class="formula">
                          <v-form
                            style="width: 50%; margin-left: 15%"
                            :style="{ formula }"
                          >
                            <v-text-field
                              v-model="formulario.nome"
                              label="Digite seu nome"
                              name="Email"
                              type="text"
                              color="#ffffff"
                            />
                            <v-text-field
                              v-model="formulario.contato"
                              label="Digite seu email de contato"
                              name="Email"
                              type="text"
                              color="#ffffff"
                            />
                            <v-text-field
                              v-model="formulario.rgcpf"
                              label="Digite seu CPF ou RG"
                              name="Email"
                              type="text"
                              color="#ffffff"
                            />
                            <v-text-field
                              v-model="formulario.endereco"
                              label="Digite seu Endereço"
                              name="Email"
                              type="text"
                              color="#ffffff"
                            />
                            <v-text-field
                              v-model="formulario.solicitacao"
                              label="Digite sua solicitação"
                              name="Email"
                              type="text"
                              color="#ffffff"
                            />

                            <div id="callcenter-llamada-form"></div>
                          </v-form>
                        </div>
                      </fieldset>
                    </div>
                  </div>

                  <Footer />
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </v-app>
</template>

<script>
import { api } from "@/conf/api";
import Navbar2 from "../components/Navbar2";
import Footer from "../components/footer.vue";
const CPF = require('cpf');
export default {
    name: "HelloView",
  async beforeMount() {
    this.verificapin();
    this.exibirramal();
    this.testeCPF();
   // setInterval(() => this.verificachamada(), 2000);
    this.idsetinterval = setInterval(async () => await this.verificachamada(), 2000);
  },


  data: () => ({
    idsetinterval: null,
    pausa: "pausar",
    items: [],
    dialog: false,
    dialogTransfer: false,
    estado: "callcenter-estado-ocioso",
    salvarbtn: "Salvar-sem-liga",
    formula: "formulario-sem-chamada",

    chamadaestado: "Sem chamada ativa",
    dialogSai: false,
    pin: "",
    ligacao: 0,
    script: {
      sefila: "",
      titulo: "",
      texto: "",
    },
    formulario: {
      nome: "",
      atendente: "",
      pin: "",
      chamador: "",
      rgcpf: "",
      contato: "",
      endereco: "",
      solicitacao: "",
      uniqueid: "",
    },
    info: {
      infofila: "",
      infocallerid1: "",
      infocallerid2: "",
      infouniqueid: "",
      infocanal1: "",
      infocanal2: "",
      infocpf: "",
    },
    sound:
      "http://soundbible.com/mp3/Air Plane Ding-SoundBible.com-496729130.mp3",
    TransfRamal: {
      ramal: "",
    },
    pinSai: "",
    verificapausa: 0,
  }),
  watch: {
    dialog(val) {
      val || this.close();
    },
    dialogSai(val) {
      val || this.close();
    },
    dialogTransfer(val) {
      val || this.close();
    },
  },
  async beforeDestroy() {
    console.log("eu sou idsetinterval", this.idsetinterval);
    clearInterval(this.idsetinterval);
    this.idsetinterval = 0;

  },

  computed: {
    user() {
      return this.$store.state.usuario;
    },
  },
  methods: {
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
 

    transferir: async function () {
      alert("transferido");
    },

    sepausado: async function () {
      let sepausa = this.verificapausa;
      //console.log(sepausa)

      if (sepausa == 0) {
        //console.log('nada')
      } else if (sepausa == 1) {
        this.logpausar();
        //alert('você está pausado!')
      } else if (sepausa == 2) {
        //alert('despausado')
        this.verificapausa = 0;
        this.pausa = "pausar";
        this.chamadaestado = "Sem chamada ativa";

        this.despausar();
      }
    },
    testeCPF: async function(){
      let cpfT =CPF.isValid('16674462667')
      console.log('O CPF É:',cpfT)
    },
    verificapin: async function () {
      let pin = this.$store.state.usuario.pin;
      let ramal = this.$store.state.usuario.ramal;

      if (pin == "" && ramal == "") {
        this.$router.push("loginAgente");
      }
    },
    audiop: async function () {
      let sound = await import("../audios/receive.wav");
      const audio = new Audio(sound);
      audio.play();
    },
    scriptlist: async function () {
      let sl = await api.get(
        `/listarscripttexto/${this.$store.state.usuario.fila}`
      );

      let list = sl.data.dados;

      list.forEach((d) => {
        //nomefila = d.descr;
        this.script.titulo = d.titulo;
        this.script.texto = d.texto;
        this.script.sefila = d.fila;
      });
    },

    informacao: async function () {
      let inf = await api.get(
        `/cpfcomginfo/${this.$store.state.usuario.ramal}/${this.$store.state.usuario.fila}`
      );

      let infor = inf.data.dados;



      infor.forEach((d) => {
        //nomefila = d.descr;
        this.info.infocallerid1 = d.callerid1;
        this.info.infocallerid2 = d.callerid2;
        this.info.infofila = d.uniqueid;
        this.info.infouniqueid = d.uniqueid1 + " / " + d.uniqueid2;
        this.info.infocanal1 = d.canal1;
        this.info.infocanal2 = d.canal2;
       

      });
      let cpfvalida
      let cpfTF 
    

      infor.forEach((d) => {
        //nomefila = d.descr;
      
        cpfvalida = d.cpf

      return cpfvalida
      });
      let cpform = CPF.format(cpfvalida)
      console.log('CPF formatado:',cpform)
      cpfTF = CPF.isValid(cpfvalida)
      console.log('CPF VALIDA',cpfvalida)

      console.log('É:', cpfTF)
        

      if(cpfTF == true){
        this.info.infocpf = cpform;
        
      }else{
        this.info.infocpf = 'cpf invalido'
      }

    },
    playSound(sound) {
      sound = this.sound;
      if (
        sound ===
        "http://soundbible.com/mp3/Air Plane Ding-SoundBible.com-496729130.mp3"
      ) {
        var audio = new Audio(sound);
        audio.play();
      } else {
        //console.log("feito");
      }
      this.sound = "";
    },
    hangup: async function () {
      let inf = await api.get(
        `/hangupverifica/${this.$store.state.usuario.ramal}/${this.$store.state.usuario.fila}`
      );

      let infor = inf.data.dados;

      infor.forEach((d) => {
        //nomefila = d.descr;
        this.info.infocallerid1 = d.callerid1;
        this.info.infocallerid2 = d.callerid2;
        this.info.infofila = d.uniqueid;
        this.info.infouniqueid = d.uniqueid1 + " / " + d.uniqueid2;
        this.info.infocanal1 = d.canal1;
        this.info.infocanal2 = d.canal2;
      });

      if (this.info.infocanal1 == "" || this.info.infocanal2 == "") {
        alert("não está em ligação!");
      } else {
        let canal = this.info.infocanal2.substring(4);
        let a = await api.get(`/hanguppainel/${canal}`);
        console.log(a);
      }
    },
    verificachamada: async function () {
      let ramal = this.$store.state.usuario.ramal;
      console.log(ramal);

      let a = await api.get(`/verificachamada/${ramal}`);
      console.log(a);

      let dadosligacao = a.data.dados;
      console.log(dadosligacao);
      this.ligacao = a.data.dados.length;

      console.log(this.ligacao);

      if (this.ligacao === 0 && this.verificapausa === 0) {
        this.estado = "callcenter-estado-ocioso";
        this.chamadaestado = "sem chamada ativa";
        this.sepausado();
        this.sound =
          "http://soundbible.com/mp3/Air Plane Ding-SoundBible.com-496729130.mp3";
      }
      if (this.ligacao === 1 && this.verificapausa === 0) {
        //console.log("está em ligacão");
        this.estado = "callcenter-estado-ativo";
        this.formula = "formulario-com-chamada";
        this.chamadaestado = "Em ligação";
        this.sepausado();
        this.playSound();
        this.scriptlist();
        this.informacao();
        this.formulario.uniqueid = this.info.infouniqueid;
        this.formulario.atendente = this.info.infocallerid2;
        this.formulario.chamador = this.info.infocallerid1;
        this.formulario.pin = this.$store.state.usuario.pin;

        //console.log("Dados formulario ligacao: ", this.formulario);

        let res2 = await api.post("/insereformauto", this.formulario);
        console.log(res2);
      }
      if (this.ligacao === 0 && this.verificapausa === 1) {
        //console.log("estado pausa: ", this.verificapausa);
        this.sepausado();
      }

      if (this.ligacao == 3) {
        //console.log("em pausa");
      }
    },
    saveform: async function () {
      if (this.formulario.uniqueid == "") {
        alert("Não há nenhuma chamada");
      } else {
        let res2 = await api.post("/insereform", this.formulario);
        console.log(res2);
        alert("Formulário salvo");
      }
    },
    pausar: async function () {
      let a = await api.get(`/pinpausar/${this.pin}`);

      let agente = a.data.dados;
      //console.log(agente)
      let ramal;
      let fila;
      let pinpausar;
      agente.forEach((d) => {
        ramal = d.ramal;

        return ramal;
      });
      let ramalnum = ramal.replace(/[^\d]+/g, "");
      agente.forEach((d) => {
        fila = d.fila;

        return fila;
      });

      agente.forEach((d) => {
        pinpausar = d.pin;

        return pinpausar;
      });

      //console.log(ramalnum, pinpausar ,fila)

      let b = await api.get(
        `/pausarpainel/${ramalnum}/${pinpausar}/${fila}`
      );
      console.log(b);

      this.pausa = "despausar";
      this.estado = "callcenter-estado-pausa";
      this.chamadaestado = "Agente em pausa";

      this.verificapausa = this.verificapausa + 1;
      //console.log("numero da pausa:", this.verificapausa);
      this.sepausado();
      this.ligacao = 3;
      console.log('eu sou o verificapausa',this.verificapausa)

      if(this.verificapausa == 1){
        let c = await api.get(
        `/logspausar/${ramalnum}/${pinpausar}/${fila}`
      );
      console.log(c);

      let d = await api.get(
        `/logspausarcomg/${ramalnum}/${pinpausar}/${fila}`
      );
      console.log(d);
      }
     
    },

    logpausar: async function () {
      let a = await api.get(`/pinpausar/${this.pin}`);

      let agente = a.data.dados;
      //console.log(agente)
      let ramal;
      let fila;
      let pinpausar;
      agente.forEach((d) => {
        ramal = d.ramal;

        return ramal;
      });
      let ramalnum = ramal.replace(/[^\d]+/g, "");
      agente.forEach((d) => {
        fila = d.fila;

        return fila;
      });

      agente.forEach((d) => {
        pinpausar = d.pin;

        return pinpausar;
      });
     console.log(ramalnum)
      let updateP = await api.get(
        `/pausarestadoget/${pinpausar}`
      );
      console.log(updateP);
    },

    despausar: async function () {
      let a = await api.get(`/pinpausar/${this.pin}`);

      let agente = a.data.dados;
      //console.log(agente)
      let ramal;
      let fila;
      let pinpausar;
      agente.forEach((d) => {
        ramal = d.ramal;

        return ramal;
      });
      let ramalnum = ramal.replace(/[^\d]+/g, "");
      agente.forEach((d) => {
        fila = d.fila;

        return fila;
      });

      agente.forEach((d) => {
        pinpausar = d.pin;

        return pinpausar;
      });

      //console.log(ramalnum, pinpausar ,fila)

      let b = await api.get(
        `/despausarpainel/${ramalnum}/${pinpausar}/${fila}`
      );
      console.log(b);

      let c = await api.get(
        `/logsdespausar/${ramalnum}/${pinpausar}/${fila}`
      );
      console.log(c)

      let t = await api.get(
        `/logsdespausarcomg/${pinpausar}/`
      );

      console.log(t)
      let update = await api.get(
        `/despausarestadoget/${pinpausar}`
      );
      console.log(update);
      this.estado = "callcenter-estado-ocioso";
    },

    sair: async function () {
      let a = await api.get(
        `/pindeslogar/${this.pinSai}/${this.$store.state.usuario.ramal}`
      );
      let agente = a.data.dados;
      //console.log(agente)
      let ramal;
      let fila;
      let pindeslogar;
      agente.forEach((d) => {
        ramal = d.ramal;

        return ramal;
      });
      let ramalnum = ramal.replace(/[^\d]+/g, "");
      agente.forEach((d) => {
        fila = d.fila;

        return fila;
      });

      agente.forEach((d) => {
        pindeslogar = d.pin;

        return pindeslogar;
      });

      //console.log(ramalnum, pindeslogar ,fila)

      let b = await api.get(
        `/deslogarpainel/${ramalnum}/${pindeslogar}/${fila}`
      );
      console.log(b);

      let c = await api.get(
        `/logsdeslogarget/${ramalnum}/${pindeslogar}/${fila}`
      );
      console.log(c)
      let update = await api.get(
        `/deslogaestadoget/${pindeslogar}`
      );
      console.log(update);

      this.$router.push("loginagente");
    },
    close() {
      this.dialog = false;
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
    },
  },

  components: {
    Navbar2,
    Footer,
  },
};
</script>

<style scoped>
#botao {
  margin-left: 1% !important;
}

#callcenter-area-principal {
  left: 0;
  right: 0;
  margin-left: -20%;
  margin-right: -20%;
  padding: 0;
}
#callcenter-llamada-paneles-izq {
  width: 100%;
}
#callcenter-wrap {
  height: 0%;
}
#callcenter-wrap {
  height: 0%;
  border-radius: 15px;
  margin-top: -30px;
  background-color: #243e57;
}
.formSemChamada {
  visibility: hidden;
}
#callcenter-titulo-consola {
  position: relative;
  left: 0;
  right: 0;
  top: -10px;
  width: 100%;
  height: 18pt;
  padding: 0 0 0 0;
}
#callcenter-estado-agente {
  position: relative;
  left: 0;
  width: 100%;
  height: 35px;
  border-radius: 1px;
  padding: 0 0 0 0;
  font-size: 1.3em;
  color: #ffffff;
  font-weight: bold;
}
#callcenter-estado-agente-texto {
  position: absolute;
  top: 3px;
  left: 38px;
  padding: 0;
}

#callcenter-cronometro {
  position: absolute;
  top: 7px;
  right: 20px;
  padding: 0;
  /*esse aqui*/
}
#callcenter-wrap {
  height: 0%;
}
#callcenter-controles {
  width: 100%;
  position: absolute;
  padding: 3pt;
  left: 6px;
  top: 35px;
  right: 0;
  height: 22pt;
  display: table;
}
#callcenter-contenido {
  position: absolute;
  padding: 0;

  left: 0;
  right: 0;
  bottom: 0;
  top: 47pt;
}
#callcenter-cejillas-contenido {
  position: absolute;
  left: 0;
  top: 150px;
  right: 0;
  bottom: 23px;
  padding: 0;
  overflow: auto;
}
#callcenter-cejillas-contenido label {
  font-weight: bold;
}
.callcenter-barra-llamada {
  padding: 0;
  display: inline-block;
}

#callcenter-llamada-paneles {
  position: relative;
  height: 92%;
  padding: 0;
}
#callcenter-llamada-paneles > div {
  position: relative;
}
#callcenter-llamada-paneles > div fieldset {
  margin: 0;
  padding-top: 1.25em;
  padding-bottom: 0.5em;
  padding-left: 0.5em;
  padding-right: 0.5em;
}
#callcenter-llamada-paneles > div#callcenter-llamada-paneles-izq > div {
}
#callcenter-llamada-paneles-izq {
  position: absolute;
  margin: 0px;
  /* margin-right: 2px; */
  inset: 0px 0px 0px 306px;
  height: 457px;
  width: 100%;
  z-index: 0;
  display: block;
  visibility: visible;
}
#callcenter-llamada-paneles > div > fieldset,
#callcenter-llamada-paneles
  > div#callcenter-llamada-paneles-izq
  > div
  > fieldset {
  position: absolute;
  top: 0.25em;
  bottom: 0.5em;
  left: 0.5em;
  right: 0.5em;
}
#callcenter-llamada-paneles > div > fieldset > div,
#callcenter-llamada-paneles
  > div#callcenter-llamada-paneles-izq
  > div
  > fieldset
  > div {
  overflow: auto;
  position: absolute;
  top: 1.25em;
  bottom: 0.5em;
  left: 0.5em;
  right: 0.5em;
}
#callcenter-llamada-script {
  overflow: scroll !important;
}
#callcenter-llamada-paneles > div > fieldset,
#callcenter-llamada-paneles
  > div#callcenter-llamada-paneles-izq
  > div
  > fieldset {
  position: absolute;
  top: 0.25em;
  bottom: 0.5em;
  left: 0.5em;
  right: 0.5em;
}
#linha {
  position: absolute;
  margin: 0px;
  height: 380%;
  width: 100%;

  display: block;
  visibility: visible;
}
.ui-layout-pane-center {
  position: absolute;
  margin: 0px;
  height: 457px;
  width: 100%;
  display: block;
  visibility: visible;
}
.ui-layout-content {
  padding: 10px;
  position: relative; /* contain floated or positioned elements */
  overflow: auto; /* add scrolling to content-div */
}
.ui-layout-resizer {
  /* all 'resizer-bars' */
  background: #ddd;
  border: 1px solid #bbb;
  border-width: 0;
}
.ui-layout-resizer-dragging {
  /* resizer beging 'dragging' */
  background: #c4e1a4;
}
.ui-layout-resizer-dragging {
  /* CLONED resizer being dragged */
  border: 1px solid #bbb;
}
.ui-layout-resizer-north-dragging,
.ui-layout-resizer-south-dragging {
  border-width: 1px 0;
}
.ui-layout-resizer-west-dragging,
.ui-layout-resizer-east-dragging {
  border-width: 0 1px;
}
.ui-layout-resizer-dragging-limit {
  /* CLONED resizer at min or max size-limit */
  background: #e1a4a4; /* red */
}
.ui-layout-resizer-closed-hover {
  /* hover-color to 'slide open' */
  background: #ebd5aa;
}
.ui-layout-resizer-sliding {
  /* resizer when pane is 'slid open' */
  opacity: 0.1; /* show only a slight shadow */
  filter: alpha(opacity=10);
}
.ui-layout-resizer-sliding-hover {
  /* sliding resizer - hover */
  opacity: 1; /* on-hover, show the resizer-bar normally */
  filter: alpha(opacity=100);
}
.ui-layout-resizer-north-sliding-hover {
  border-bottom-width: 1px;
}
.ui-layout-resizer-south-sliding-hover {
  border-top-width: 1px;
}
.ui-layout-resizer-west-sliding-hover {
  border-right-width: 1px;
}
.ui-layout-resizer-east-sliding-hover {
  border-left-width: 1px;
}
.ui-layout-resizer-hover .ui-layout-toggler {
  opacity: 0.6;
  filter: alpha(opacity=60);
}
.formulario-sem-chamada {
  visibility: hidden;
}
.Salvar-sem-liga {
  display: hidden;
}
.formulario-com-chamada {
  visibility: visible;
}

.callcenter-estado-ocioso {
  background: linear-gradient(#243e57, #5572b5);
}
.callcenter-estado-espera {
  background: linear-gradient(#512457, #b61493);
}
.callcenter-estado-ativo {
  background: linear-gradient(#24572b, #3da733);
}
.callcenter-estado-pausa {
  background: linear-gradient(#572424, #e41f1f);
}
</style>

