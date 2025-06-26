const axios = require("axios");

const api = axios.create({
 // baseURL: `http>://10.109.5.31:1339`,
  baseURL: `https://whatsapp.sicoob.plugphone.cloud:5995`,
  headers: {
    "Access-Control-Allow-Origin": "*",
    "Content-Type": "application/json",
    //"x-access-token": localStorage.getItem("jwt")
  },
});

module.exports= { api }