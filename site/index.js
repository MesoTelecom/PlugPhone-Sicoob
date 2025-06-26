const fs = require('fs');
const http = require('http');
const https = require('https');
const express = require('express');
const express = require("express");
const cors = require("cors");
const app = express();
const history = require('connect-history-api-fallback');
const porta = 5001;

const privateKey = fs.readFileSync('/etc/letsencrypt/live/acciolymaringa.plugphone.cloud/privkey.pem', 'utf8');
const certificate = fs.readFileSync('/etc/letsencrypt/live/acciolymaringa.plugphone.cloud/cert.pem', 'utf8');
const ca = fs.readFileSync('/etc/letsencrypt/live/acciolymaringa.plugphone.cloud/chain.pem', 'utf8');


app.use(cors());
app.use(history());
app.use("/", express.static(__dirname + "/dist"));

app.listen(porta);
console.log("escutando na porta 5001")
