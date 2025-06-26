<template>
<div id="login1">
<Navbar />
      
<img src="../assets/pp.png" alt="" style="width: 12%; margin-top: 3%; margin-left: 45%;">
      <div id="form">
        
              <router-link to="/loginagente"><button class="trocar">login</button></router-link>
              <h2 class="title">Login Callback
              </h2>
              <label for="username">Numero do Agente</label>
              <div class="input">
                  <input id="Username" name="username" placeholder="Agent" type="text">
              </div>
              <label for="Email">Senha</label>
              <div class="input">
                  <input id ="Email" name = "Email" placeholder = "senha" type="password">
              </div>

              <div id="btn">
                  <router-link to="/painelAgente" id="rota"><button id="button">Plugar</button></router-link>
              </div>
          
      </div>
<Footer />
</div>  


</template>
  

<script>
import Navbar from "../components/Navbar";
import Footer from "../components/footer.vue";
import { api } from '@/conf/api'
  export default {
    name: "HelloView",
	async beforeMount (){
    let a = await api.get('/listaramais')
    //console.log(a.data.dados)
    this.dados = a.data.dados
  },
components: {
        Navbar,
        Footer,
      },
  }


</script>

<style >

body{

    
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
    top: 39%;
    left: 37%;
    background-color: #ffffff91;
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






              