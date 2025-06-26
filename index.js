const express = require("express");
const cors = require("cors");
const app = express();
const porta = 5001;

app.use(cors());
app.use("/", express.static(__dirname + "/dist"));

app.listen(porta);
console.log("escutando na porta 5001")
