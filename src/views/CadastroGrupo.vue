<template>
  <div class="limiter">
    <Navbar />
    <v-data-table
      :headers="headers"
      :items="desserts"
      sort-by="calories"
      class="elevation-1"
    >
      <template v-slot:top>
        <v-toolbar flat>
          <v-toolbar-title>Cadastro Grupos</v-toolbar-title>
          <v-divider class="mx-4" inset vertical></v-divider>
          <v-spacer></v-spacer>
          <v-dialog v-model="dialog" max-width="500px">
            <template v-slot:activator="{ on, attrs }">
              <v-btn color="primary" dark class="mb-2" v-bind="attrs" v-on="on">
                CADASTRO GRUPO
              </v-btn>
              <router-link to="./DashboardPrincipal" class="linkp">
                <v-btn color="primary" dark class="voltar"> VOLTAR </v-btn>
              </router-link>
            </template>
            <v-card>
              <v-card-title>
                <span class="text-h5">{{ formTitle }}</span>
              </v-card-title>

              <v-card-text>
                <v-container>
                  <v-row>
                    <v-col cols="12" sm="6" md="4">
                      <v-text-field
                        v-model="editedItem.grupo"
                        label="Nome Do Grupo"
                      ></v-text-field>
                    </v-col>
                    <v-col cols="12" sm="6" md="4">
                      <v-text-field
                        v-model="editedItem.descricao"
                        label="Descricao Do Grupo"
                      ></v-text-field>
                    </v-col>
                  </v-row>
                </v-container>
              </v-card-text>

              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color="blue darken-1" text @click="close"> Cancel </v-btn>
                <v-btn color="blue darken-1" text @click="save"> Save </v-btn>
              </v-card-actions>
            </v-card>
          </v-dialog>
          <v-dialog v-model="dialogDelete" max-width="500px">
            <v-card>
              <v-card-title class="text-h5"
                >Tem certeza que deseja excluir?</v-card-title
              >
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color="blue darken-1" text @click="closeDelete">Cancel</v-btn>
                <v-btn color="blue darken-1" text @click="deleteItemConfirm">OK</v-btn>
                <v-spacer></v-spacer>
              </v-card-actions>
            </v-card>
          </v-dialog>
        </v-toolbar>
      </template>
      <template v-slot:[`item.actions`]="{ item }">
        <v-icon small class="mr-2" @click="editItem(item)"> mdi-pencil </v-icon>
        <v-icon small @click="deleteItem(item)"> mdi-delete </v-icon>
      </template>
      <template v-slot:no-data>
        <v-btn color="primary" @click="initialize"> Reset </v-btn>
      </template>
    </v-data-table>
    <Footer />
  </div>
</template>

<script>
import { api } from "@/conf/api";
import Navbar from "../components/Navbar";
import Footer from "../components/footer.vue";
import verificaAcesso from "../acess/verificaAcessoMixin"
export default {
    name: "HelloView",
  mixins: [verificaAcesso],
  data: () => ({
    dialog: false,
    dialogDelete: false,
    //
    headers: [
      {
        text: "Grupo",
        align: "start",
        sortable: false,
        value: "grupo",
      },
      { text: "Descrição", value: "descricao" },
      { text: "Editar | Excluir", value: "actions", sortable: false },
    ],
    desserts: [],
    editedIndex: -1,
    editedItem: {
      id: "",
      grupo: "",
      descricao: "",
    },
    defaultItem: {
      id: "",
      grupo: "",
      descricao: "",
    },
  }),

  computed: {
    formTitle() {
      return this.editedIndex === -1 ? "Novo Grupo" : "Editar Grupo";
    },
  },
  components: {
    Navbar,
    Footer,
  },
  watch: {
    dialog(val) {
      val || this.close();
    },
    dialogDelete(val) {
      val || this.closeDelete();
    },
  },

  created() {
    this.initialize();
  },

  methods: {
    async initialize() {
      let res = await api.get("/listargrupo");
      //console.log(res.data.dados);
      this.desserts = res.data.dados;
    },

    editItem(item) {
      this.editedIndex = this.desserts.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.editedItem.senha = "";
      console.log("Edit", this.editedItem);
      this.dialog = true;
    },

    deleteItem(item) {
      this.editedIndex = this.desserts.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.dialogDelete = true;
    },

    async deleteItemConfirm() {
      //console.log(this.editedItem);
      let res = await api.get("/deletegrupo/" + this.editedItem.id);
      //console.log(res);
      if (res.data.msg == "erro") {
        window.alert("Erro!");
      } else {
        this.desserts.splice(this.editedIndex, 1);
      }

      this.closeDelete();
    },

    close() {
      this.dialog = false;
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
    },

    closeDelete() {
      this.dialogDelete = false;
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
    },

    async save() {
      let res;
      if (this.editedIndex > -1) {
        //edita
        res = await api.post("/alterargrupo", this.editedItem);
        if (res.data.msg == "erro") {
          window.alert("Ocorreu um erro code 1!");
        } else {
          Object.assign(this.desserts[this.editedIndex], this.editedItem);
          document.location.reload(true);
          console.log("woooooooooooooooooow");
        }
        //// console.log(this.editedItem);
      } else {
        //inclui
        res = await api.post("/inseregrupo", this.editedItem);
        if (res.data.msg == "erro") {
          window.alert("Ocorreu um erro - code 2!");
        } else {
          this.desserts.push(this.editedItem).uppercase;
          document.location.reload(true);
        }
        //// console.log(this.editedItem);
      }
      this.initialize();
      this.close();
    },
  },
};
</script>

<style scoped>
.limiter {
  width: 100%;
  margin: 0 auto;
}

.voltar {
    position: fixed;
    right: 13%;
    top: 16%;
}
</style>
