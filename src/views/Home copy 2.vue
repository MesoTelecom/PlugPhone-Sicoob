<template>
<div id= "main-fundo">
  <v-app>
    <v-content>
      <v-container class = "fill-height-a" fluid>
        <v-row align="center" justify="center">
          <v-col cols="8" sm="8" md="8"> 
            <v-card class="elevation-24">
              <v-window v-model="step">
              <v-window-item :value="1">
              <v-row>
                <v-col cols="8" md="4">

                  <v-card-text class="mt-12">
                    <!--text--accent-NUMBER altera a cor da letra do texto-->
                    <h1 class="text-center display-1">Pausa</h1>
                     <!--div que trata botões de Facebook, Google e Linkedin-->
                     <br>
                    <div class="text-center" mt-4>
                     
                    </div>
                    <br>
                  
                     <h3 class="text-center">Verifica a inatividade do agente, isto é, os períodos que o mesmo utilizou para Café, almoço, banheiro, etc</h3>
                  </v-card-text>
                  <div class = "text-center">
                  <router-link to="/about"><v-btn rounded  color="#61a5e8" dark>Acessar</v-btn></router-link> 
                  
                 

                  </div>
                  <br>
                </v-col>
                <v-col cols="8" md="4">

                  <v-card-text class="mt-12">
                    <!--text--accent-NUMBER altera a cor da letra do texto-->
                    <h1 class="text-center display-1">Chamadas</h1>
                     <!--div que trata botões de Facebook, Google e Linkedin-->
                     <br>
                    <div class="text-center" mt-4>
                     
                    </div>
                    <br>
                  
                     <h3 class="text-center">Exibe os detalhes do caminho que a chamada percorreu dentro do sistema</h3>
                  </v-card-text>
                  <div class = "text-center">
                    <router-link to="/detalhe"><v-btn rounded  color="#61a5e8" dark >Acessar</v-btn></router-link> 
                  
                 

                  </div>
                  <br>
                </v-col>
                        <v-col cols="8" md="4">

                  <v-card-text class="mt-12">
                    <!--text--accent-NUMBER altera a cor da letra do texto-->
                    <h1 class="text-center display-1">Fluxo por Horas</h1>
                     <!--div que trata botões de Facebook, Google e Linkedin-->
                     <br>
                    <div class="text-center" mt-4>
                     
                    </div>
                    <br>
                  
                     <h3 class="text-center">Contagem de chamadas em cada hora a central recebeu ao todo</h3>
                  </v-card-text>
                  <div class = "text-center">
                   <router-link to="/porhora"><v-btn rounded  color="#61a5e8" dark >Acessar</v-btn></router-link>
                  
                 

                  </div>
                  <br>
                </v-col>

                        <v-col cols="8" md="4">

                  <v-card-text class="mt-12">
                    <!--text--accent-NUMBER altera a cor da letra do texto-->
                    <h1 class="text-center display-1">TMA</h1>
                     <!--div que trata botões de Facebook, Google e Linkedin-->
                     <br>
                    <div class="text-center" mt-4>
                     
                    </div>
                    <br>
                  
                     <h3 class="text-center">Relatório do tempo médio de atendimento do callcenter</h3>
                  </v-card-text>
                  <div class = "text-center">
                   <router-link to="/poragente"><v-btn rounded  color="#61a5e8" dark >Acessar</v-btn></router-link>
                  
                 

                  </div>
                  <br>
                </v-col>

               <v-col cols="8" md="4">

                  <v-card-text class="mt-12">
                    <!--text--accent-NUMBER altera a cor da letra do texto-->
                    <h1 class="text-center display-1">TME</h1>
                     <!--div que trata botões de Facebook, Google e Linkedin-->
                     <br>
                    <div class="text-center" mt-4>
                     
                    </div>
                    <br>
                  
                     <h3 class="text-center">Relatório do tempo médio de espera do callcenter</h3>
                  </v-card-text>
                  <div class = "text-center">
                  <router-link to="/porespera"><v-btn rounded  color="#61a5e8" dark >Acessar</v-btn></router-link>
                  
                 

                  </div>
                  <br>
                </v-col>
                <v-col cols="8" md="4">

                  <v-card-text class="mt-12">
                    <!--text--accent-NUMBER altera a cor da letra do texto-->
                    <h1 class="text-center display-1">Service(%)</h1>
                     <!--div que trata botões de Facebook, Google e Linkedin-->
                     <br>
                    <div class="text-center" mt-4>
                     
                    </div>
                    <br>
                  
                     <h3 class="text-center">Relatório da taxa de ocupação do agente</h3>
                  </v-card-text>
                  <div class = "text-center">
                  <router-link to="/porservico"><v-btn rounded  color="#61a5e8" dark >Acessar</v-btn></router-link>
                  
                 

                  </div>
                  <br>
                </v-col>
           <v-col cols="8" md="4">

                  <v-card-text class="mt-12">
                    <!--text--accent-NUMBER altera a cor da letra do texto-->
                    <h1 class="text-center display-1">Filas</h1>
                     <!--div que trata botões de Facebook, Google e Linkedin-->
                     <br>
                    <div class="text-center" mt-4>
                     
                    </div>
                    <br>
                  
                     <h3 class="text-center">Relata as chamadas recebidas com sucesso até o momento</h3>
                  </v-card-text>
                  <div class = "text-center">
                  <router-link to="/recebidas"><v-btn rounded  color="#61a5e8" dark >Acessar</v-btn></router-link>
                  
                 

                  </div>
                  <br>
                </v-col>


                <v-col cols="8" md="4">

                  <v-card-text class="mt-12">
                    <!--text--accent-NUMBER altera a cor da letra do texto-->
                    <h1 class="text-center display-1">Conexão do agente</h1>
                     <!--div que trata botões de Facebook, Google e Linkedin-->
                     <br>
                    <div class="text-center" mt-4>
                     
                    </div>
                    <br>
                  
                     <h3 class="text-center">Exibe informações de conexão do agente e taxa de inatividade</h3>
                  </v-card-text>
                  <div class = "text-center">
                  <router-link to="/inforagentes"><v-btn rounded  color="#61a5e8" dark >Acessar</v-btn></router-link>
                  
                 

                  </div>
                  <br>
                </v-col>

                <v-col cols="8" md="4">

                  <v-card-text class="mt-12">
                    <!--text--accent-NUMBER altera a cor da letra do texto-->
                    <h1 class="text-center display-1">Troncos</h1>
                     <!--div que trata botões de Facebook, Google e Linkedin-->
                     <br>
                    <div class="text-center" mt-4>
                     
                    </div>
                    <br>
                  
                     <h3 class="text-center">Relatório de ligações por tronco utilizado</h3>
                  </v-card-text>
                  <div class = "text-center">
                  <router-link to="troncos"><v-btn rounded  color="#61a5e8" dark >Acessar</v-btn></router-link>
                  
                 

                  </div>
                  <br>
                </v-col>

                <v-col cols="8" md="4">

                  <v-card-text class="mt-12">
                    <!--text--accent-NUMBER altera a cor da letra do texto-->
                    <h1 class="text-center display-1">Real Time Agente</h1>
                     <!--div que trata botões de Facebook, Google e Linkedin-->
                     <br>
                    <div class="text-center" mt-4>
                     
                    </div>
                    <br>
                  
                     <h3 class="text-center">Monitoramento dos agentes em tempo real</h3>
                  </v-card-text>
                  <div class = "text-center">
                  <router-link to="realoperador"><v-btn rounded  color="#61a5e8" dark >Acessar</v-btn></router-link>
                  
                 

                  </div>
                  <br>
                </v-col>

                  <v-col cols="8" md="4">

                  <v-card-text class="mt-12">
                    <!--text--accent-NUMBER altera a cor da letra do texto-->
                    <h1 class="text-center display-1">Real Time Entrada</h1>
                     <!--div que trata botões de Facebook, Google e Linkedin-->
                     <br>
                    <div class="text-center" mt-4>
                     
                    </div>
                    <br>
                  
                     <h3 class="text-center">Monitoramento das chamadas de entrada em tempo real</h3>
                  </v-card-text>
                  <div class = "text-center">
                  <router-link to="/realentrada"><v-btn rounded  color="#61a5e8" dark >Acessar</v-btn></router-link>
                  
                 

                  </div>
                  <br>
                </v-col>


                         <v-col cols="8" md="4">

                  <v-card-text class="mt-12">
                    <!--text--accent-NUMBER altera a cor da letra do texto-->
                    <h1 class="text-center display-1">Real Time Campanhas</h1>
                     <!--div que trata botões de Facebook, Google e Linkedin-->
                     <br>
                    <div class="text-center" mt-4>
                     
                    </div>
                    <br>
                  
                     <h3 class="text-center">Monitoramento das Campanhas em tempo real</h3>
                  </v-card-text>
                  <div class = "text-center">
                  <router-link to="realtimecampanhas"><v-btn rounded  color="#61a5e8" dark >Acessar</v-btn></router-link>
                  
                 

                  </div>
                  <br>
                </v-col>
              </v-row>
              </v-window-item>
              <v-window-item :value="2"> 

              </v-window-item>
              </v-window>
            </v-card>
          </v-col>
        </v-row>
      </v-container>
    </v-content>
  </v-app>
</div>


</template>


<style scoped>

h1{

  color: #243e57;
}
 
#fill-height{

  background-color: #243e57;
}



.text-center{

color: #243e57;
}


/*.cardanna{

  /*background-image: url(../assets/modelo.jpg);
 background-repeat: no-repeat;
  background-size:10%;
  


}*/


.show-enter-active,
.show-leave-enter {
    transform: translateX(0);
    transition: all .3s linear;
}
.show-enter,
.show-leave-to {
    transform: translateX(100%);
}

.fill-height-a{

background-repeat: no-repeat;
  background-size:100%;

  box-shadow: inset 0 0 0 1000px rgba(4, 81, 132, 0.85);
background-image: url(../assets/telamenu.jpg);
padding: 15px;
background-repeat: no-repeat;
background-size: cover;
background-position: center;


}

 .text-center:hover, .col-md-4:hover{

background-color: #61a5e8;
color:antiquewhite;

}





</style>

<script>


export default{

data: () => ({

step: 1



}),


props: {

source: String 

}

}
  

 

</script>
