const express = require("express");
const helmet = require("helmet");

const body_parser = require("body-parser");
const https = require("https");
const fs = require("fs");
const cors = require("cors");
const axios = require("axios");

const app = express().use(body_parser.json());
const porta = 3000;

const options = {
  key: fs.readFileSync(
    "/etc/letsencrypt/live/whatsapp.sicoob.plugphone.cloud/privkey.pem"
  ),
  cert: fs.readFileSync(
    "/etc/letsencrypt/live/whatsapp.sicoob.plugphone.cloud/fullchain.pem"
  ),
};

app.use(helmet());

app.use(
  cors({
    origin: "graph.facebook.com", // Permite qualquer origem
    methods: ["GET", "POST"],
    allowedHeaders: ["my-custom-header"],
    credentials: true,
  })
);

// app.use((req, res, next) => {
//     res.setHeader("Access-Control-Allow-Origin", "*"); // Permite qualquer origem
//     res.setHeader("Access-Control-Allow-Methods", "GET, POST");
//     res.setHeader("Access-Control-Allow-Headers", "my-custom-header");
//     res.setHeader("Access-Control-Allow-Credentials", "true");
//     //console.log('Response Headers:', res.getHeaders());
//     next();
// });

const server = https.createServer(options, app);

// Rota inicial
app.get("/", (req, res) => {
  res.json({
    funcionou: false,
    msg: "WEBHOOK",
    dados: [],
  });
});

// Rota de webhook para receber dados POST
app.post("/webhooks", async (req, res) => {
  //  console.log("req post", req);
  console.log("req post headers", req.headers);
  console.log("req post host", req.socket.remoteAddress);
  console.log("req post body", req.body);
  // await axios.post('https://meso.plugphone.cloud:3333/webhooks', {req: req.body})
  // .then(response => {
  //   console.log('Resposta:', response.data);
  // })
  // .catch(error => {
  //   console.error('Erro:', error.message);
  // });
  res.status(200).end();
});

// Rota de webhook para verificação de integridade
app.get("/webhooks", (req, res) => {
  console.log("req get", req);
  console.log("req headers", req.headers);
  console.log("req host", req.socket.remoteAddress);
  //  res.status(200).end();
  let hub = {};
  hub.mode = req.query["hub.mode"];
  hub.challenge = req.query["hub.challenge"];
  hub.verify_token = req.query["hub.verify_token"];
  //console.log(req.query, hub);
  let resposta = hub.challenge;
  res.send(resposta);
});

server.listen(porta, () => {
  console.log("API server online and running in port " + porta);
});
