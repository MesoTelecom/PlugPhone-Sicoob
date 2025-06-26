import axios from "axios";

export const api2 = axios.create({
    baseURL: `https://whatsapp.sicoob.plugphone.cloud:1308`,
    headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
        //"x-access-token": localStorage.getItem("jwt")
    },
});