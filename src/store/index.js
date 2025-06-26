import Vue from 'vue'
import Vuex from 'vuex'


Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    usuario: {
      id: '',
      usuario: '',
      pin: '',
      permissao: '', // ✅ novo nome, coerente com o banco
      tokenFCM: '',
      rotas: [],
      /*
      idPermissao: '',
      usuario: '',
      pin: '',
      permissao: '', // ✅ novo nome, coerente com o banco
      tokenFCM: '',
      rotas: [],
      */
    },
    
   
    gravacaoAtual: null,
    tokenFCM: null,

    token: null,
    logado: '',
    adm: false

  },
  getters: {
  },
  mutations: {
    setUsuario(state, pay) {
      state.usuario = pay

    },
    setRotas(state, pay) {
      state.rotas = pay
    },
    setGravacaoAtual(state, pay) {
      state.gravacaoAtual = pay
    },
    setTokenFCM(state, token) {
      state.tokenFCM = token; // Atualiza o estado com o token
    },
  },
  actions: {
    insereUsuario(state, pay) {
      state.commit('setUsuario', pay)
    },
    insereGravacaoAtual(state, pay) {
      state.commit("setGravacaoAtual", pay)
    },
    insereRotas(state, pay) {
      state.commit('setRotas', pay)
    }
  },
  modules: {
  }
})