<template>
  <div id="app" style="">
    <v-app style="">

      <br>
      <v-navigation-drawer app color="rgb(221 221 221)" class="sidebar">

        <v-img src="../assets/ruiva.jpg" class="avatar"></v-img>
        <br>
        <v-row>

          <v-icon @click="b = true" class="imageIcon" style="left: 76%;font-size: 169%;">
            mdi-cog
          </v-icon>



        </v-row>
        <v-list dense>
          <br>
          <v-list-item-group v-model="selectedContact">
            <v-list-item v-for="(contact, index) in contacts" :key="index">
              <v-list-item-content>
                <v-list-item-title class="sidebar" @click="selectContact(contact.telefone)">
                  <v-icon style="color: black; font-size: 35px;">mdi-account-circle</v-icon>
                  {{ contact.nome }} <v-icon
                    :style="{ color: contact.estado === 'mdi-checkbox-marked-circle-outline' ? '#8bff9a' : contact.estado === 'mdi-cancel' ? 'red' : 'black' }">
                    {{ contact.estado }}
                  </v-icon>

                  <v-icon v-if="contact.estadomsg === 'novamsg'" color="#25D366"
                    style="font-size: 15px;">mdi-checkbox-blank-circle
                  </v-icon>

                </v-list-item-title>
              </v-list-item-content>
            </v-list-item>
          </v-list-item-group>
        </v-list>
        <router-link to="/">
          <v-icon @click="a = true" class="imageIcon" style="left: 20px !important">
            mdi-keyboard-return</v-icon>
        </router-link>
      </v-navigation-drawer>

      <img src="../assets/PlugPhoneCentro.png" class="plugPhone" />

      <v-main style="padding: 0px; ">
        <v-container fluid>
          <v-row style="margin-right: 25%;">
            <v-col cols="12" md="12" style="padding: 0%;">
              <div class="messages" ref="messages" style="margin-bottom: -65px;     margin-left: 3%;">
                <div v-for="(message, index) in messages" :key="'server-' + index" :class="{
                  'message-requester': !message.sender.includes('-Meso'),
                  'message-agent': message.sender.includes('-Meso'),
                }">
                  <button :class="{
                    buttonSender: !message.sender.includes('-Meso'),
                    button: message.sender.includes('-Meso'),
                  }" :style="{
                      'text-align': message.sender.includes('-Meso') ? 'end' : 'start',
                    }">
                    <span :class="{
                      tituloSender: !message.sender.includes('-Meso'),
                      titulo: message.sender.includes('-Meso'),
                    }">
                      <b>{{ message.sender }}:</b><br />
                    </span>
                    <span class="message-text">
                      <span v-if="message.isImage">
                        <img :src="message.text" alt="Imagem" style="max-width: 100%; height: auto;">
                        <br>
                        <data style="font-size: 12px; color: #ffffff">{{ message.datetime }}</data>

                      </span>
                      <span v-else-if="message.isAudio">
                        <audio controls>
                          <source :src="message.text" type="audio/mpeg" />
                          Seu navegador não suporta o elemento de áudio.
                        </audio>
                      </span>
                      <span v-else>
                        {{ message.text }} <br>
                        <data style="font-size: 12px; color: #ffffff">{{ message.datetime }}</data>
                      </span>
                    </span>



                  </button>
                </div>
              </div>
            </v-col>
          </v-row>
        </v-container>
      </v-main>
      <div class="info" style="background-color: #ffffff !important;
    border-color: #ffffff !important;">
        <br>
        <v-btn class="infoBtn">Informações <v-icon @click="openDialogForm = true" style="left: 3%;">
            mdi-information
          </v-icon></v-btn>

        <v-data-table :items="dados" :items-per-page="1" style="        background: rgb(221, 221, 221);
      border-radius: 3%;
      position: fixed;
      bottom: 1%;
      width: 21%;
      right: 1%;
      border-style: inset;
      border-width: thin;
  
  
      height: 90%;" hide-default-footer class="responsive-table" item-class="custom-row">

          <template v-slot:item="{ item }">

            <div class="table-row">
              <div v-for="(header, index) in informacao" :key="index">
                <br> <strong>{{ header.text }}:<br></strong> {{ item[header.value] }}

              </div>

            </div>

          </template>

        </v-data-table>

      </div>

    </v-app>



    <img src="../assets/Logo_Meso_vetorizada.png" class="logo" />



    <div class="bottom-bar" style="width: 73%;padding-top: 5%;position: sticky;bottom: 0%;">
      <v-icon @click="openDialogAnexo = true" class="imageIcon" style="left: 5%;font-size: 169%;">
        mdi-paperclip
      </v-icon>
      <v-icon @click="openDialog1 = true" class="imageIcon" style="left: 5%;font-size: 169%;">
        mdi-microphone
      </v-icon>
      <v-icon @click="openDialog = true" class="imageIcon" style="left: 5%;font-size: 169%;">
        mdi-image
      </v-icon>
      <v-icon @click="openDialogForm = true" class="imageIcon" style="left: 5%;font-size: 169%;">
        mdi-emoticon
      </v-icon>
      <input type="text" v-model="newMessage" @keyup.enter="sendMessage" placeholder="Digite sua mensagem aqui..."
        class="input-message"
        style="left: 53px;bottom: 50%;width: 91%;border-radius: 1px;border-style: unset;border-bottom-style: solid;" />
      <v-icon @click="openDialogForm = true" class="imageIcon" style="left: 79%;font-size: 169%;"
        :disabled="tipo === 'Especialista'">
        mdi-format-list-bulleted
      </v-icon>


      <v-icon @click="openDialogConcluir = true" class="imageIcon" style="left: 80%" :disabled="tipo === 'Analista'">
        mdi-checkbox-marked-circle</v-icon>

      <!-- <v-icon @click="openDialog = true" class="imageIcon" style="left: 94%">mdi-image</v-icon>-->

      <v-dialog v-model="openDialog" max-width="500px" persistent>
        <v-card class="dialogo">
          <v-card-title>Seu Diálogo</v-card-title>
          <v-card-text>
            <v-file-input v-model="selectedFile" label="Escolha uma imagem"></v-file-input>
          </v-card-text>
          <v-row class="linhaBtn">
            <v-card-actions>
              <v-btn color="primary" @click="uploadImage">Enviar</v-btn>
            </v-card-actions>
            <v-card-actions>
              <v-btn color="primary" @click="openDialog = false">Fechar</v-btn>
            </v-card-actions>
          </v-row>
        </v-card>
      </v-dialog>


      <!--<v-icon @click="openDialog = true" class="imageIcon" style="left: 95%">mdi-image</v-icon>  -->


      <v-dialog v-model="openDialog1" max-width="500px" persistent>
        <v-card class="dialogo1">
          <v-card-title>Grave seu áudio</v-card-title>
          <v-card-text>
            <v-btn @click="startRecording" :disabled="isRecording" class="btnAudio">
              Iniciar Gravação <v-icon>mdi-play</v-icon>
            </v-btn>
            <v-btn @click="stopRecording" :disabled="!isRecording" class="btnAudioStop">
              Parar Gravação <v-icon>mdi-stop</v-icon>
            </v-btn>
            <audio v-if="audioUrl" :src="audioUrl" controls></audio>
          </v-card-text>
          <v-row class="linhaBtn">
            <v-card-actions>
              <v-btn color="primary" @click="uploadAudio">Enviar</v-btn>
            </v-card-actions>
            <v-card-actions>
              <v-btn color="primary" @click="openDialog1 = false">Fechar</v-btn>
            </v-card-actions>
          </v-row>
        </v-card>
      </v-dialog>

      <v-dialog v-model="openDialogAnexo" max-width="500px" persistent>
        <v-card class="dialogo">
          <v-card-title>Seu Diálogo</v-card-title>
          <v-card-text>
            <v-file-input v-model="selectedFile" label="Escolha uma imagem"></v-file-input>
          </v-card-text>
          <v-row class="linhaBtn">
            <v-card-actions>
              <v-btn color="primary" @click="uploadDocument">Enviar</v-btn>
            </v-card-actions>
            <v-card-actions>
              <v-btn color="primary" @click="openDialogAnexo = false">Fechar</v-btn>
            </v-card-actions>
          </v-row>
        </v-card>
      </v-dialog>


      <v-dialog v-model="openDialog2" max-width="700px">
        <v-card class="dialogoZap">
          <v-card-title>Qual a forma que deseja entrar em contato</v-card-title>
          <br>
          <v-row style="width: 100%;">
            <input type="date" class="datest" v-model="d1" required />

            <!--Saída do Período da API-->
            <input type="date" class="datest" v-model="d2" required style="margin-left: 1% !important;" />
            <v-select :items="protocoloArray" :prepend-icon="edit" label="Protocolo de Atendimento"
              v-model="protocoSelecionado" class="protocolo"></v-select>
            <br>

            <br>
          </v-row>
          <br>
          <v-btn @click="filtrar(), sendTemplate(), openDialog2 = false" class="filtrar">
            Filtrar
          </v-btn>






          <v-card-text>
            <v-row class="linhaContato">

              <v-btn @click="populaOportunidade(whatsapp), sendTemplate(), openDialog2 = false" class="btnAudio">
                <v-icon style="    font-size: 45px;">mdi-whatsapp</v-icon>
              </v-btn>
              <v-btn @click="populaOportunidade(telefone), openDialogLigacao = true, openDialog2 = false"
                class="btnCall">
                <v-icon style="font-size: 45px;">mdi-phone</v-icon>
              </v-btn>
              <audio v-if="audioUrl" :src="audioUrl" controls></audio>
            </v-row>
          </v-card-text>

        </v-card>
      </v-dialog>
      <v-dialog v-if="tipo === 'Analista'" v-model="openDialogLigacao" max-width="500px" persistent>
        <v-card class="dialogo1">
          <v-card-title>Por favor digite seu Ramal</v-card-title>
          <v-card-text>
            <v-text-field v-model="ramal" label="Ramal" @keyup.enter="Ligar"
              placeholder="Digite seu ramal"></v-text-field>
          </v-card-text>

          <v-row class="linhaBtn">
            <v-card-actions>
              <v-btn @click="ligar(), openDialogForm = true" class="btnCall">
                Ligar <v-icon>mdi-phone</v-icon>
              </v-btn>
            </v-card-actions>
            <v-card-actions>
              <v-btn color="primary" @click="openDialog1 = false">Fechar</v-btn>
            </v-card-actions>
          </v-row>
        </v-card>
      </v-dialog>

      <v-dialog v-model="openDialogConcluir" max-width="500px" persistent>
        <v-card class="dialogoZap">
          <v-card-title>Como foi a conclusão do atendimento</v-card-title>
          <br>



          <v-card-text>
            <v-row class="linhaContatoConcluir">

              <v-btn @click="finalizar(finaliza = true), openDialogConcluir = false" class="btnAudio"
                v-model="finaliza">
                Aprovar! <v-icon> mdi-checkbox-marked-circle-outline</v-icon>

              </v-btn>
              <v-btn @click="finalizar(finaliza = false), openDialogConcluir = false" class="btnAudioStop">
                Reprovar <v-icon> mdi-cancel</v-icon>
              </v-btn>
              <audio v-if="audioUrl" :src="audioUrl" controls></audio>
            </v-row>


            <br>

          </v-card-text>

        </v-card>

      </v-dialog>

      <v-dialog v-model="openDialogConcluir" max-width="500px" persistent>
        <v-card class="dialogoZap">
          <v-card-title>Deseja concluir o atendimento?</v-card-title>
          <br>



          <v-card-text>
            <v-row class="linhaContatoConcluir">

              <v-btn @click="finalizar(finaliza = true), openDialogConcluir = false" class="btnAudio"
                v-model="finaliza">
                Sim! <v-icon> mdi-checkbox-marked-circle-outline</v-icon>

              </v-btn>
              <v-btn @click=" openDialogConcluir = false" class="btnAudioStop">
                Não <v-icon> mdi-cancel</v-icon>
              </v-btn>
              <audio v-if="audioUrl" :src="audioUrl" controls></audio>
            </v-row>

            <br>

          </v-card-text>

        </v-card>

      </v-dialog>

      <v-dialog v-model="openDialogForm" max-width="500px" persistent>
        <v-card>
          <v-card-title>Feedback do Cliente</v-card-title>
          <v-card-text>
            <v-checkbox v-model="atendeu">

            </v-checkbox>
            <v-text style="
      color: black;
      position: absolute;
      font-size: 15px;
      margin-left: 35px;
      margin-top: -9%;
  "><b>O cliente atendeu a tentativa de contato?
              </b></v-text>

            <v-checkbox v-model="reagendar">

            </v-checkbox>
            <v-text style="
      color: black;
      position: absolute;
      font-size: 15px;
      margin-left: 35px;
      margin-top: -9%;
  "><b>Caso não tenha atendido, tem interesse em reagendar?
              </b></v-text>
            <v-checkbox v-model="interesse">

            </v-checkbox>
            <v-text style="
          color: black;
          position: absolute;
          font-size: 15px;
          margin-left: 35px;
          margin-top: -9%;
      "><b>O cliente tem interesse na proposta oferecida?

              </b></v-text>

            <v-checkbox v-model="negociar">

            </v-checkbox>
            <v-text style="
              color: black;
              position: absolute;
              font-size: 15px;
              margin-left: 35px;
              margin-top: -9%;
          "><b>Caso não tenha, tem interesse em negociar?
              </b></v-text>
            <v-text-field v-model="observacao" label="Observação"></v-text-field>
          </v-card-text>
          <v-card-actions>
            <v-btn @click="enviarMealing()" color="primary">Enviar</v-btn>
            <v-btn @click="openDialogForm = false" color="error">Cancelar</v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </div>
  </div>
</template>

<script>
import { api } from "@/conf/api";
import lamejs from 'lamejs';
import { apiWP } from "@/conf/apiWP";
import RecordRTC from 'recordrtc';
import io from 'socket.io-client';
import Navbar from "../components/Navbar.vue";



// Certifique-se de incluir o script libmp3lame.js no seu projeto e carregá-lo corretamente.

export default {
  name: "HelloView",
  async beforeMount() {

    this.buscaCidadao();
    this.funcTokenFirebase();
    let usuario = JSON.parse(localStorage.getItem('usu'));
    this.tipo = usuario.tipo;
    this.usuario = usuario.usuario + "-Meso"
    this.idsetinterval = setInterval(() => this.buscarContato(), 5000);

    this.buscarContato();
    //this.idsetinterval = setInterval(async () => await this.buscarContato(), 7000);


  },

  async beforeDestroy() {
    console.log("eu sou idsetinterval", this.idsetinterval);
    clearInterval(this.idsetinterval);
    this.idsetinterval = 0;
  },

  data() {
    return {
      headers: [
        {
          text: 'ano',
          align: 'start',
          sortable: false,
          value: 'ano',
        },
        { text: 'orgao', value: 'orgao' },

        { text: 'liquidação', value: 'liguidacao' },
        { text: 'valor da face', value: 'valor_da_face' },
        { text: 'credor', value: 'credor' },
        { text: 'documento', value: 'documento' },
        { text: 'idade', value: 'idade' },
        { text: 'tipo', value: 'tipo' },
        { text: 'telefone', value: 'telefone' },
      ],
      informacao: [
        {
          text: 'Nome',
          align: 'start',
          sortable: false,
          value: 'credor',
        },
        { text: 'Telefone', value: 'telefone' },
        { text: 'Idade', value: 'idade' },
        { text: 'CPF', value: 'documento' },
        { text: 'Renda', value: 'renda' },
      ],
      messages: [],
      openDialogConcluir: false,
      observacao: "",
      protocoloArray: [],
      idsetinterval: null,
      name: "menu_plugphone",
      wppnum: "",
      ramal: "",
      protocoSelecionado: "",
      plataforma: "",
      d1: "",
      d2: "",
      openDialog: false,
      openDialogAnexo: false,
      openDialog1: false,
      openDialog2: false,
      openDialogLigacao: false,
      openDialogForm: false,
      tipo: null,
      selectedFile: null,
      whatsapp: "whatsapp",
      telefone: "telefone",
      finaliza: false,

      socket: "",
      usuario: "",
      newMessage: "",
      audioBlob: "",
      contacts: [],
      dados: [],
      dados2: [],
      uploadDocument: null,
      selectedContact: null,
      link: " ",
      id: " ",
      isRecording: false,
      audioUrl: null,
      recorder: null,
      atendeu: false,
      reagendar: false,
      interesse: false,
      negociar: false
    };
  },
  created() {
    this.socket = io('https://whatsapp.sicoob.plugphone.cloud:3000');

    // Evento para mensagens de texto
    /* this.socket.on('chat message', (nome, msg) => {
       this.messages.push({ text: msg, sender: nome });
     });*/

    // Evento para imagens
    this.socket.on('chat message', async (nome, msg, telefone) => {
      if (telefone == this.wppnum) {
        this.messages.push({ text: msg, sender: nome });
        console.log('recebi!', telefone, this.wppnum)
        this.playSound()
        this.lido(telefone)
        let a = await api.get(`/whatsapp/lidamsg/${this.wppnum}`,);
        console.log(a)
      } else {
        this.playSound()
        console.log('foi aqui não my badkkkkkkkkk')
        this.mudaEstado(telefone)
      }

    });

    this.socket.on('chat image', async (nome, base64Image, telefone) => {
      console.log('eu sou o telefone', telefone)

      console.log("Imagem recebida em Base64:", base64Image);
      if (telefone == this.wppnum) {
        console.log('EU TO AQUIIIIIIIIIIIIIIIIIIIIIIIIII')
        // Verifique se base64Image está no formato correto
        if (base64Image.startsWith('data:image')) {
          const imageUrl = base64Image; // Usa a imagem diretamente como URL

          console.log("URL da imagem gerada:", imageUrl);

          // Teste abrindo em uma nova aba
          //window.open(imageUrl, '_blank');
          this.playSound()
          this.lido(telefone)
          let a = await api.get(`/whatsapp/lidamsg/${this.wppnum}`,);
          console.log(a)

          this.messages.push({
            text: imageUrl,
            isImage: true,
            sender: nome,
            datetime: new Date().toLocaleString()
          });
        } else {
          console.error("Formato de imagem inválido ou Base64 ausente.");
        }


      } else {
        this.playSound()
        console.log('foi aqui não my badkkkkkkkkk')
        this.mudaEstado(telefone)
      }
    }
    );



    this.socket.on('chat audio', async (nome, base64Audio, telefone) => {
      console.log("audio recebida em Base64:", base64Audio);
      if (telefone == this.wppnum) {
        console.log('EU TO AQUIIIIIIIIIIIIIIIIIIIIIIIIII')
        // Verifique se base64Image está no formato correto
        // Verifique se base64Audio está no formato correto
        if (base64Audio.startsWith('data:audio')) {
          const audioUrl = base64Audio; // Usa a audio diretamente como URL

          console.log("URL da audio gerada:", audioUrl);

          // Teste abrindo em uma nova aba
          //window.open(audioUrl, '_blank');
          this.playSound()
          this.lido(telefone)
          let a = await api.get(`/whatsapp/lidamsg/${this.wppnum}`,);
          console.log(a)
          this.messages.push({
            text: audioUrl,
            isAudio: true,
            sender: nome,
            datetime: new Date().toLocaleString()
          });
        } else {
          console.error("Formato de imagem inválido ou Base64 ausente.");
        }

      } else {
        this.playSound()
        console.log('foi aqui não my badkkkkkkkkk')
        this.mudaEstado(telefone)
      }
    }

    )
  },


  comments: {
    Navbar
  },
  methods: {

    async buscaProtocolo(telefone) {
      console.log('eita', telefone)
      let a = await apiWP.get(`/listaprotocolo/${telefone}`)
      console.log('copo de café', a)
      let protocolo = a.data.dados

      protocolo.forEach(e => {
        this.protocoloArray.push(e.protocolo)
      });

      console.log('cafezin dahora', this.protocoloArray)
    },
    async filtrar() {
      this.messages = []

      try {
        let receivedMessages = [];
        console.log('MAIS FACIL DE ACHAR', this.usuario);

        // Obter mensagens do servidor
        let a = await api.get(`/whatsapp/lidamsg/${this.wppnum}`);
        console.log('eu sou o A Só que lido kkkkkkk', a);

        console.log('eu sou o selected contact do receiveMessage', this.selectedContact, this.wppnum);

        let msg = this.d1 !== '' && this.d2 !== '' ? { telefone: this.wppnum, data1: this.d1, data2: this.d2 } : { telefone: this.wppnum, protocolo: this.protocoSelecionado };
        console.log('eu sou o wppnum', this.wppnum);
        this.buscarCliente();

        let response = await api.post("/whatsapp/reciveMsgFiltrado", msg);
        receivedMessages = response.data.dados;

        console.log('Mensagens recebidas:', receivedMessages); // Verifique todas as mensagens

        // Armazena todas as mensagens temporariamente antes de adicionar ao chat
        let allMessages = [];

        for (let message of receivedMessages) {
          console.log('Mensagem:', message); // Verifique cada mensagem

          if (message.type === 'image') {
            // Processa imagens
            try {
              let imageResponse = await api.get(`/whatsapp/get-image/${message.mensagem}`, { responseType: 'blob' });
              let imageUrl = URL.createObjectURL(imageResponse.data);
              allMessages.push({ text: imageUrl, datetime: message.datetime, sender: message.nome, isImage: true });
            } catch (err) {
              console.error('Erro ao buscar imagem:', err);
            }
          } else if (message.type === 'audio' || message.mensagem.endsWith('.mp3')) {
            console.log('Processando áudio...');
            try {
              let audioResponse = await api.get(`/whatsapp/get-audio/${message.mensagem}`, { responseType: 'blob' });
              let audioUrl = URL.createObjectURL(audioResponse.data);
              allMessages.push({ text: audioUrl, datetime: message.datetime, sender: message.nome, isAudio: true });
            } catch (err) {
              console.error('Erro ao buscar áudio:', err);
            }
          } else {
            allMessages.push({ text: message.mensagem, datetime: message.datetime, sender: message.nome, isImage: false, isAudio: false });
          }
        }

        console.log(allMessages);

        // Adiciona todas as mensagens ao estado de uma só vez
        this.messages.push(...allMessages);
      } catch (error) {
        console.error('Erro ao filtrar mensagens:', error);
      }
    },

    /*
    async finalizar(finaliza) {
      console.log('finaliza', finaliza)
 
 
 
 
      if (finaliza == true) {
 
        
 
      } else {
 
        // console.log(response)
        location.reload()
 
      }
    },
*/
    async mudaEstado(telefone) {
      let a = await api.get(
        `/whatsapp/mudamsg/${telefone}`
      );

      console.log('eu sou o A', a)
    },

    async lido(telefone) {
      let a = await api.get(
        `/whatsapp/lidamsg/${telefone}`
      );

      console.log('eu sou o A', a)
    },

    async populaOportunidade(plataforma) {
      console.log("eu sou", this.usuario)


      this.plataforma = plataforma


      if (this.tipo == 'Analista') {




        let msg = {
          to: this.wppnum,
          name: this.name,
          usuario: this.usuario
        };
        let template = await api.post("/whatsapp/sendtemplate", msg);

        console.log(template)

      } else {

        let msg = {
          name: this.name,
          to: this.wppnum,
          usuario: this.usuario

        };
        let template = await api.post("/whatsapp/sendtemplate", msg);

        console.log(template)

      }




      //console.log(response)

    },

    async receiveMessage() {
      console.log('MAIS FACIL DE ACHAR', this.usuario);

      let a = await api.get(`/whatsapp/lidamsg/${this.wppnum}`,);

      console.log('eu sou o A Só que lido kkkkkkk', a)

      console.log('eu sou o selected contact do receiveMessage', this.selectedContact, this.wppnum);

      let msg = { telefone: this.wppnum };
      console.log('eu sou o wppnum', this.wppnum);
      this.buscarCliente();

      let response = await api.post("/whatsapp/reciveMsg", msg);
      let receivedMessages = response.data.dados;

      console.log('Mensagens recebidas:', receivedMessages); // Verifique todas as mensagens

      // Armazena todas as mensagens temporariamente antes de adicionar ao chat
      let allMessages = [];

      for (let message of receivedMessages) {
        console.log('Mensagem:', message); // Verifique cada mensagem

        if (message.type === 'image') {
          // Processa imagens
          try {
            let imageResponse = await api.get(`/whatsapp/get-image/${message.mensagem}`, { responseType: 'blob' });
            let imageUrl = URL.createObjectURL(imageResponse.data);
            allMessages.push({ text: imageUrl, datetime: message.datetime, sender: message.nome, isImage: true });
          } catch (err) {
            console.error('Erro ao buscar imagem:', err);
          }
        } else if (message.type === 'audio' || message.mensagem.endsWith('.mp3')) {
          console.log('Processando áudio...');
          try {
            let audioResponse = await api.get(`/whatsapp/get-audio/${message.mensagem}`, { responseType: 'blob' });
            let audioUrl = URL.createObjectURL(audioResponse.data);
            allMessages.push({ text: audioUrl, datetime: message.datetime, sender: message.nome, isAudio: true });
          } catch (err) {
            console.error('Erro ao buscar áudio:', err);
          }
        } else {
          allMessages.push({ text: message.mensagem, datetime: message.datetime, sender: message.nome, isImage: false, isAudio: false });
        }


      }
      console.log(allMessages)

      // Adiciona todas as mensagens ao estado de uma só vez
      this.messages.push(...allMessages);
    }
    ,



    playSound() {

      var audio = new Audio(require('../../src/audios/notify.wav'));
      setTimeout(function () {
        audio.play();
      }, 1000);

    },

    async sendTemplate() {

      let msg = {
        to: this.wppnum,
        name: this.name,
        usuario: this.usuario


      };
      let template = await api.post("/whatsapp/sendtemplate", msg);

      console.log(template)
    },
    async enviarMealing() {
      this.openDialogLigacao = false
      let atendeu
      let reagendar
      let interesse
      let negociar

      if (this.atendeu == true) {
        atendeu = "sim"
        console.log(atendeu)
      } else {
        atendeu = "nao"
      }

      if (this.reagendar == true) {
        reagendar = "sim"
        console.log(reagendar)
      } else {
        reagendar = "nao"
      }


      if (this.interesse == true) {
        interesse = "sim"
        console.log(interesse)
      } else {
        interesse = "nao"
      }


      if (this.negociar == true) {
        negociar = "sim"
        console.log(negociar)
      } else {
        negociar = "nao"
      }


      this.contact = []



      //console.log(a)

      this.openDialogForm = false

      location.reload()
    },
    selectContact(contact) {
      this.openDialog2 = true
      console.log('eu sou o contact', this.contact)
      this.messages = [];
      this.selectedContact = contact;
      this.wppnum = this.selectedContact;
      this.receiveMessage();
      this.buscaProtocolo(this.wppnum)
    },
    async startRecording() {
      try {
        const stream = await navigator.mediaDevices.getUserMedia({ audio: true });
        this.recorder = new RecordRTC(stream, {
          type: 'audio',
          mimeType: 'audio/mp3',  // Definir o tipo MIME como áudio MP3
          recorderType: RecordRTC.StereoAudioRecorder,
          desiredSampRate: 16000,
          audioBitsPerSecond: 128000,
          numberOfAudioChannels: 1,
          bufferSize: 16384,
          sampleRate: 44100,
          frameRate: 20000,
        });
        this.recorder.startRecording();
        this.isRecording = true;
      } catch (error) {
        console.error('Error accessing microphone', error);
      }
    },

    stopRecording() {
      this.recorder.stopRecording(() => {
        this.audioBlob = this.recorder.getBlob();

        // Verifique o tipo de arquivo
        if (this.audioBlob.type !== 'audio/mpeg') {
          console.warn('O áudio não está no formato MP3, ele será enviado como WAV');
        }

        this.audioUrl = URL.createObjectURL(this.audioBlob);
        this.isRecording = false;
      });
    },
    async uploadAudio() {
      if (!this.audioBlob) {
        console.error("Nenhum áudio selecionado");
        return;
      }

      try {
        // Converte o áudio para Int16Array
        const audioContext = new (window.AudioContext || window.webkitAudioContext)();
        const audioBuffer = await audioContext.decodeAudioData(await this.audioBlob.arrayBuffer());
        const audioData = audioBuffer.getChannelData(0); // Usa o canal esquerdo
        const audioDataInt16 = new Int16Array(audioData.length);

        // Converte para formato Int16
        for (let i = 0; i < audioData.length; i++) {
          audioDataInt16[i] = Math.max(-1, Math.min(1, audioData[i])) < 0
            ? audioData[i] * 0x8000
            : audioData[i] * 0x7FFF;
        }

        // Configuração do encoder MP3
        const mp3Encoder = new lamejs.Mp3Encoder(1, audioBuffer.sampleRate, 128); // 1 canal, taxa de amostragem, bitrate
        const mp3Data = [];
        const samplesPerFrame = 1152; // Frame size do MP3

        for (let i = 0; i < audioDataInt16.length; i += samplesPerFrame) {
          const chunk = audioDataInt16.subarray(i, i + samplesPerFrame);
          const mp3Chunk = mp3Encoder.encodeBuffer(chunk);
          if (mp3Chunk.length > 0) {
            mp3Data.push(mp3Chunk);
          }
        }

        const mp3End = mp3Encoder.flush();
        if (mp3End.length > 0) {
          mp3Data.push(mp3End);
        }

        // Cria o arquivo MP3 final
        const mp3Blob = new Blob(mp3Data, { type: "audio/mpeg" });

        const formData = new FormData();
        formData.append("audio", mp3Blob, "recording.mp3");

        // Faz upload do áudio
        const response = await apiWP.post("/upload-audio", formData, {
          headers: { "Content-Type": "multipart/form-data" },
        });

        console.log("Áudio enviado com sucesso:", response.data);

        let pegaId = response.data.id;

        let enviaAudio = {
          to: this.wppnum,
          id: pegaId,
          usuario: this.usuario
        };
        await apiWP.post("/sendAudio", enviaAudio);

        // Criar URL do Blob do áudio

        const audioUrl = URL.createObjectURL(mp3Blob);

        // Adiciona ao chat
        this.messages.push({
          text: audioUrl,
          datetime: new Date().toLocaleString(),
          sender: this.usuario,
          isAudio: true,
        });

        this.openDialog1 = false;
      } catch (error) {
        console.error("Erro ao enviar áudio:", error);
        this.openDialog1 = false;
      }
    },


    async funcTokenFirebase() {
      let usuario = JSON.parse(localStorage.getItem('usu'))
      console.log("tô jogando com carro no LOL", usuario)
      this.token = usuario.tokenFirebase
      let nome = usuario.usuario
      let token = usuario.tokenFirebase
      console.log("Vou enviar o token", token, "para o ", nome)
      console.log(token)
      console.log('que gemido foi esse?', this.token)
      let a = await apiWP.post('/whatsapp/registrar-token', { "usuario": nome + "-Meso", "token": token });
      console.log(a)
    },




    async sendMessage() {
      console.log('teste usuario aqui', this.usuario)
      if (this.newMessage.trim() !== "") {
        let msg = {
          to: this.wppnum,
          body: this.newMessage,
          nome: this.usuario
        };

        console.log('me de o CUBO', msg)
        this.messages.push({ text: this.newMessage, sender: this.usuario });
        await api.post("/whatsapp/send", msg);
        this.newMessage = "";
        this.$nextTick(() => {
          this.$refs.messages.scrollTop = this.$refs.messages.scrollHeight;
        });
      }
    },
    async buscaCidadao() {
      let usuario = JSON.parse(localStorage.getItem('usu'));
      console.log('eu sou o usuario', usuario)
      this.usuario = usuario.usuario + "-Meso"
      console.log('eu sou o this.usuario', this.usuario)

    },

    async buscarCliente() {
      let a = await api.get(`/buscarmealing/${this.wppnum}`);
      console.log('Vira lata Caramelo', a)
      this.dados = a.data.dados;
    },

    async ligar() {
      console.log('eu sou a função ligar', this.wppnum)
      let liga = await api.get(`/ligar/${this.ramal}/${this.wppnum}`);
      console.log('eou sou', liga)

    },

    async uploadImage() {
      if (!this.selectedFile) {
        console.error("Nenhuma imagem selecionada.");
        return;
      }

      const allowedTypes = ['image/jpeg', 'image/png', 'image/gif'];
      if (!allowedTypes.includes(this.selectedFile.type)) {
        console.error("O arquivo selecionado não é uma imagem.");
        return;
      }

      let formData = new FormData();
      formData.append("image", this.selectedFile, this.selectedFile.name);

      try {
        // Envia a imagem via POST
        let response = await apiWP.post("/upload-image", formData, {
          headers: { "Content-Type": "multipart/form-data" }
        });

        let pegaId = response.data.id;
        this.messages.push({ text: URL.createObjectURL(this.selectedFile), sender: this.usuario, isImage: true });

        // Envio da imagem via POST para o WhatsApp
        let enviaImg = {
          to: this.wppnum, id: pegaId, usuario: this.usuario
        };
        await api.post("/whatsapp/sendimage", enviaImg);

        // Recupera a URL da imagem
        let getURL = await api.get(`/whatsapp/pegaURL/${pegaId}`);
        console.log('URL AQUI', getURL.data);
        let imageURL = { "url": getURL.data.url, "id": pegaId };

        console.log('EU SOU O IMAGE URL ', imageURL)
        // Agora usamos o axios diretamente para fazer o GET na URL externa com os headers

        // Fazendo a requisição GET para a URL externa
        console.log('eu cheguei até aqui')
        let image = await api.post(`/whatsapp/geraImage/`, imageURL);
        console.log('eu sou a imagem', image);

        this.openDialog = false;
      } catch (error) {
        console.error("Erro ao enviar imagem:", error);
        this.messages.push({ text: "Erro ao enviar imagem.", sender: this.usuario });
        this.openDialog = false;
      }
    },





    async buscarContato() {
      this.contacts = []
      let contatos = await api.get(`/whatsapp/buscarcontatos/${this.tipo}`);
      let contatosArray = contatos.data.dados;
      console.log(contatosArray)
      contatosArray.forEach(e => {
        this.contacts.push({ nome: e.nome, telefone: e.telefone, estado: e.estado, estadomsg: e.estadomsg });

        //this.wppnum.push({telefone: e.Telefone})
        console.log(this.wppnum)
        console.log('eu sou os contatos :D', this.contacts)
      });

    },
    closeDialogConcluir() {
      this.openDialogConcluir = false
    },
    closeDialogAnexo() {
      this.openDialogAnexo = false
    }
  },
};
</script>


<style scoped>
.message {
  margin-bottom: -65px !important;
  padding: 5px;
  border-radius: 5px;
  width: 100%;
  word-wrap: break-word;
}

.message-requester {
  text-align: left;

  border: none;
  color: white;
  padding: 15px 32px;

  text-decoration: none;
  font-size: 16px;
}

.message-agent {
  text-align: right;

  border: none;
  color: white;
  padding: 15px 32px;

  text-decoration: none;
  font-size: 16px;
}

.input-message {
  width: calc(88% - 20px);
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 25px;
  outline: none;
  position: absolute;
  bottom: 0;
  left: 51px;

}

.sidebar {
  color: rgb(0, 0, 0);
  left: -6px;
  border-radius: 2%;
  width: 300px !important;



}

.bottom-bar {
  position: relative;
  margin-top: 64px;
  width: 100%;
  padding: 10px;
  background-color: #f0f0f0;
  box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.1);
}

.button {
  background-color: #075e54;
  /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: start;
  border-radius: 15px;

  display: inline-block;
  font-size: 16px;
}

.buttonSender {
  background-color: #25d366;
  /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: start;
  border-radius: 15px;

  display: inline-block;
  font-size: 16px;
}

.message-text {
  word-break: break-word;
}

.titulo {
  text-align: end;
}

.imageIcon {
  left: 91%;
  font-size: 25px;
  top: 3px;
}

.micIcon {
  left: 90%;
  font-size: 25px;
  top: 3px;
}

.imageIcon:hover {
  background-color: #b0b0b0;
  border-radius: 25%;
}

.micIcon:hover {
  background-color: #b0b0b0;
  border-radius: 25%;
}

.linhaBtn {
  width: 50%;
  margin-left: 3%;
}

.dialogo {
  height: 302px
}

.dialogo1 {
  height: 302px
}


.dialogoZap {}

.btnAudio {
  height: 55px !important;
  width: 25%;
  background-color: #65cf65 !important;
  color: rgb(255, 255, 255) !important
}

.btnAudioStop {
  left: 12% !important;
  background-color: #e74343 !important;
  color: white !important;

}

.btnCall {
  width: 25%;
  height: 55px !important;

  left: 12% !important;
  background-color: #6cbfff !important;
  color: white !important;

}

.btnCancel {
  left: 35% !important;
  margin-top: -10%;
  background-color: #6cbfff !important;
  color: white !important;


}

.linhaContato {
  margin: 10%;
  margin-left: 31%;
  margin-top: 5%;
}


.linhaContatoConcluir {
  margin: 12%;
  margin-left: 15%;
}

.plug {
  width: 59px;
  bottom: -56%;
  position: relative;
}

.tema {
  left: 94%;
  widows: 8%;
  text-decoration: bold;
  text-decoration: underline;
  position: fixed;
  background-color: #243e57 !important;
  color: white;
}

.info {
  background-color: #ffffff !important;
  border-color: #ffffff !important;
  width: 22%;
  position: fixed;
  right: 1%;

}

.v-application {
  background-color: #ffffff !important;
  border-color: #ffffff !important;
}

@media (max-width: 768px) {
  .info {
    width: 100%;
    position: static;
    right: 0;
    background-color: #ffffff !important;
    border-color: #ffffff !important;
  }
}

.responsive-table .v-data-table__wrapper {
  display: block;
}

.table-row {
  display: flex;
  flex-direction: column;
  padding: 10px;
  border-bottom: 1px solid #ccc;
}

@media (min-width: 769px) {
  .table-row {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
  }
}

.infoBtn {
  width: 21%;
  background-color: #dddddd;
  position: fixed;
  right: 1%;
  top: 1%;
}

.plug {
  width: 80px;
  left: 34%;
}

.avatar {
  width: 60%;
  border-radius: 100%;
  left: 15%;
  top: 2%;
}

.plugPhone {
  position: fixed;
  top: 21%;
  left: 35%;
  opacity: 30%;
  width: 33%;
}

.logo {
  width: 8%;
  right: 7%;
  position: fixed;
  bottom: 3%;
}

.datest {
  border-style: solid !important;
  display: inline;
  border-radius: 0% !important;
  margin-top: 19px;
  margin-bottom: 17px;
  width: 23%;
  margin-left: 3%;
  border-color: black;

}

.filtrar {
  left: 38%;
  width: 22%;
  color: white !important;
  background-color: #27435f !important;
}

.protocolo {
  margin-left: 3%;
  margin-right: 3%;
}
</style>