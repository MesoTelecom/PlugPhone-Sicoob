import axios from "axios";

export const apiWP = axios.create({
  baseURL: `https://whatsapp.sicoob.plugphone.cloud:5995`,
  headers: {
    "Access-Control-Allow-Origin": "*",
    "Content-Type": "application/json",
    //"x-access-token": localStorage.getItem("jwt")
  },
});