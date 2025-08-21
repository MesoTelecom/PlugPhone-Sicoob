const express = require("express");
const https = require("https");
const fs = require("fs");
const cors = require("cors");
//const helmet = require("helmet");
const app = express();
const porta = 3001;

app.use(cors({ origin: "*" }));
//app.use(helmet());
//app.use("/", express.static(__dirname + "/public"));

const httpsOptions = {
  key: fs.readFileSync(
    "/etc/letsencrypt/live/whatsapp.sicoob.plugphone.cloud/privkey.pem"
  ),
  cert: fs.readFileSync(
    "/etc/letsencrypt/live/whatsapp.sicoob.plugphone.cloud/fullchain.pem"
  ),
};

app.post("/webhooks", (req, res) => {
  console.log("req post", req);
  res.send("ok");
});

const server = https.createServer(httpsOptions, app).listen(porta, () => {
  console.log("server running at " + porta);
});
