import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import { api } from '../conf/api'
//import Store from '../store'


Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'LoginHome',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/HomeView.vue')
  },
  {
    path: '/chat',
    name: 'ChatView',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/ChatVue.vue')
  },
  {
    path: '/relatorioscampanha',
    name: 'relatorioscampanha',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/RelatoriosCampanha.vue')
  },
  {
    path: '/detalhecampanha',
    name: 'detalhecampanha',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/DetalhesCampanha.vue')
  },
  {
    path: '/desempenhocampanha',
    name: 'desempenhocampanha',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/DesempenhoCampanha.vue')
  },
  {
    path: '/agentecampanha',
    name: 'agentecampanha',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/AgenteCampanha.vue')
  },
  {
    path: '/upload',
    name: 'uploadView',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/UploadView.vue')
  },
  {
    path: '/servicecomg',
    name: 'ServiceComg',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/ServiceComg.vue')
  },
  {
    path: '/permissao',
    name: 'PermissaoView',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/PermissaoView.vue')
  },
  {
    path: '/relatoriosprincipais',
    name: 'Home',
    component: Home
  },
  {
    path: '/menusupervisorsainte',
    name: 'menusupervisorsainte',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/MenuSupervisorSainte.vue')
  },

  {
    path: '/quantidadeligacoes',
    name: 'quantidadeligacoes',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/Relatorio.vue')
  },

  {
    path: '/realoperadorpausado',
    name: 'realoperadorpausado',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/realoperadorpausado.vue')
  },

  {
    path: '/tmasainte',
    name: 'TMA',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/TMASAINTE.vue')
  },
  {
    path: '/tmasaintegrupo',
    name: 'TMA',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/TMASAINTEGrupo.vue')
  },
  {
    path: '/tmesainte',
    name: 'TME',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/TmeSainte.vue')
  },
  {
    path: '/tmesaintegrupo',
    name: 'TME',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/TmeSainteGrupo.vue')
  },
  {
    path: '/detalhesainte',
    name: 'deletalhessainte',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/DetalhesSainte.vue')
  },
  {
    path: '/detalhesaintegrupo',
    name: 'detalhessainte',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/DetalheSainteGrupo.vue')
  },
  {
    path: '/servicesainte',
    name: 'servicesainte',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/ServiceSainte.vue')
  },
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/Pausa.vue')
  },

  {
    path: '/menurealtime',
    name: 'MenuRealtime',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/MenuRealtime.vue')
  },
  {
    path: '/callback',
    name: 'estoque',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/Estoque.vue')
  },
  {
    path: '/ura',
    name: 'ura',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/ura.vue')
  },

  {
    path: '/cadastroac',
    name: 'Cadastro',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/Cadastro.vue')
  },
  {
    path: '/servicecomg',
    name: 'ServiceComg',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/ServiceComg.vue')
  },
  {
    path: '/cadastroscripts',
    name: 'CadastroScripts',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/CadastroScripts.vue')
  },
  {
    path: '/cadastroscripts',
    name: 'CadastroScripts',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/CadastroScripts.vue')
  },
  {
    path: '/dashpm',
    name: 'dashpm',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/DashPM.vue')

  },
  {
    path: '/dashbm',
    name: 'dashbm',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/DashBM.vue')
  },
  {
    path: '/dashsiate',
    name: 'dashsiate',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/DashSIATE.vue')
  },
  {
    path: '/cadastrousuario',
    name: 'CadastroUsuario',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/CadastroUsuario.vue')
  },
  {
    path: '/cadastrousuariopermissao',
    name: 'CadastroUsuariopermissao',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/CadastroUsuarioPermissao.vue')
  },
  {
    path: '/cadastrousuario1',
    name: 'CadastroUsuario1',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/CadastroUser.vue')
  },
  {
    path: '/cadastrogrupo',
    name: 'CadastroGrupo',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/CadastroGrupo.vue')
  },
  {
    path: '/menugrupo',
    name: 'MenuGrupo',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/MenuGrupo.vue')
  },
  {
    path: '/login',
    name: 'Login',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/HomeView.vue')
  },
  {
    path: '/hold',
    name: 'Hold',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/Pausa.vue')
  },
  {
    path: '/menu',
    name: 'Menu',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/Home.vue')
  },
  {
    path: '/detalhe',
    name: 'Detalhe',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/Detalhes.vue')
  },
  {
    path: '/detalheaband',
    name: 'DetalheAband',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/DetalhesAband.vue')
  },

  {
    path: '/porhora',
    name: 'Porhora',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/Fluxoporhora.vue')
  },

  {
    path: '/poragente',
    name: 'Poragente',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/TMA.vue')
  },
  {
    path: '/comgtma',
    name: 'comgtma',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/TMACOMG.vue')
  },
  {
    path: '/porespera',
    name: 'Porespera',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/TME.vue')
  },
  {
    path: '/porservico',
    name: 'Porservico',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/Service.vue')
  },

  {
    path: '/recebidas',
    name: 'Recebidas',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/Recebidas.vue')
  },
  {
    path: '/inforagentes',
    name: 'Inforagentes',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/Informacoesagentes.vue')
  },
  {
    path: '/troncos',
    name: 'Troncos',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/troncos.vue')
  },
  {
    path: '/csv',
    name: 'Csv',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/CsvVue.vue')
  },
  {
    path: '/tronco',
    name: 'Tronco',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/Tronco.vue')
  },
  {
    path: '/realoperador',
    name: 'Realoperador',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/realoperador.vue')
  },
  {
    path: '/realentrada',
    name: 'Realentrada',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/realentrada.vue')
  },


  {
    path: '/loginagente',
    name: 'LoginAgente',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/LoginView.vue')
  },
  {
    path: '/painelAgente',
    name: 'Painel',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.




    component: () => import(/* webpackChunkName: "about" */ '../views/PainelAgenteView.vue')
  },

  {
    path: '/loginCBView',
    name: 'Login1',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/LoginCBView.vue')
  },
  {
    path: '/painelprincipal',
    name: 'Tela',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/PainelPrincipal.vue')
  },
  {
    path: '/cadastropin',
    name: 'Pin',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/CadastroPIN.vue')
  },
  {
    path: '/cadastroramal',
    name: 'Ramal',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/CadastroRamal.vue')
  },
  {
    path: '/painelfilas',
    name: 'PainelFila',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/PainelFilas.vue')
  },
  {
    path: '/listapin',
    name: 'ListaPin',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/ListaPin.vue')
  },
  {
    path: '/listaramal',
    name: 'ListaRamal',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/ListaRamal.vue')
  },
  {
    path: '/periodoteste',
    name: 'PeriodoTeste',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/periodoteste.vue')
  },
  {
    path: '/DashboardPrincipal',
    name: 'Dashboard Principal',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/DashboardPrincipal.vue')
  },
  {
    path: '/campanhafila',
    name: 'CampanhaFila',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/campanhafila.vue')
  },
  {
    path: '/campanhafilageral',
    name: 'CampanhaFilageral',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/campanhafilageral.vue')
  },
  {
    path: '/discagem',
    name: 'Discagem',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/Discagem.vue')
  },
  {
    path: '/gravacao',
    name: 'gravacao',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/gravacao.vue')
  },
  {
    path: '/gravaconsulta',
    name: 'gravaconsulta',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/gravaconsulta.vue')
  },
  {
    path: '/gravaconsult',
    name: 'gravaconsult',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/gravaconsult.vue')
  },
  {
    path: '/eren',
    name: 'eren',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/eren.vue')
  },
  {
    path: '/teste',
    name: 'teste',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/teste.vue')
  },

]

const router = new VueRouter({
  mode: 'history',
  // base: process.env.BASE_URL,
  routes
})

router.beforeEach((to, from, next) => {

  /* let numRota = 0
 
   console.log(to.name)
   if (to.name !== "LoginHome") {
     const rotas = ["Dashboard Principal", "ChatView", "uploadView", "CadastroUsuario", "PermissaoView"]
     let nomeRota = to.name
     let rotas2 = Store.state.rotas
     let indexRota = rotas.findIndex(v => v == nomeRota)
     numRota = rotas2[indexRota]
     console.log('numRotas', numRota, rotas[indexRota], rotas2[indexRota])
 
   }*/



  // const pegaGrupo = ["Dashboard Principal", "Chat", "Upload Campanhas", "Cadastro Usuario", "Permissao",]
  //
  //console.log("logado?", store.state.logado);
  if (localStorage.getItem("jwt")) {
    api.defaults.headers.common[
      "x-access-token"
    ] = localStorage.getItem("jwt");
  }
  if (to.name !== "LoginHome" && localStorage.getItem("jwt") == undefined) next({ name: "LoginHome" });
  else next();
});



export default router

