<template>
<div class="app">
  <div class="limiter">
    <Navbar2 />
  <div id="login1">

      
<img src="../assets/pp.png" alt="" style="width: 12%; margin-top: 1%; margin-left: 45%;">
      <v-form id="form">
        
              <router-link to="/loginCBView"><button class="trocar">login callback</button></router-link>
              <h2 class="title">Login no painel PlugPhone
              </h2>
              
              <label for="username">Código PIN</label>
              <div class="input">
                  <input id="Username"   v-model="itenslogin.pin" type="text">
              </div>
              <label for="Email">Fila de atendimento</label>
              
<v-select
          :items="Selfila"
          label="Informar o número da fila"
          v-model="itenslogin.fila"
          class="filtro"
        ></v-select>              
              <label for="Email">Ramal utilizado</label>
             
                   <v-select
          :items="items"
          label="Informar o número da ramal"
          v-model="itenslogin.ramal"
        ></v-select>
              

              <div id="btn">
               <button id="button" @click="salvar" >Plugar</button>
              </div>
          
      </v-form>
</div>  
   
  </div>
  </div>
</template>

<script>
import Navbar2 from "../components/Navbar2";
import { api } from '@/conf/api';

export default {
    name: "HelloView",
  async beforeMount() {
    this.exibirramal()
    this.exibir()
  },
  data() {
    return {
items: [],
Selfila: [],
itenslogin: {
    usuario: '',
    pin: '',
    fila: '',
    ramal: '',
},
 

 
    };
  },
  components: {
    Navbar2,
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
        this.Selfila.push( [numerofila]);
    })
    },
    

        exibirramal: async function(){
  let listaramal = await api.get(`/listaramais/`);
 // let entrajoin = join.data.dados;
  
   let listar =  listaramal.data.dados;
  
    let numeroramal = [];
    //let nomefila = [];
   listar.forEach((d) => {
      //  nomefila = d.descr;
       numeroramal = d.extension;
      
     // this.listafila = [nomefila];
      //this.items = nomefila;
      this.items.push([numeroramal]);
    ////console.log(this.items)
   }
   )},
       salvar: async function(){
    
        //console.log(this.itenslogin)
        
        
        let res2 = await api.post("/verificapainel", this.itenslogin)
        
        let resapi = res2.data.dados
        //console.log('res2 retorna',resapi)

        resapi.forEach((d) => {

            this.itenslogin.usuario = d.ramal_fisico
            
            
        });
        if(res2.data.dados.length > 0){
            let logapainel = await api.post("/logarpainel", this.itenslogin);
            let a = logapainel.data.dados;
            //console.log(a);
            let logapainelop = await api.post("/logarpainelop", this.itenslogin);
            let b = logapainelop.data.dados;
            //console.log(b)

            let logs = await api.post("/logslogin", this.itenslogin);
            let c = logs.data.dados;
            //console.log(c)
            this.$store.dispatch('guardaPin', this.itenslogin)
            this.$router.push("painelAgente");

        }else{
            alert('login incorreto!')
        }

},
  },
};
</script>
<style >

.app{

    background-image: url(../assets/pm2.jpg);

    background-repeat: repeat;
    background-size: 113%;
    background-position: left;
    background-position-x: right;
}
.trocar{
    border: none;
    background: none;
}
.trocar:hover{
    text-decoration: underline;
    color:#61a5e8;
    border: none;
    background: none;
    font-size: 15px;
}
 


#form{
    position: absolute;
    top: 29%;
    left: 37%;
    background-color: transparent;
    border-radius: 10px;
    padding: 3%;
    width: -webkit-min-content;
    width: -moz-min-content;
    width: 28%;
    align-items: center;
    -webkit-animation: iniciar 1.6s ease-out;
    animation: iniciar 1.6s ease-out;
    pointer-events: all;
}
.title{
    font-size: 1.rem;
    margin-bottom: 10%;
}
.input{
    min-width: 90%;
    border-radius: 22px;
    border: 2px rgb(83, 83, 83) solid;
    padding: 5px;
    margin: 0px 0px 12px -5px;
}
.input input{
    width: 100%;
    background-color: rgba(255, 255, 255, 0);
    border: none;
    outline: none;
    font-family: 'Poppins', sans-serif;
    transform: translateY(-10%);
    font-size: 10pt;
}
#btn{
    margin-top: 10%;
    width: 100%;
    text-align: center;
}
#btn button{
    font-family: 'Poppins', sans-serif;
    background-color: #5796d6;
    width: 100%;
    height: 40px;
    border: none;
    font-size: 1.2em;
    border-radius: 20px;
    outline: none;
    cursor: pointer;
}
#btn button:hover{
    background: linear-gradient(#61a5e8, #8fbdee, #3e72a7);
    color: white;
}

</style>

