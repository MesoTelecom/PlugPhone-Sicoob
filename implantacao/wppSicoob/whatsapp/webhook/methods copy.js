const axios = require('axios');
const { executaQry } = require('/meso/whatsapp/webhook/db');


let send = async function (to, body, nome, res) {
    console.log(to, body, nome)
    const requestOptions = {
        method: 'POST',
        headers: {
            "Content-Type": "application/json",
            'Authorization': "Bearer EABpILka8Wz0BO2G1rtqYyWSXcueuIsbQZCMYxt6xd3Dp39MB9CIVJxs1yBv9G8W0ZCdnpIdPi5ZAC3pgsqjDZCLwtCMefB5SSdj6p9KeZC56FxdjZBwENoK6B0vlm7jJo1induvWW3tpVQ9mElh1HPJVl8byZBnYACtcnKl4ZCfFemPoOZBLaDsQmIarSCTKDiKMq"
        },
        body: JSON.stringify({
            "messaging_product": "whatsapp", // Adicione o messaging_product aqui
            "recipient_type": "individual",
            to,
            "type": "text",
            "text": {
                "preview_url": false,
                body
            }
        })
    }
    try {
        const fetch = require('node-fetch');
        const response = await fetch("  https://graph.facebook.com/v21.0/116793154851650/messages", requestOptions);
        const data = await response.json();
        //////console.log(data);


        ////console.log('furia berserk',qry)
        let qry = `insert into meso_mensagens_solicitante (telefone,nome,agent,wpnumber,mensagem, type) values ('${to}','${nome}','${nome}','551131646301','${body}','text');`

        executaQry(qry)

        res.json(data);
        //////console.log('eu sou msg', body)
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: "Erro ao enviar a mensagem" });
    }
    ////console.log('sou o mensagem', requestOptions)

}



let getDocument = async function (caminho) {
    const axios = require('axios');
    const FormData = require('form-data');
    const fs = require('fs');
    let data = new FormData();
    data.append('messaging_product', 'whatsapp');
    console.log('eu sou o caminho', caminho);
    data.append('file', fs.createReadStream(caminho));

    let config = {
        method: 'post',
        maxBodyLength: Infinity,
        url: 'https://graph.facebook.com/v17.0/116793154851650/media',
        headers: {
            'Authorization': 'Bearer EABpILka8Wz0BO2G1rtqYyWSXcueuIsbQZCMYxt6xd3Dp39MB9CIVJxs1yBv9G8W0ZCdnpIdPi5ZAC3pgsqjDZCLwtCMefB5SSdj6p9KeZC56FxdjZBwENoK6B0vlm7jJo1induvWW3tpVQ9mElh1HPJVl8byZBnYACtcnKl4ZCfFemPoOZBLaDsQmIarSCTKDiKMq',
            ...data.getHeaders()
        },
        data: data
    };

    try {
        const response = await axios.request(config);
        let id = response.data.id;
        console.log(id);
        return id;
    } catch (error) {
        console.error(error);
        throw error;
    }
};


let getImage = async function (caminho) {
    const axios = require('axios');
    const FormData = require('form-data');
    const fs = require('fs');
    let data = new FormData();
    data.append('messaging_product', 'whatsapp');
    console.log('eu sou o caminho', caminho);
    data.append('file', fs.createReadStream(caminho));

    let config = {
        method: 'post',
        maxBodyLength: Infinity,
        url: 'https://graph.facebook.com/v17.0/116793154851650/media',
        headers: {
            'Authorization': 'Bearer EABpILka8Wz0BO2G1rtqYyWSXcueuIsbQZCMYxt6xd3Dp39MB9CIVJxs1yBv9G8W0ZCdnpIdPi5ZAC3pgsqjDZCLwtCMefB5SSdj6p9KeZC56FxdjZBwENoK6B0vlm7jJo1induvWW3tpVQ9mElh1HPJVl8byZBnYACtcnKl4ZCfFemPoOZBLaDsQmIarSCTKDiKMq',
            ...data.getHeaders()
        },
        data: data
    };

    try {
        const response = await axios.request(config);
        let id = response.data.id;
        console.log(id);
        return id;
    } catch (error) {
        console.error(error);
        throw error;
    }
};


let getAudio = async function (caminho) {
    const axios = require('axios');
    const FormData = require('form-data');
    const fs = require('fs');
    let data = new FormData();
    data.append('messaging_product', 'whatsapp');
   // console.log('eu sou o caminho', caminho);
    data.append('file', fs.createReadStream(caminho));

    let config = {
        method: 'post',
        maxBodyLength: Infinity,
        url: 'https://graph.facebook.com/v17.0/116793154851650/media',
        headers: {
            'Authorization': 'Bearer EABpILka8Wz0BO2G1rtqYyWSXcueuIsbQZCMYxt6xd3Dp39MB9CIVJxs1yBv9G8W0ZCdnpIdPi5ZAC3pgsqjDZCLwtCMefB5SSdj6p9KeZC56FxdjZBwENoK6B0vlm7jJo1induvWW3tpVQ9mElh1HPJVl8byZBnYACtcnKl4ZCfFemPoOZBLaDsQmIarSCTKDiKMq',
            ...data.getHeaders()
        },
        data: data
    };

    try {
        const response = await axios.request(config);
        let id = response.data.id;
       // console.log(id);
        return id;
    } catch (error) {
       // console.error(error);
        throw error;
    }
};

let sendImage = async function (to, id, usuario, res) {



    ////console.log('oque vem sem link', link)
    const requestOptions = {
        method: 'POST',
        headers: {
            "Content-Type": "application/json",
            'Authorization': "Bearer EABpILka8Wz0BO2G1rtqYyWSXcueuIsbQZCMYxt6xd3Dp39MB9CIVJxs1yBv9G8W0ZCdnpIdPi5ZAC3pgsqjDZCLwtCMefB5SSdj6p9KeZC56FxdjZBwENoK6B0vlm7jJo1induvWW3tpVQ9mElh1HPJVl8byZBnYACtcnKl4ZCfFemPoOZBLaDsQmIarSCTKDiKMq"
        },
        body: JSON.stringify({
            "messaging_product": "whatsapp", // Adicione o messaging_product aqui
            "recipient_type": "individual",
            to,
            "type": "image",
            "image": {
                id,

            }
        })
    }
    try {
        const fetch = require('node-fetch');
        const response = await fetch("  https://graph.facebook.com/v21.0/116793154851650/messages", requestOptions);
        const data = await response.json();
        //////console.log(data);


        let qry = `insert into meso_mensagens_solicitante (telefone,nome,agent,wpnumber,mensagem, type) values ('${to}','${usuario}','${usuario}','551131646301','${id}.jpeg','image');`
        ////console.log('furia berserk',qry)
        executaQry(qry)

        res.status(200);
        res.status(200).json({ data })
        //////console.log('eu sou msg', body)
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: "Erro ao enviar a mensagem" });
    }
    ////console.log('imagem aqui', requestOptions)
}

let sendAudio = async function (to, id, usuario, res) {



    ////console.log('oque vem sem link', link)
    const requestOptions = {
        method: 'POST',
        headers: {
            "Content-Type": "application/json",
            'Authorization': "Bearer EABpILka8Wz0BO2G1rtqYyWSXcueuIsbQZCMYxt6xd3Dp39MB9CIVJxs1yBv9G8W0ZCdnpIdPi5ZAC3pgsqjDZCLwtCMefB5SSdj6p9KeZC56FxdjZBwENoK6B0vlm7jJo1induvWW3tpVQ9mElh1HPJVl8byZBnYACtcnKl4ZCfFemPoOZBLaDsQmIarSCTKDiKMq"
        },
        body: JSON.stringify({
            "messaging_product": "whatsapp", // Adicione o messaging_product aqui
            "recipient_type": "individual",
            to,
            "type": "audio",
            "audio": {
                id,

            }
        })
    }
    try {
        const fetch = require('node-fetch');
        const response = await fetch("  https://graph.facebook.com/v21.0/116793154851650/messages", requestOptions);
        const data = await response.json();
        //////console.log(data);


        let qry = `insert into meso_mensagens_solicitante (telefone,nome,agent,wpnumber,mensagem, type) values ('${to}','${usuario}','${usuario}','551131646301','${id}.mp3','audio');`
        ////console.log('furia berserk',qry)
        executaQry(qry)

        res.status(200);
        res.status(200).json({ data })
        //////console.log('eu sou msg', body)
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: "Erro ao enviar a mensagem" });
    }
    ////console.log('imagem aqui', requestOptions)
}

let reciveMediaLink = async function (id, res) {
    // Opções de requisição
    const requestOptions = {
        method: 'GET', // Mudança: Alterado de POST para GET para buscar informações
        headers: {
            "Content-Type": "application/json",
            'Authorization': "Bearer EABpILka8Wz0BO2G1rtqYyWSXcueuIsbQZCMYxt6xd3Dp39MB9CIVJxs1yBv9G8W0ZCdnpIdPi5ZAC3pgsqjDZCLwtCMefB5SSdj6p9KeZC56FxdjZBwENoK6B0vlm7jJo1induvWW3tpVQ9mElh1HPJVl8byZBnYACtcnKl4ZCfFemPoOZBLaDsQmIarSCTKDiKMq" // Token de autorização
        }
    }; 

    try {
        const fetch = require('node-fetch');
        // Requisição para a API do Facebook
        const response = await fetch(`https://graph.facebook.com/v17.0/${id}`, requestOptions);
        const data = await response.json();
        console.log(data)
        // Mudança: Verifica se o campo url existe no retorno da API
        if (data && data.url) {
            // Retorna o JSON com as informações do áudio
            res.status(200).json(data);
        } else {
            // Retorna erro 404 se o áudio não for encontrado
            res.status(404).json({ error: "Áudio não encontrado" });
        }

    } catch (error) {
        // Tratamento de erro
        console.error(error);
        res.status(500).json({ error: "Erro ao obter o áudio" });
    }
};

let geraMedia = async function (url, res) {
    // Opções de requisição
    const requestOptions = {
        method: 'GET', // Mudança: Alterado de POST para GET para buscar informações
        headers: {
            "Content-Type": "application/json",
            'Authorization': "Bearer EABpILka8Wz0BO2G1rtqYyWSXcueuIsbQZCMYxt6xd3Dp39MB9CIVJxs1yBv9G8W0ZCdnpIdPi5ZAC3pgsqjDZCLwtCMefB5SSdj6p9KeZC56FxdjZBwENoK6B0vlm7jJo1induvWW3tpVQ9mElh1HPJVl8byZBnYACtcnKl4ZCfFemPoOZBLaDsQmIarSCTKDiKMq" // Token de autorização
        }
    }; 

    try {
        const fetch = require('node-fetch');
        // Requisição para a API do Facebook
        const response = await fetch(`https://graph.facebook.com/v17.0/${id}`, requestOptions);
        const data = await response.json();
        console.log(data)
        // Mudança: Verifica se o campo url existe no retorno da API
        if (data && data.url) {
            // Retorna o JSON com as informações do áudio
            res.status(200).json(data);
        } else {
            // Retorna erro 404 se o áudio não for encontrado
            res.status(404).json({ error: "Áudio não encontrado" });
        }

    } catch (error) {
        // Tratamento de erro
        console.error(error);
        res.status(500).json({ error: "Erro ao obter o áudio" });
    }
};



let sendVideo = async function (to, id, link, res) {






    const requestOptions = {
        method: 'POST',
        headers: {
            "Content-Type": "application/json",
            'Authorization': "Bearer EABpILka8Wz0BO2G1rtqYyWSXcueuIsbQZCMYxt6xd3Dp39MB9CIVJxs1yBv9G8W0ZCdnpIdPi5ZAC3pgsqjDZCLwtCMefB5SSdj6p9KeZC56FxdjZBwENoK6B0vlm7jJo1induvWW3tpVQ9mElh1HPJVl8byZBnYACtcnKl4ZCfFemPoOZBLaDsQmIarSCTKDiKMq"
        },
        body: JSON.stringify({
            "messaging_product": "whatsapp", // Adicione o messaging_product aqui
            "recipient_type": "individual",
            to,
            "type": "video",
            "video": {
                id,
                link
            }
        })
    }
    ////console.log('Calabreso', requestOptions)
    try {

        const fetch = require('node-fetch');
        const response = await fetch("  https://graph.facebook.com/v21.0/116793154851650/messages", requestOptions);
        const data = await response.json();
        //////console.log(data);


        let qry = `insert into meso_mensagens_solicitante (telefone,nome,agent,wpnumber,mensagem, type) values ('55${to}','Ian-Meso','Ian-Meso','551131646301','${body}','video');`
        ////console.log('furia berserk',qry)
        executaQry(qry)

        res.status(200);
        res.status(200).json({ data })
        //////console.log('eu sou msg', body)
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: "Erro ao enviar a mensagem" });
    }
}


let sendDocument = async (to, id, usuario, res) => {






    const requestOptions = {
        method: 'POST',
        headers: {
            "Content-Type": "application/json",
            'Authorization': "Bearer EABpILka8Wz0BO2G1rtqYyWSXcueuIsbQZCMYxt6xd3Dp39MB9CIVJxs1yBv9G8W0ZCdnpIdPi5ZAC3pgsqjDZCLwtCMefB5SSdj6p9KeZC56FxdjZBwENoK6B0vlm7jJo1induvWW3tpVQ9mElh1HPJVl8byZBnYACtcnKl4ZCfFemPoOZBLaDsQmIarSCTKDiKMq"
        },
        body: JSON.stringify({
            "messaging_product": "whatsapp", // Adicione o messaging_product aqui
            "recipient_type": "individual",
            to,
            "type": "document",
            "document": {
                id,                
            }
        })
    }
    try {
        const fetch = require('node-fetch');
        const response = await fetch("  https://graph.facebook.com/v21.0/116793154851650/messages", requestOptions);
        const data = await response.json();
        //////console.log(data);


        let qry = `insert into meso_mensagens_solicitante (telefone,nome,agent,wpnumber,mensagem, type) values ('${to}','${usuario}','${usuario}','551131646301','${id}','document');`
        ////console.log('furia berserk',qry)
        executaQry(qry)

        res.status(200);
        res.status(200).json({ data })
        //////console.log('eu sou msg', body)
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: "Erro ao enviar a mensagem" });
    }
}
let sendTemplateMenu = async (to, name, res) => {
    console.log('Enviando template menu...')
    const requestOptions = {
        method: 'POST',
        headers: {
            "Content-Type": "application/json",
            'Authorization': "Bearer EABpILka8Wz0BO2G1rtqYyWSXcueuIsbQZCMYxt6xd3Dp39MB9CIVJxs1yBv9G8W0ZCdnpIdPi5ZAC3pgsqjDZCLwtCMefB5SSdj6p9KeZC56FxdjZBwENoK6B0vlm7jJo1induvWW3tpVQ9mElh1HPJVl8byZBnYACtcnKl4ZCfFemPoOZBLaDsQmIarSCTKDiKMq"
        },
        body: JSON.stringify({
            "messaging_product": "whatsapp",
            to,
            "type": "template",
            "template": {
                name,
                "language": {
                    "code": "pt_BR"
                }
            }
        })
    }
    try {
        const fetch = require('node-fetch');
        const response = await fetch("  https://graph.facebook.com/v21.0/116793154851650/messages", requestOptions);
        const data = await response.json();

        // Inserir dados no banco após enviar a mensagem
        let qry = `insert into meso_mensagens_solicitante (telefone, whatsappid, nome,agent,wpnumber,mensagem, type) values ('${to}','${to}','Template-Precavida','Template-Precavida','551131646301','${name}','document');`
        await executaQry(qry);

        // Retorna a resposta aqui
        if (!res.headersSent) {
            return res.status(200).json({ data });
        }
    } catch (error) {
        console.error(error);

        // Verifica se os cabeçalhos já foram enviados antes de enviar a resposta de erro
        if (!res.headersSent) {
            return res.status(500).json({ error: "Erro ao enviar a mensagem" });
        }
    }
}

let sendTemplate = async (to, name, usuario, res) => {
console.log('Caramelo')
    const requestOptions = {
        method: 'POST',
        headers: {
            "Content-Type": "application/json",
            'Authorization': "Bearer EABpILka8Wz0BO2G1rtqYyWSXcueuIsbQZCMYxt6xd3Dp39MB9CIVJxs1yBv9G8W0ZCdnpIdPi5ZAC3pgsqjDZCLwtCMefB5SSdj6p9KeZC56FxdjZBwENoK6B0vlm7jJo1induvWW3tpVQ9mElh1HPJVl8byZBnYACtcnKl4ZCfFemPoOZBLaDsQmIarSCTKDiKMq"
        },
        body: JSON.stringify({
            "messaging_product": "whatsapp",
            to,
            "type": "template",
            "template": {
                name,
                "language": {
                    "code":
                        "pt_BR"
                }
            }

        })
    }
    try {
        const fetch = require('node-fetch');
        const response = await fetch("  https://graph.facebook.com/v21.0/116793154851650/messages", requestOptions);
        const data = await response.json();
        //////console.log(data);


        let qry = `insert into meso_mensagens_solicitante (telefone,nome,agent,wpnumber,mensagem, type) values ('${to}','${usuario}','${usuario}','551131646301','${name}','document');`
        ////console.log('furia berserk',qry)
        executaQry(qry)

        res.status(200);
        res.status(200).json({ data })
        //////console.log('eu sou msg', body)
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: "Erro ao enviar a mensagem" });
    }
}
let test = function(){
   return console.log('test')
}

let download = async function (id, nome, formato, res) {




    const requestOptions = {
        method: "GET",
        headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer EABpILka8Wz0BO2G1rtqYyWSXcueuIsbQZCMYxt6xd3Dp39MB9CIVJxs1yBv9G8W0ZCdnpIdPi5ZAC3pgsqjDZCLwtCMefB5SSdj6p9KeZC56FxdjZBwENoK6B0vlm7jJo1induvWW3tpVQ9mElh1HPJVl8byZBnYACtcnKl4ZCfFemPoOZBLaDsQmIarSCTKDiKMq"
        }
    };

    try {
        // Obter informações com base no ID
        const response = await axios.get(`https://graph.facebook.com/v17.0/${id}`, requestOptions);
        //////console.log('Ola eu sou response', response.data);

        // Baixar o arquivo usando a URL obtida acima
        const response1 = await axios.get(response.data.url, requestOptions);
        res.json(response1.data.url);

        // Configuração para download de arquivo em formato PDF
        const instance = axios.create({
            responseType: 'arraybuffer',
            headers: {
                "Content-Type": "application/pdf",
                'Authorization': "Bearer EABpILka8Wz0BO2G1rtqYyWSXcueuIsbQZCMYxt6xd3Dp39MB9CIVJxs1yBv9G8W0ZCdnpIdPi5ZAC3pgsqjDZCLwtCMefB5SSdj6p9KeZC56FxdjZBwENoK6B0vlm7jJo1induvWW3tpVQ9mElh1HPJVl8byZBnYACtcnKl4ZCfFemPoOZBLaDsQmIarSCTKDiKMq"
            }
        });

        // Realiza o download do arquivo
        instance.get(response.data.url)
            .then(function (response) {
                //////console.log("ola eu sou o response", response.data);
                // Escrever o arquivo no sistema de arquivos
                fs.writeFile(`${nome}` + `.${formato}`, response.data, err => {
                    if (err) {
                        //////console.log(err);
                    }
                    //////console.log("Deu Certo Aleluia Gloria DEUS!!!!!!!!!!!");
                });
            })
            .catch(function (error) {
                //////console.log("Ola eu sou o erro", error);
            });
    } catch (erro) {
        console.error(erro, "Algo de errado não esta certo");
        res.status(500).json({ error: "Erro ao baixar a mensagem" });
    }
    ////console.log('Documento Aqui', requestOptions)
};

module.exports = { send, sendImage, sendVideo, sendAudio, sendDocument, download, getImage, getAudio, sendTemplate, sendTemplateMenu , getDocument , test, reciveMediaLink, geraMedia}