const express = require('express');
const cors = require('cors'); // Importando o CORS
const fs = require("fs");
const { Server } = require("socket.io");
const { executaQry } = require("../teste-do-zero2/banco/bd");
const https = require("https");

const app = express();
const porta = 1915;

// Configuração do CORS para evitar bloqueios
app.use(cors({
    origin: "*", // Permite qualquer origem
    methods: ["GET", "POST"],
    allowedHeaders: ["Content-Type"],
}));

// Opções do certificado SSL (Confirme se os caminhos estão corretos)
const options = {
    key: fs.readFileSync("/etc/letsencrypt/live/tel.sicoob.plugphone.cloud/privkey.pem"),
    cert: fs.readFileSync("/etc/letsencrypt/live/tel.sicoob.plugphone.cloud/fullchain.pem"),
};

// Criar servidor HTTPS e vincular ao Express
const server = https.createServer(options, app);

// Configurar o Socket.IO
const io = new Server(server, {
    cors: {
        origin: "*", // Permite conexões de qualquer origem
        methods: ["GET", "POST"]
    },
    transports: ["websocket"], // Apenas WebSocket, sem polling
});

// Rota principal para teste
app.get('/', (req, res) => {
    res.send('<h1>Servidor HTTPS com WebSocket rodando! 🔐</h1>');
});

// Evento de conexão do Socket.IO
io.on("connection", (socket) => {
    console.log("✅ Usuário conectado:", socket.id);

    socket.on('create-message', async (msg) => {
        console.log("📩 Mensagem recebida:", msg.text, msg.nome, msg.data);

        let qry = `INSERT INTO messages_test VALUES (0, '${msg.text}', '${msg.nome}', STR_TO_DATE('${msg.data}', '%d/%m/%Y %H:%i:%s'));`;
        console.log('📌 Query:', qry);

        try {
            await executaQry(qry);
            io.emit('receive-message', [msg.text, msg.nome,msg.data]);
        } catch (error) {
            console.error("❌ Erro ao inserir mensagem no banco:", error);
        }
    });

    socket.on('read-message', async () => {
        let qry = `SELECT msg, nome, DATE_FORMAT(datahora, '%d/%m/%Y %H:%i:%s') AS datahora FROM messages_test;`;
        console.log("🔍 Consultando mensagens:", qry);
        try {
            const messages = await executaQry(qry);
            console.log("NOde 16",messages)
            socket.emit('receive-messages', messages);
        } catch (error) {
            console.error("❌ Erro ao buscar mensagens:", error);
        }
    });

    

    socket.on('disconnect', (reason) => {
        console.log('❌ Usuário desconectado:', socket.id, '| Motivo:', reason);
    });
});

// Iniciar servidor HTTPS na porta especificada
server.listen(porta, () => {
    console.log("🚀 Servidor rodando com WebSocket na porta " + porta);
});
