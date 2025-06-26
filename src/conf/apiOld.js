import axios from "axios";

export const api = axios.create({
  baseURL: `http://192.168.4.53:3883/`,
  headers: {
    "Access-Control-Allow-Origin": "*",
    "Content-Type": "application/json",
    //"x-access-token": localStorage.getItem("jwt")
  },
});