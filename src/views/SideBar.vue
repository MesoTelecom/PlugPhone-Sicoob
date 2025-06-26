<template>
  <nav>
    <v-navigation-drawer app dark color="rgb( 40, 85, 111)" permanent expand-on-hover>
      <v-list>
        <v-img src="../assets/plugbranco3.png"></v-img>

        <v-list-item link>
          <v-list-item-content>
            <v-list-item-title class="text-h6"> PlugPhone Supervisor </v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>

      <v-divider></v-divider>

      <v-list nav dense>
        <v-list-item link>
          <v-list-item-icon>
            <router-link to="/DashboardPrincipal"
              ><v-icon>mdi-home-outline</v-icon></router-link
            >
          </v-list-item-icon>
          <v-list-item-title
            ><router-link to="/DashboardPrincipal" style="color: white"
              >Dashboard</router-link
            ></v-list-item-title
          >
        </v-list-item>
        <v-list-item link>
          <v-list-item-icon>
            <router-link to="/relatoriosprincipais"
              ><v-icon>mdi-chart-multiple</v-icon></router-link
            >
          </v-list-item-icon>
          <v-list-item-title
            ><router-link to="/relatoriosprincipais" style="color: white"
              >Relatórios</router-link
            ></v-list-item-title
          >
        </v-list-item>
        <v-list-item link>
          <v-list-item-icon>
            <router-link to="/menurealtime"
              ><v-icon>mdi-monitor-multiple</v-icon></router-link
            >
          </v-list-item-icon>
          <v-list-item-title
            ><router-link to="/menurealtime" style="color: white"
              >Real Time</router-link
            ></v-list-item-title
          >
        </v-list-item>
        <v-list-item link>
          <v-list-item-icon>
            <router-link to="/cadastroramal"><v-icon>mdi-deskphone</v-icon></router-link>
          </v-list-item-icon>
          <v-list-item-title
            ><router-link to="/cadastroramal" style="color: white"
              >Criação de Ramais</router-link
            ></v-list-item-title
          >
        </v-list-item>

        <v-list-item link>
          <v-list-item-icon>
            <router-link to="/menusupervisorsainte"
              ><v-icon>mdi-exit-to-app</v-icon></router-link
            >
          </v-list-item-icon>
          <v-list-item-title
            ><router-link to="/menusupervisorsainte" style="color: white"
              >Relatório Sainte</router-link
            ></v-list-item-title
          >
        </v-list-item>

        <v-list-item link>
          <v-list-item-icon>
            <router-link to="/cadastropin"><v-icon>mdi-account-key</v-icon></router-link>
          </v-list-item-icon>
          <v-list-item-title
            ><router-link to="/cadastropin" style="color: white"
              >Criação de PINS</router-link
            ></v-list-item-title
          >
        </v-list-item>

        <v-list-item link>
          <v-list-item-icon>
            <router-link to="/cadastrousuario"
              ><v-icon>mdi-account-group</v-icon></router-link
            >
          </v-list-item-icon>
          <v-list-item-title
            ><router-link to="/cadastrousuario" style="color: white"
              >Criação de Supervisores</router-link
            ></v-list-item-title
          >
        </v-list-item>
        <v-list-item link>
          <v-list-item-icon>
            <router-link to="/cadastrogrupo"
              ><v-icon>mdi-account-multiple-outline</v-icon></router-link
            >
          </v-list-item-icon>
          <v-list-item-title
            ><router-link to="/cadastrogrupo" style="color: white"
              >Criação De Grupo</router-link
            ></v-list-item-title
          >
        </v-list-item>
        
        <v-list-item link>
          <v-list-item-icon>
            <a href="http://192.168.4.53/index.php?menu=monitoring" style="color: white;"><v-icon>mdi-record-rec</v-icon>
            </a>
          </v-list-item-icon>
          <v-list-item-title><a href="http://192.168.4.53/index.php?menu=monitoring" style="color: white;">Gravação de
              sistema</a></v-list-item-title>
        </v-list-item>
        <v-list-item link>
          <v-list-item-icon>
            <router-link to="/servicecomg"
              ><v-icon>mdi-percent-circle-outline</v-icon></router-link
            >
          </v-list-item-icon>
          <v-list-item-title
            ><router-link to="/servicecomg" style="color: white"
              >Ligações unicas</router-link
            ></v-list-item-title
          >
        </v-list-item>

        <v-list-item link>
          <v-list-item-icon>
            <router-link to="/comgtma"><v-icon>mdi-phone-clock</v-icon></router-link>
          </v-list-item-icon>
          <v-list-item-title
            ><router-link to="/comgtma" style="color: white"
              >TMA Diário
            </router-link></v-list-item-title
          >
        </v-list-item>

        <v-list-item link>
          <v-list-item-icon>
            <router-link to="/Callback"
              ><v-icon>mdi-phone-incoming-outgoing-outline</v-icon></router-link
            >
          </v-list-item-icon>
          <v-list-item-title
            ><router-link to="/Callback" style="color: white"
              >Callback
            </router-link></v-list-item-title
          >
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
  name: "SideBar",
  data: () => ({
    error: false,
  }),
  methods: {
    async logout() {
      try {
        this.error = false;
        localStorage.removeItem("jwt");
        this.$router.push("/");

        // console.log(res.data.dados[0]);
      } catch (e) {
        window.alert("Não deu!");
      }
    },
  },
};
</script>

<style scoped></style>
