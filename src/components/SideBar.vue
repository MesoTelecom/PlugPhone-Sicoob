<template>
  <nav>
    <v-navigation-drawer app dark color="rgb( 40, 85, 111)">
      <v-list>
        <v-img src="../assets/plugbranco3.png"></v-img>

      </v-list>

      <v-divider></v-divider>

      <v-list nav dense>

      </v-list>
      <v-list flat>
        <v-list-item v-for="item in filteredMenuItems" :key="item.text" :to="item.route">
          <v-list-item-content class="lista">
            <span class="ml-2"> <v-icon :color="item.color">{{ item.icon }} </v-icon>
              {{ item.text }}</span>
          </v-list-item-content>
        </v-list-item>
      </v-list>

      <template v-slot:append>
        <div class="pa-2">
          <v-btn block color="blue" @click="logout">
            <v-icon left> mdi-logout </v-icon>
            Logout
          </v-btn>
        </div>
      </template>
    </v-navigation-drawer>
  </nav>
</template>
<script>
export default {
  name: "SideBar", // Define o nome do componente como "SideBar"

  async beforeMount() {
    this.getPermissions()
  },

  data() { // Define os dados reativos do componente

    let usuario = JSON.parse(localStorage.getItem('usu'));
    this.tipo = usuario.permission;
    this.usuario = usuario.usuario + "-Meso"
    return {
      minhasTelas2: [],
      drawer: true, // Controla se a sidebar está aberta ou fechada
      error: false, // Indica se ocorreu um erro no logout
      menuItems: [ // Lista de itens do menu lateral com nome, rota, ícone e permissão necessária

        { text: 'Dashboard Principal', route: '/DashboardPrincipal', icon: 'mdi-view-dashboard', permission: 'view_dashboard' },
        { text: 'Chat', route: '/chat', icon: 'mdi-whatsapp', permission: 'view_chats' },
        { text: 'Cadastro Permissão', route: '/permissao', icon: 'mdi-lock-cog', permission: 'manage_permission' },
        { text: 'Relatórios Principais', route: '/relatoriosprincipais', icon: 'mdi-chart-line', permission: 'Relatórios' },
        { text: 'Relatórios Campanha', route: '/relatorioscampanha', icon: 'mdi-file-chart', permission: 'Relatórios' },
        { text: 'Relatórios Realtime', route: '/menurealtime', icon: 'mdi-timer', permission: 'Relatórios' },
        { text: 'Cadastro Usuário', route: '/cadastrousuario', icon: 'mdi-account-plus', permission: 'manage_users' },
        { text: 'Campanhas', route: '/upload', icon: 'mdi-bullhorn', permission: 'manage_campaign' },
        { text: 'Horário de Atendimento', route: '/horarioatendimento', icon: 'mdi-clock', permission: 'horarios' },
        { text: 'Criação de Templates', route: '/templates', icon: 'mdi-file-document-edit', permission: 'manage_template' },
        { text: 'Visualização de Setores', route: '/viewsetores', icon: 'mdi-office-building', permission: 'view_setores' },
        { text: 'Visualização de Agentes', route: '/viewagentes', icon: 'mdi-account-tie', permission: 'view_agentes' },




      ],
      userPermissions: [ // Simula as permissões do usuário logado

      ]

    };
  },
  tipo: "",
  usuario: "",

  computed: { // Propriedades computadas (valores derivados dos dados do componente)
    filteredMenuItems() { // Filtra os itens do menu para exibir apenas os que o usuário tem permissão para ver
      return this.menuItems.filter(item => this.hasPermission(item.permission));
    }
  },

  methods: { // Métodos do componente
    hasPermission(permission) { // Verifica se o usuário possui uma determinada permissão
      return this.userPermissions.includes(permission);
    },

    async logout() { // Método assíncrono para realizar o logout do usuário
      try {
        this.error = false; // Reseta o erro antes de tentar sair
        localStorage.removeItem("jwt"); // Remove o token JWT do localStorage, efetivamente deslogando o usuário
        this.$router.push("/"); // Redireciona o usuário para a página inicial
      } catch (e) { // Captura possíveis erros ao tentar deslogar
        window.alert("Não deu!"); // Exibe um alerta se houver falha no logout
      }
    },
    getPermissions() {
      let minhasRotas = JSON.parse(localStorage.getItem("insereRotas"))
      let minhasTelas = [
        'view_dashboard',
        'view_chats',
        'manage_permisson',
        'manage_users',
        'manage_campaign',
        'horarios',
        'manage_template',
        'disparo_campanha',
        'Relatórios',
        'view_campanha',
        'view_setores',
        'view_agentes',


        'historico_conversa all',
        'historico_conversa',

      ]

      console.log('JA PODE?', minhasRotas)


      for (let d = 0; d < minhasRotas.length; d++) {
        if (minhasRotas[d] == 1) {
          this.minhasTelas2.push(minhasTelas[d])

        }
      }

      console.log('minhasTelas', this.minhasTelas2)
      this.userPermissions = this.minhasTelas2

    }
  },
};
</script>


<style scoped>
.lista:hover {
  background-color: #8ec3f583;
}
</style>