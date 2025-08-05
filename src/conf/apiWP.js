import axios from "axios";

export const apiWP = axios.create({
    baseURL: `https://wpp.sicoobnossacoop.com.br:3993`,
  headers: {
    "Access-Control-Allow-Origin": "*",
    "Content-Type": "application/json",
    //"x-access-token": localStorage.getItem("jwt")
  },
});