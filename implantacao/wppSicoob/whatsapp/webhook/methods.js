const axios = require('axios');
const { executaQry } = require('/meso/whatsapp/webhook/db');


let send = async function (to, body, nome, res) {
    console.log(to, body, nome)
    const requestOptions = {
        method: 'POST',
        headers: {
            "Content-Type": "application/json",
            'Authorization': "",
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
        const response = await fetch("  https://graph.facebook.com/v21.0/421167414412878/messages", requestOptions);
        const data = await response.json();
        //////console.log(data);

        let query = `SELECT protocolo  FROM meso_mensagens_solicitante  WHERE protocolo IS NOT NULL  ORDER BY id DESC limit 1;`
        let protocolo = await executaQry(query)
        console.log("chuchu blz", protocolo.dados[0].protocolo)

        let qry = `insert into meso_mensagens_solicitante (telefone,nome,agent,wpnumber,mensagem, type,protocolo) values ('${to}','${nome}','${nome}','553130580254','${body}','text','${protocolo.dados[0].protocolo}');`

        ////console.log('furia berserk',qry)
        executaQry(qry)

        //res.json(data);
        //////console.log('eu sou msg', body)
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: "Erro ao enviar a mensagem" });
    }
    ////console.log('sou o mensagem', requestOptions)

}


let sendprotocolo = async function (to, body, nome, res) {
    console.log('Caralho Que Merda', to, body, nome)
    const requestOptions = {
        method: 'POST',
        headers: {
            "Content-Type": "application/json",
            'Authorization': "",
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
        const response = await fetch("  https://graph.facebook.com/v21.0/421167414412878/messages", requestOptions);
        const data = await response.json();
        //////console.log(data);

        let qry = `insert into meso_mensagens_solicitante (telefone,nome,agent,wpnumber,mensagem, type, values ('${to}','${nome}','${nome}','553130580254','${body}','protocolo');`

        ////console.log('furia berserk',qry)
        executaQry(qry)



        res.json(data);

        //////console.log('eu sou msg', body)
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: "Erro ao enviar a mensagem" });
    }
    ////console.log('sou o mensagem', requestOptions)

}

let getAniversariante = async function () {
    try {
        let config = {
            method: 'get',
            maxBodyLength: Infinity,
            url: 'https://whatsapp.sicoob.plugphone.cloud:3002/api/v1/associados/aniversariantes-hoje',
            headers: {
                'Accept': 'application/json'
            }
        };

        const response = await axios.request(config);
        return response.data;

    } catch (error) {
        console.error('Erro ao buscar aniversariantes na API externa:', error.message);
        throw error; // relança pra rota pegar
    }
};


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
        url: 'https://graph.facebook.com/v17.0/421167414412878/media',
        headers: {
            'Authorization': "",
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
        url: 'https://graph.facebook.com/v17.0/421167414412878/media',
        headers: {
            'Authorization': "",
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
        url: 'https://graph.facebook.com/v17.0/421167414412878/media',
        headers: {
            'Authorization': "",
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
            'Authorization': "",
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
        const response = await fetch("  https://graph.facebook.com/v21.0/421167414412878/messages", requestOptions);
        const data = await response.json();
        //////console.log(data);


        let qry = `insert into meso_mensagens_solicitante (telefone,nome,agent,wpnumber,mensagem, type) values ('${to}','${usuario}','${usuario}','553130580254','${id}.jpeg','image');`
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
            'Authorization': "",
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
        const response = await fetch("  https://graph.facebook.com/v21.0/421167414412878/messages", requestOptions);
        const data = await response.json();
        //////console.log(data);


        let qry = `insert into meso_mensagens_solicitante (telefone,nome,agent,wpnumber,mensagem, type) values ('${to}','${usuario}','${usuario}','553130580254','${id}.mp3','audio');`
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
            'Authorization': "",
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
            'Authorization': "",
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
            'Authorization': "",
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
        const response = await fetch("  https://graph.facebook.com/v21.0/421167414412878/messages", requestOptions);
        const data = await response.json();
        //////console.log(data);


        let qry = `insert into meso_mensagens_solicitante (telefone,nome,agent,wpnumber,mensagem, type) values ('55${to}','Ian-Meso','Ian-Meso','553130580254','${body}','video');`
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


let sendDocument = async (to, id, filename, usuario, res) => {






    const requestOptions = {
        method: 'POST',
        headers: {
            "Content-Type": "application/json",
            'Authorization': "",
        },
        body: JSON.stringify({
            "messaging_product": "whatsapp", // Adicione o messaging_product aqui
            "recipient_type": "individual",
            to,
            "type": "document",
            "document": {
                filename,
                id,
            }
        })
    }
    try {
        const fetch = require('node-fetch');
        const response = await fetch("  https://graph.facebook.com/v21.0/421167414412878/messages", requestOptions);
        const data = await response.json();
        //////console.log(data);


        let qry = `insert into meso_mensagens_solicitante (telefone,nome,agent,wpnumber,mensagem, type) values ('${to}','${usuario}','${usuario}','553130580254','${id}','document');`
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
            'Authorization': "",
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
        const response = await fetch("  https://graph.facebook.com/v21.0/421167414412878/messages", requestOptions);
        const data = await response.json();

        // Inserir dados no banco após enviar a mensagem
        let qry = `insert into meso_mensagens_solicitante (telefone, whatsappid, nome,agent,wpnumber,mensagem, type) values ('${to}','${to}','Template-Precavida','Template-Precavida','553130580254','${name}','document');`
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
            'Authorization': "",
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
        const response = await fetch("  https://graph.facebook.com/v21.0/421167414412878/messages", requestOptions);
        const data = await response.json();
        //////console.log(data);


        let qry = `insert into meso_mensagens_solicitante (telefone,nome,agent,wpnumber,mensagem, type) values ('${to}','${usuario}','${usuario}','553130580254','${name}','document');`
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
let test = function () {
    return console.log('test')
}

function gerarProtocolo() {
    const caracteres = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'; // Conjunto de caracteres
    let protocolo = '';

    for (let i = 0; i < 6; i++) {
        const randomIndex = Math.floor(Math.random() * caracteres.length);
        protocolo += caracteres[randomIndex];
    }

    return protocolo;
}

let download = async function (id, nome, formato, res) {




    const requestOptions = {
        method: "GET",
        headers: {
            "Content-Type": "application/json",
            "Authorization": "",
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
                'Authorization': "",
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


let sendGpt = async function (mensagem) {
    const axios = require('axios');

    let data = {
        "model": "gpt-4o-mini",
        "messages": [
            {
                "role": "user",
                "content": mensagem
            }
        ]
    };

    let config = {
        method: 'post',
        url: 'https://api.openai.com/v1/chat/completions',
        headers: {
            'Content-Type': 'application/json',
            'Authorization': "",
        },
        data: data
    };

    try {
        let response = await axios.request(config);
        console.log(JSON.stringify(response.data)); // Log da resposta completa

        let resposta = response.data.choices[0].message.content;
        console.log('eu sou a resposta PLIN PLIN PLON', resposta);

        return resposta; // Retorna a resposta corretamente
    } catch (error) {
        console.error('Erro na requisição:', error);
        return 'Erro ao processar a resposta do GPT'; // Retorna uma mensagem de erro amigável
    }
};

async function
    verificaPalavrao(mensagem) {
    try {
        // Verifica se há palavrão na lista fixa
        const palavroesExtras = [
            "puta", "merda", "caralho", "fdp", "bosta",
            "desgraçado", "arrombado", "vagabunda", "escroto",
            "filho da puta", "vadia", "porra", "cacete", "corno"
        ];
        let temNaLista = palavroesExtras.some((palavra) =>
            mensagem.toLowerCase().includes(palavra)
        );

        let response = await axios.post(
            "https://api.openai.com/v1/moderations",
            { input: mensagem },
            {
                headers: {
                    "Content-Type": "application/json",
                    'Authorization': "",
                },
            }
        );

        let resultado = response.data.results[0];

        let limite = 0.02;
        let temPalavrao =
            temNaLista ||
            resultado.flagged ||
            resultado.category_scores["sexual"] > limite ||
            resultado.category_scores["harassment"] > limite ||
            resultado.category_scores["hate"] > limite ||
            resultado.category_scores["violence"] > limite ||
            resultado.category_scores["self-harm"] > limite;

        console.log("Moderação:", resultado);
        console.log("Palavrão detectado?", temPalavrao);

        return temPalavrao;
    } catch (error) {
        console.error("Erro na moderação:", error);
        return false;
    }
}

<<<<<<< Updated upstream
module.exports = { send, gerarProtocolo, sendImage, sendVideo, sendAudio, sendDocument, download, getImage, getAudio, sendTemplate, sendTemplateMenu, getDocument, test, reciveMediaLink, geraMedia, sendprotocolo, verificaPalavrao, getAniversariante }
=======
module.exports = { send, gerarProtocolo, sendImage, sendVideo, sendAudio, sendDocument, download, getImage, getAudio, sendTemplate, sendTemplateMenu, getDocument, test, reciveMediaLink, geraMedia, sendprotocolo, verificaPalavrao }
>>>>>>> Stashed changes
