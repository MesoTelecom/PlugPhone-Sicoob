<template>
    <div class="limiter">


        <!-- Campo de Busca -->
        <v-text-field v-model="search" append-icon="mdi-magnify" label="Pesquisar Usuário" single-line hide-details
            class="busca"></v-text-field>

        <!-- Tabela de Usuários -->
        <v-data-table :search="search" :headers="headers" :items="desserts" class="elevation-1">
            <template v-slot:top>
                <v-toolbar flat>
                    <v-toolbar-title>Painel de Permissões PlugPhone</v-toolbar-title>

                    <v-spacer></v-spacer>

                    <!-- Botão Voltar -->
                    <router-link to="./relatoriosprincipais" class="linkp">
                        <v-btn color="green" dark class="botaoVoltar">VOLTAR</v-btn>
                    </router-link>

                    <v-divider class="mx-4" inset vertical></v-divider>

                    <!-- Botão Cadastrar -->
                    <v-btn color="primary" dark class="mb-2" @click="dialog = true">
                        CADASTRAR
                    </v-btn>
                </v-toolbar>
            </template>

            <!-- Ações de Edição e Exclusão -->
            <template v-slot:[`item.actions`]="{ item }">
                <v-icon small class="mr-2" @click="editItem(item)"> mdi-pencil </v-icon>
                <v-icon small @click="deleteItem(item)"> mdi-delete </v-icon>
            </template>

            <!-- Caso Não Haja Dados -->
            <template v-slot:no-data>
                <v-btn color="primary" @click="initialize"> Reset </v-btn>
            </template>
        </v-data-table>

        <!-- Modal de Cadastro -->
        <v-dialog v-model="dialog" max-width="500px">
            <v-card>
                <v-card-title>
                    <span class="text-h5">{{ formTitle }}</span>
                </v-card-title>

                <v-card-text>
                    <v-container>
                        <v-row>
                            <v-col cols="12">
                                <v-text-field v-model="editedItem.nome" label="Nome do Usuário"></v-text-field>
                            </v-col>
                            <v-col cols="12">
                                <!-- v-select agora permite múltiplas seleções -->
                                <v-select :items="pegaGrupo" v-model="selectedValues" label="Nível de Acesso" multiple
                                    chips outlined :value="valoresSetados"></v-select>
                            </v-col>
                        </v-row>
                    </v-container>
                </v-card-text>

                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color="red darken-1" text @click="close"> Cancelar </v-btn>
                    <v-btn color="blue darken-1" text @click="save"> Salvar </v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>

        <!-- Modal de Exclusão -->
        <v-dialog v-model="dialogDelete" max-width="500px">
            <v-card>
                <v-card-title class="text-h5">Tem certeza que deseja excluir?</v-card-title>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color="blue darken-1" text @click="closeDelete">Cancelar</v-btn>
                    <v-btn color="blue darken-1" text @click="deleteItemConfirm">OK</v-btn>
                    <v-spacer></v-spacer>
                </v-card-actions>
            </v-card>
        </v-dialog>

        <Footer />
    </div>
</template>

<script>
import { api2 } from "../conf/api2";
export default {
    data() {
        return {
            desserts: [],
            search: "",
            dialog: false,
            dialogDelete: false,
            valoresSetados: [],
            headers: [
                { text: "Nome", value: "nome" },
                { text: "Permissao", value: "permissao" },
                { text: "Editar | Excluir", value: "actions", sortable: false }
            ],
            pegaGrupo: ["Dashboard Principal", "Chat", "Upload Campanhas", "Cadastro Usuario", "Permissao",],
            selectedValues: [],
            editedIndex: -1,
            editedItem: {
                id_permissao: 0,
                nome: "",
                permissao: "0000000",
            },
            defaultItem: {
                id_permissao: 0,
                nome: "",
                permissao: "0000000",
            },
        };
    },
    computed: {
        formTitle() {
            return this.editedIndex === -1 ? "Novo Perfil" : "Editar Perfil";
        }
    },
    created() {
        this.initialize();
    },
    methods: {
        async initialize() {
            let res = await api2.get("/permissao/busca-permissao");
            console.log(res.data.permissao.dados);
            this.desserts = res.data.permissao.dados

            /*let permissao = res.data.permissao.dados[1].permissao
            let nome = res.data.permissao.dados[1].nome

            this.desserts = [
                {
                    permissao,
                    nome
                }
            ]*/
        },

        async save() {
            let valores = []
            //  console.log(this.selectedValues)
            console.log(this.editedItem.nome)
            this.pegaGrupo.forEach((v, i) => {
                let valor = 0
                this.selectedValues.forEach(e => {
                    if (e == v) {
                        valor = 1
                    }
                })
                valores[i] = valor
            });

            console.log('sou valores', valores)

            let permissoes = valores.join().replaceAll(',', '')
            this.editedItem.permissao = permissoes
            let nomePermissao = this.editedItem.nome
            let idPermissao = this.editedItem.id_permissao
            console.log('Foi aqui', permissoes, nomePermissao)

            let res;

            console.log('editedIndex > -1', this.editedIndex)

            if (this.editedIndex > -1) {
                //edita

                console.log("eusou edit", this.editedItem);
                res = await api2.put("/permissao/atualiza-permissao", { p: permissoes, n: nomePermissao, i: idPermissao });
                if (res.data.msg == "erro") {
                    window.alert("Ocorreu um erro code 1!");
                } else {
                    console.log('Pão doce')
                    console.log(this.desserts[this.editedIndex], this.editedItem);
                    Object.assign(this.desserts[this.editedIndex], this.editedItem);
                    console.log('res aqui meu anjo', res);

                    document.location.reload(true);
                    console.log("woooooooooooooooooow");
                }
                console.log("eusou edit1", this.editedItem);
            } else {
                //inclui
                res = await api2.post("/permissao/insere-permissao", { p: permissoes, n: nomePermissao });
                if (res.data.msg == "erro") {
                    window.alert("Ocorreu um erro - code 2!");
                } else {

                    this.desserts.push(this.editedItem);
                    document.location.reload(true);
                }
                console.log("eu sou inseri", this.editedItem);
            }
            this.initialize();
            this.close();
        },
        editItem(item) {
            console.log('meu item', item)
            this.editedIndex = this.desserts.indexOf(item);
            this.editedItem = Object.assign({}, item);
            let arrayPermissao = item.permissao.split('');
            this.pegaGrupo.forEach((v, i) => {
                arrayPermissao.forEach((e, y) => {
                    if (e == '1') {
                        if (i == y) {
                            this.selectedValues.push(v)
                        }
                    }
                })
            })
            console.log('rotulo', this.selectedValues)
            console.log('array', arrayPermissao)
            this.dialog = true;
        },
        deleteItem(item) {

            this.editedIndex = item.id_permissao
            this.editedItem = Object.assign({}, item);
            //console.log('item', item, this.editedItem)
            this.dialogDelete = true;
        },
        async deleteItemConfirm() {
            console.log(this.editedItem);
            let idPermissao = this.editedItem.id_permissao
            console.log('minha variavel', idPermissao)
            let res = await api2.delete("/permissao/deleta-permissao/" + idPermissao);
            // console.log({ "idPermissao": idPermissao })
            console.log('res aqui meu anjo', res);
            if (res.data.msg == "erro") {
                window.alert("Erro!");
            }

            this.closeDelete();
            document.location.reload(true);
        },
        close() {
            this.dialog = false;
            this.editedItem = { usuario: "", senha: "", acesso: [] };
            this.selectedValues = [];
        },
        closeDelete() {
            this.dialogDelete = false;
        },
        save2() {
            if (this.editedItem.usuario) {
                let index = this.usuarios.findIndex(u => u.usuario === this.editedItem.usuario);
                this.editedItem.acesso = [...this.selectedValues]; // Salva os acessos como array
                if (index !== -1) {
                    this.usuarios[index] = this.editedItem;
                } else {
                    this.usuarios.push(this.editedItem);
                }
            }
            this.close();
        },
    }
};
</script>

<style scoped>
.limiter {
    max-width: 1100px;
    margin: auto;
    padding: 20px;
}

.busca {
    margin-bottom: 10px;
}

.botaoVoltar {
    margin-left: 10px;
    font-weight: bold;
}
</style>