import axios from "axios";

export const api = axios.create({
 // baseURL: `http>://10.109.5.31:1339`,
  baseURL: `https://tel.sicoob.plugphone.cloud:1339`,
  headers: {
    "Access-Control-Allow-Origin": "*",
    "Content-Type": "application/json",
    //"x-access-token": localStorage.getItem("jwt")
  },
});