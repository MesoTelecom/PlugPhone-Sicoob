const express = require("express");
const cors = require("cors");
const https = require("https");
const fs = require("fs");
const history = require('connect-history-api-fallback');
const app = express();
const porta = 5001;

// Carregar certificados SSL




const options = {




  key: fs.readFileSync("/etc/letsencrypt/live/tel.sicoob.plugphone.cloud/privkey.pem"),
  cert: fs.readFileSync("/etc/letsencrypt/live/tel.sicoob.plugphone.cloud/fullchain.pem"),
};

app.use(cors());
app.use(history());
app.use("/", express.static(__dirname + "/dist"));

// Servidor HTTPS
https.createServer(options, app).listen(porta, () => {
  console.log(`Servidor HTTPS escutando na porta ${porta}`);
});
