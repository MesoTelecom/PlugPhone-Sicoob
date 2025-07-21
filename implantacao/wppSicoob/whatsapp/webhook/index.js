const express = require("express");
const helmet = require("helmet");
const { socketConnection } = require("./SocketConnection");
const { api } = require("./api.js");
const { v4 } = require("uuid");
const body_parser = require("body-parser");
const https = require("https");
const fs = require("fs");
const cors = require("cors");
const axios = require("axios");
const { executaQry } = require('/meso/whatsapp/webhook/db');
const { send, sendImage, sendVideo, sendAudio, sendDocument, sendTemplate, download, sendTemplateMenu, reciveMediaLink, gerarProtocolo, sendprotocolo } = require('./methods');
const { emitMensagem, emitImage, emitAudio, emitDocument, emitContatos, emitContatosFlutter, emitMensagemFlutter, emitCadastroMensagem, cadastrarMensagem } = require("./emit");
const { Socket } = require("socket.io");
const app = express().use(body_parser.json());
const porta = 3000;
const admin = require('firebase-admin');
const bodyParser = require('body-parser');
const dadosSocket = require('./cache/filtro.js')




let tokens = [];
const serviceAccount = require('./plugphone-2d637-firebase-adminsdk-fbsvc-1096a56db2.json'); // Substitua pelo caminho correto
const { componentsToColor } = require("pdf-lib");

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
});

console.log("Sou admin", admin.app().options)

let entry;

require('dotenv').config();

const options = {
    key: fs.readFileSync("/etc/letsencrypt/live/whatsapp.sicoob.plugphone.cloud/privkey.pem"),
    cert: fs.readFileSync("/etc/letsencrypt/live/whatsapp.sicoob.plugphone.cloud/fullchain.pem")
};

app.use(helmet());

app.use(cors({
    origin: "graph.facebook.com", // Permite qualquer origem
    methods: ["GET", "POST"],
    allowedHeaders: ["my-custom-header"],
    credentials: true
}));

app.use((req, res, next) => {
    res.setHeader("Access-Control-Allow-Origin", "*"); // Permite qualquer origem
    res.setHeader("Access-Control-Allow-Methods", "GET, POST");
    res.setHeader("Access-Control-Allow-Headers", "my-custom-header");
    res.setHeader("Access-Control-Allow-Credentials", "true");
    //console.log('Response Headers:', res.getHeaders());
    next();
});

const server = https.createServer(options, app);

const io = require('socket.io')(server, {
    cors: {
        origin: "*", // Permite qualquer origem
        methods: ["GET", "POST"],
        allowedHeaders: ["my-custom-header"],
        credentials: true
    }
});

server.listen(porta, () => {
    //console.log("API server online and running in port " + porta);
});


// Rota inicial
app.get("/", (req, res) => {
    res.json({
        funcionou: false,
        msg: "WEBHOOK",
        dados: [],
    });
});

// Inicia a conexão do Socket.IO
socketConnection(io);

// Rota de webhook para receber dados POST
app.post("/webhooks", async (req, res) => {
    let body_param = req.body;

    console.log('Negocio aqui', JSON.stringify(body_param))

    //console.log('Webhook recebido!');

    let tudo = body_param
    //console.log('FALA FILHA DA PUTA!!!!!!!!!!',tudo.entry[0].changes[0].value.metadata.display_phone_number)
    let numRecebe = tudo.entry[0].changes[0].value.metadata.display_phone_number

    //let visualização = tudo?.entry?.[0].changes?.[0].value?.statuses?.[0].status


    // Verificação segura para evitar erros de leitura de propriedades
    let numeroWhatsapp = body_param?.entry?.[0]?.changes?.[0]?.value?.contacts?.[0]?.wa_id;

    if (!numeroWhatsapp) {
        //console.log('O número de WhatsApp não foi encontrado.');
        return res.status(400).json({ error: "Número de WhatsApp não encontrado na requisição" });
    }


    let qry = `select count(whatsappid) as quantNum from meso_mensagens_solicitante where whatsappid = '${numeroWhatsapp}' and DATE(datetime) = CURDATE()`;
    let quantNumArray = await executaQry(qry);
    let quantNum = quantNumArray.dados[0].quantNum;

    let qry1 = `select estado from meso_mensagens_solicitante where type = 'protocolo' and telefone = '${numeroWhatsapp}'  order by id desc  limit 1`
    //console.log('qry 1', qry1)
    let estado = await executaQry(qry1)
    //console.log('estado', estado)
    let estadoProtocolo = estado.dados.length > 0 ? estado.dados[0].estado : ""
    //console.log(quantNum, 'e o outro', estadoProtocolo)

    if (quantNum >= 1 && estadoProtocolo === 'aberto') {


        //console.log(body_param);
        entry = body_param.entry[0]
        //console.log(entry.changes[0].value);
        let mensagem
        //console.log('eu sou tudo antes de tudo', tudo.entry[0].value)
        if (tudo.entry[0].changes[0].value.messages) {
            //console.log("Ninho de mafagafos")
            if (tudo.entry[0].changes[0].value.messages[0].type == 'text' && numRecebe == '553130580254') {
                try {
                    //console.log('o furacao tbm fura o gato?')
                    mensagem = entry.changes[0].value.messages[0]
                    produto = entry.changes[0].value


                    //console.log('teste produto', produto.value)
                    //console.log(mensagem, 'recebi')
                    //console.log('maioria', tudo.entry[0].changes[0].value.messages[0].text.body)
                    //console.log('eu sou tudo antes do if', tudo)

                    let type = tudo.entry[0].changes[0].value.messages[0].type
                    let msg = tudo.entry[0].changes[0].value.messages[0].text.body
                    //console.log('eu sou msg', msg)
                    let nome = tudo.entry[0].changes[0].value.contacts[0].profile.name
                    //console.log('eu sou nome', nome)
                    let waId = tudo.entry[0].changes[0].value.contacts[0].wa_id
                    //console.log('eu sou waId', waId)

                    let query = `SELECT protocolo  FROM meso_mensagens_solicitante  WHERE protocolo IS NOT NULL  ORDER BY id DESC limit 1;`
                    let protocolo = await executaQry(query)
                    //console.log("chuchu blz", protocolo.dados[0].protocolo)
                    let qry = `insert into meso_mensagens_solicitante (nome, whatsappid, mensagem, telefone, type,protocolo ) VALUES ('${nome}', '${waId}','${msg}','${waId}','${type}','${protocolo.dados[0].protocolo}');`
                    //console.log('veia chata', qry)
                    executaQry(qry)
                    let qry1 = `select max(id) as id from meso_mensagens_solicitante where telefone = ${waId}`
                    //console.log('Vai a merda',qry1)
                    let id = await executaQry(qry1)
                    //console.log('Homem solitário',id.dados[0].id)
                    //console.log("Furação de fogo")
                    let qry44 = `update meso_contatos set estado = 'Aguardando Atendimento' where telefone like '%${waId}%';`
                    //console.log('veia chata', qry44)
                    await executaQry(qry44)



                    /*if (visualização !== 'send') {
                       //console.log('Foi o Lucas')
                        let qry2 = `updadate meso_mensagem_solicitante set visualizacao = ${visualização} where id = ${id.dados[0].id}`
                        executaQry(qry2)
                       //console.log(qry2)
                    }*/
                    // pegatokenfire(msg, nome)
                    atualizaContato(msg, waId)
                    //console.log("Chiclete ", mensagem)


                    let qry5 = `select count(*) as contatoExiste from meso_contatos where telefone = '${waId}';`

                    //console.log(qry5)
                    let contatoExisteArray = await executaQry(qry5)

                    let contatoExiste = contatoExisteArray.dados[0].contatoExiste


                    //console.log('Eu sou o contatoExiste', contatoExiste)


                    if (nome != 'template_plugphone2' && contatoExiste == 0) {
                        const listaCampanha = ['Aniversário', 'Negocie Já', 'Debitos', 'Boas Vindas'];
                        const campanha = listaCampanha[Math.floor(Math.random() * listaCampanha.length)];
                        const qry4 = `INSERT INTO meso_contatos (nome, telefone, campanha) VALUES ('${nome}', '${waId}', '${campanha}');`;
                        executaQry(qry4);
                    }


                    const agora = new Date();
                    const horaFormatada = new Intl.DateTimeFormat('pt-BR', {
                        day: '2-digit',
                        month: '2-digit',
                        year: 'numeric',
                        hour: '2-digit',
                        minute: '2-digit',
                        second: '2-digit',
                    }).format(agora);
                    //console.log('minha msg', horaFormatada)

                    let msgEnviada = {
                        telefone: waId,
                        nome: nome,
                        agente: '',
                        mensagem: msg,
                        type: 'text',
                        datetime: horaFormatada
                    }

                    //console.log('eu sou o msgEnviada', msgEnviada)
                    emitMensagem(io, nome, msg, waId)
                    io.emit('receive-message', [
                        msgEnviada.telefone,
                        msgEnviada.nome,
                        msgEnviada.agente,
                        '551131646301',
                        msgEnviada.mensagem,
                        msgEnviada.type,
                        msgEnviada.datetime
                    ]);

                    let qryBuscaEstadoCampanha = `select * from estado_contato;`
                    let estadoCampanha = await executaQry(qryBuscaEstadoCampanha)

                    let qryContatos = `select * from meso_contatos`
                    let contatosValor = await executaQry(qryContatos)

                    //console.log("My contacts", contatosValor.dados)

                    const estadosValidos = [
                        'Novo',
                        'Aguardando Cliente',
                        'Aguardando Atendimento',
                        'Concluido'
                    ];

                    const agrupados = {
                        'Todos': contatosValor.dados,
                        'Novo': [],
                        'Aguardando Cliente': [],
                        'Aguardando Atendimento': [],
                        'Concluido': []
                    };

                    contatosValor.dados.forEach(element => {
                        const estado = element.estado;

                        if (estadosValidos.includes(estado)) {
                            agrupados[estado].push({
                                estado: element.estado,
                                nome: element.nome,
                                usuario: element.usuario,
                                telefone: element.telefone,
                                ultimamsg: element.ultimamsg,
                                setor: element.setor,
                                datahora: element.datahora

                            });
                        } else {
                            //console.log('Estado desconhecido ou não tratado:', estado);
                        }
                    });

                    io.emit('contatos', agrupados)

                    let qry4 = `update meso_contatos set estado = 'Aguardando Atendimento' where telefone like '%${waId}%';`
                    //console.log('veia chata', qry4)
                    await executaQry(qry4)

                    let qryMandaToken = `select usuario, setor from meso_contatos where telefone = '${waId}'`
                    let mandaToken = await executaQry(qryMandaToken)
                    //console.log("Manda meu setor", mandaToken.dados[0].setor)
                    //     //estado, usuario, setor, tipo
                    //    // await emitContatosFlutter(io, estadoCampanha.dados[0].estado, mandaToken.dados[0].usuario, mandaToken.dados[0].setor, mandaToken.dados[0].tipo)

                    if (mandaToken.dados[0].usuario == null || mandaToken.dados[0].usuario == "") {
                        pegatokenfire(msg, nome, null, mandaToken.dados[0].setor)
                        //console.log("me retorna aqui usuario nulo");
                    } else {
                        pegatokenfire(msg, nome, mandaToken.dados[0].usuario, null)
                        //console.log("me retorna aqui setor");
                    }

                    //console.log("Depois me mostre", mandaToken.dados[0].usuario, mandaToken.dados[0].setor)
                    // await emitContatosFlutter(io, estadoCampanha.dados[0].estado, estadoCampanha.dados[0].campanha)

                } catch (error) {
                    console.error("Erro ao processar mensagem:", error);
                }
            }
            else if (tudo.entry[0].changes[0].value.messages[0].type == 'button' && numRecebe == '553130580254') {
                try {
                    mensagem = entry.changes[0].value.messages[0]
                    produto = entry.changes[0].value.messaging_product

                    //console.log('teste produto', produto.value)
                    //console.log(mensagem, 'recebi')
                    //console.log('maioria', tudo.entry[0].changes[0].value.messages[0].text.body)
                    //console.log('eu sou tudo antes do if', tudo)

                    let type = tudo.entry[0].changes[0].value.messages[0].type
                    let msg = tudo.entry[0].changes[0].value.messages[0].button.text
                    //console.log('eu sou msg', msg)
                    let nome = tudo.entry[0].changes[0].value.contacts[0].profile.name
                    //console.log('eu sou nome', nome)
                    let waId = tudo.entry[0].changes[0].value.contacts[0].wa_id
                    //console.log('eu sou waId', waId)

                    let qry = `insert into meso_mensagens_solicitante (nome, whatsappid, mensagem, telefone, type ) VALUES ('${nome}', '${waId}','${msg}','${waId}','${type}');`
                    //console.log(qry)

                    executaQry(qry)
                    let qry1 = `update meso_contatos set setor = '${msg}' where telefone = '${waId}'`
                    executaQry(qry1)
                    //console.log('eu sou o teste qry1', qry1)
                    let qry4 = `update meso_contatos set estado = 'Novo' where telefone = '${waId}'`
                    executaQry(qry4)
                    let qry5 = `select count(*) as contatoExiste from meso_contatos where telefone = '${waId}';`

                    let qryBuscaContato = `select * from meso_contatos where estado = 'Novo'`;
                    let resultBuscaContato = await executaQry(qryBuscaContato)
                    //console.log("resultBuscarContato", resultBuscaContato);
                    io.emit('contatos', resultBuscaContato.dados);

                    //console.log(qry5)



                    //console.log('Eu sou o contatoExiste', contatoExiste)


                    if (nome != 'template_plugphone2' && contatoExiste == 0) {
                        const listaCampanha = ['Aniversário', 'Negocie Já', 'Debitos', 'Boas Vindas'];
                        const campanha = listaCampanha[Math.floor(Math.random() * listaCampanha.length)];
                        const qry4 = `INSERT INTO meso_contatos (nome, telefone, campanha) VALUES ('${nome}', '${waId}', '${campanha}');`;
                        executaQry(qry4);
                    }

                    pegatokenfire(msg, nome)

                    emitMensagem(io, nome, msg, waId)





                } catch (error) {
                    /*     if (entry.changes[0].value.statuses[0].status != 'read') {
                             //mensagem = entry.changes[0].value.statuses[0].conversation
         
         
                             //console.log('teste se e aqui', mensagem)
                         }
                         */
                }
            } else if (tudo.entry[0].changes[0].value.messages[0].type == 'image' && numRecebe == '553130580254') {
                try {
                    //console.log("Sera que passou aqui");
                    mensagem = entry.changes[0].value.messages[0];
                    produto = entry.changes[0].value;

                    let type = tudo.entry[0].changes[0].value.messages[0].type;
                    let msg = tudo.entry[0].changes[0].value.messages[0].image.id;
                    let nome = tudo.entry[0].changes[0].value.contacts[0].profile.name;
                    let waId = tudo.entry[0].changes[0].value.contacts[0].wa_id;

                    let qry = `insert into meso_mensagens_solicitante (nome, whatsappid, mensagem, telefone, type) VALUES ('${nome}', '${waId}','${msg}.jpeg','${waId}','${type}');`;

                    //console.log(qry);

                    executaQry(qry);

                    let a = await api.get(`/pegaURL/${msg}`);
                    //console.log('FILHO DE ANJO E DEMONIO DEVIL MAY CRY', a.data);
                    let url = a.data.url;

                    //console.log("Me mostre oq retorna aqui na imagem", msg)

                    let bodyImage = {
                        "url": url,
                        "id": msg
                    };

                    await api.post(`/geraImage/`, bodyImage);

                    // Obtém a imagem como um buffer
                    let geraMidia = await api.get(`/get-image/${msg}.jpeg`, { responseType: 'arraybuffer' }); // Certifique-se de definir `responseType`

                    // Verifica se a resposta da imagem é bem-sucedida
                    if (geraMidia.status === 200) {
                        const imageBuffer = Buffer.from(geraMidia.data, 'binary');
                        const base64Image = `data:image/jpeg;base64,${imageBuffer.toString('base64')}`;

                        // Envia a imagem no formato base64
                        emitImage(io, nome, base64Image, waId);
                        const agora = new Date();
                        const horaFormatada = new Intl.DateTimeFormat('pt-BR', {
                            day: '2-digit',
                            month: '2-digit',
                            year: 'numeric',
                            hour: '2-digit',
                            minute: '2-digit',
                            second: '2-digit',
                        }).format(agora);
                        io.emit('receive-message', [
                            waId,
                            nome,
                            "",
                            '551131646301',
                            `${msg}.jpeg`,
                            type,
                            horaFormatada
                        ]);

                    } else {
                        console.error('Erro ao obter a imagem:', geraMidia.status);
                    }

                } catch (error) {
                    console.error('Erro ao processar imagem:', error);
                }
            }
            else if (tudo.entry[0].changes[0].value.messages[0].type == 'audio' && numRecebe == '553130580254') {
                //console.log('Eu sou o audio pae')
                try {
                    mensagem = entry.changes[0].value.messages[0]
                    produto = entry.changes[0].value

                    //console.log('teste produto', produto.value)
                    //console.log(mensagem, 'recebi')
                    //console.log('maioria', tudo.entry[0].changes[0].value.messages[0])
                    //console.log('eu sou tudo antes do if', tudo.entry[0].changes[0].value)
                    let type = tudo.entry[0].changes[0].value.messages[0].type
                    let msg = tudo.entry[0].changes[0].value.messages[0].audio.id
                    let nome = tudo.entry[0].changes[0].value.contacts[0].profile.name
                    let waId = tudo.entry[0].changes[0].value.contacts[0].wa_id
                    qry = `insert into meso_mensagens_solicitante (nome, whatsappid, mensagem, telefone, type ) VALUES ('${nome}', '${waId}','${msg}.mp3','${waId}','${type}');`
                    //console.log('megumi fushiguro', qry)
                    executaQry(qry)

                    let a = await api.get(`/pegaURL/${msg}`);
                    //console.log(a.data);
                    let url = a.data.url;

                    let bodyImage = {
                        "url": url,
                        "id": msg
                    };

                    await api.post(`/geraAudio/`, bodyImage);

                    let geraMidia = await api.get(`/get-audio/${msg}.mp3`, { responseType: 'arraybuffer' }); // Certifique-se de definir `responseType`

                    if (geraMidia.status === 200) {
                        const audioBuffer = Buffer.from(geraMidia.data, 'binary');
                        const base64Audio = `data:audio/mp3;base64,${audioBuffer.toString('base64')}`;

                        let qry4 = `update meso_contatos set estado = 'Aguardando Atendimento' where telefone like '%${waId}%';`
                        //console.log('veia chata', qry4)
                        await executaQry(qry4)

                        // Envia o áudio no formato base64
                        emitAudio(io, nome, base64Audio, waId);
                    }

                    /*let bodyMsg = {
                        "to": waId,
                        "body": `Para melhorar nosso atendimento, pedimos que as mensagens sejam enviadas apenas por texto! Obrigado.`,
                        "nome": "bot-Meso"

                    };*/

                    const agora = new Date();
                    const horaFormatada = new Intl.DateTimeFormat('pt-BR', {
                        day: '2-digit',
                        month: '2-digit',
                        year: 'numeric',
                        hour: '2-digit',
                        minute: '2-digit',
                        second: '2-digit',
                    }).format(agora);
                    //console.log('minha msg', horaFormatada)

                    io.emit('receive-message', [
                        waId,
                        nome,
                        "agente",
                        '551131646301',
                        `${msg}.mp3`,
                        type,
                        horaFormatada
                    ]);
                    io.emit('buscar-contato')

                    await api.post(`/send`, bodyMsg);


                } catch (error) {
                    //   if (entry.changes[0].value.statuses[0].status != 'read') {
                    //     mensagem = entry.changes[0].value.statuses[0].conversation

                    //console.log('teste se e aqui', mensagem)

                }
            }
            else if (tudo.entry[0].changes[0].value.messages[0].type == 'document' && numRecebe == '553130580254') {
                //console.log('Eu sou o audio pae')
                try {
                    mensagem = entry.changes[0].value.messages[0]
                    produto = entry.changes[0].value

                    //console.log('teste produto', produto.value)
                    // console.log(mensagem, 'recebi')
                    //console.log('maioria', tudo.entry[0].changes[0].value.messages[0])
                    //console.log('eu sou tudo antes do if', tudo.entry[0].changes[0].value)
                    let type = tudo.entry[0].changes[0].value.messages[0].document.mime_type
                    let msg = tudo.entry[0].changes[0].value.messages[0].document.id
                    let nome = tudo.entry[0].changes[0].value.contacts[0].profile.name
                    let waId = tudo.entry[0].changes[0].value.contacts[0].wa_id
                    qry = `insert into meso_mensagens_solicitante (nome, whatsappid, mensagem, telefone, type ) VALUES ('${nome}', '${waId}','${msg}.pdf','${waId}','${type}');`
                    //console.log('Satoru gojo', qry)
                    executaQry(qry)

                    let a = await api.get(`/pegaURL/${msg}`);
                    //console.log(a.data);
                    let url = a.data.url;
                    //console.log('MÃE SOLTEIRA', url)
                    let bodyImage = {
                        "url": url,
                        "id": msg
                    };

                    await api.post(`/geraDocument/`, bodyImage);
                    emitMensagem(io, nome, msg)

                    const agora = new Date();
                    const horaFormatada = new Intl.DateTimeFormat('pt-BR', {
                        day: '2-digit',

                        month: '2-digit',
                        year: 'numeric',
                        hour: '2-digit',
                        minute: '2-digit',
                        second: '2-digit',
                    }).format(agora);
                    //console.log('minha msg', msg)

                    io.emit('receive-message', [
                        waId,
                        nome,
                        "agente",
                        '551131646301',
                        `${msg}.pdf`,
                        type,
                        horaFormatada
                    ]);

                } catch (error) {
                    //   if (entry.changes[0].value.statuses[0].status != 'read') {
                    //     mensagem = entry.changes[0].value.statuses[0].conversation

                    //console.log('teste se e aqui', mensagem)

                }
            }
        } else {
            //console.log('mensagem enviada')
        }
    } else if (numRecebe == '553130580254') {
        let msg = tudo.entry[0].changes[0].value.messages[0].id


        //console.log('eu sou msg', msg)
        let nome = tudo.entry[0].changes[0].value.contacts[0].profile.name
        //console.log('eu sou nome', nome)
        let waId = tudo.entry[0].changes[0].value.contacts[0].wa_id
        //console.log('Foi não ó')
        let qry5 = `select count(*) as contatoExiste from meso_contatos where telefone = '${waId}';`

        //console.log(qry5)
        let contatoExisteArray = await executaQry(qry5)

        let contatoExiste = contatoExisteArray.dados[0].contatoExiste


        //console.log('Eu sou o contatoExiste', contatoExiste)

        let qry4 = `update meso_contatos set estado = 'Aguardando Atendimento' where telefone like '%${waId}%';`
        //console.log('veia chata', qry4)
        await executaQry(qry4)
        if (nome != 'template_plugphone2' && contatoExiste == 0) {
            const listaCampanha = ['Aniversário', 'Negocie Já', 'Debitos', 'Boas Vindas'];
            const campanha = listaCampanha[Math.floor(Math.random() * listaCampanha.length)];
            const qry4 = `INSERT INTO meso_contatos (nome, telefone, campanha) VALUES ('${nome}', '${waId}', '${campanha}');`;
            executaQry(qry4);
        }

        let protocolo = gerarProtocolo()

        //console.log('eu sou protocolo', protocolo)





        let template = "menu_plugphone3"
        //console.log(numeroWhatsapp)
        sendTemplateMenu(numeroWhatsapp, template, res)



        let bodyMsg = {
            "to": waId,
            "body": `seu protocolo é: ${protocolo}`,
            "nome": "bot-Meso"
        };

        sendprotocolo(waId, `seu protocolo é : ${protocolo}`, 'bot-PlugPhone', res)

        let qryproto = `insert into meso_mensagens_solicitante (telefone,nome,agent,wpnumber,protocolo, type, estado,mensagem) values ('${waId}','bot-Meso','bot-Meso','553130580254','${protocolo}','protocolo', 'aberto','seu protocolo é : ${protocolo}');`
        //console.log('KAMEHAMEHAAAAAAAAAAAAAAAAAAAA!', qryproto)
        await executaQry(qryproto)
    }
    else {
        //console.log('serve de porra nenhuma')
    }
    ////else{//console.log('Jurassic world')}
    res.status(200).end()
});

app.get("/pegaid/:midia", async (req, res) => {
    let midia = req.params.midia

    let qry = `select mensagem as id from meso_mensagens_solicitante where type = '${midia}' and id = (select max(id)  from meso_mensagens_solicitante);`
    let idArray = await executaQry(qry)
    let id = idArray.dados[0].id

    res.json(id)
})

app.get("/recebidas", (req, res) => {
    //console.log(entry.changes[0].value.messages[0])
    let resp = entry.changes[0].value.messages[0]
    res.json(resp)
    res.status(200).end()

});

// Rota de webhook para verificação de integridade
app.get("/webhooks", (req, res) => {
    let hub = {};
    hub.mode = req.query['hub.mode'];
    hub.challenge = req.query['hub.challenge'];
    hub.verify_token = req.query['hub.verify_token'];
    //console.log(req.query, hub);
    let resposta = hub.challenge;
    res.send(resposta);
});

// Rota para download de um arquivo com base em um ID
app.get('/download/:id/:nome/:formato', async (req, res) => {
    let id = req.params.id;
    let nome = req.params.nome
    let formato = req.params.formato

    download(id, nome, formato, res)
});

app.post("/send", async (req, res) => {
    //console.log(to, body, nome,)

    let to = req.body.to
    let body = req.body.body
    let nome = req.body.nome
    send(to, body, nome, res)
})

app.post("/sendimage", async (req, res) => {



    let to = req.body.to
    let id = req.body.id
    let link = req.body.link
    //console.log(to, id, link, res)
    //console.log('oque vem sem link', link)
    sendImage(to, id, link, res)
})


app.post("/sendvideo", async (req, res) => {

    let to = req.body.to
    let id = req.body.id

    let link = req.body.link

    sendVideo(to, id, link, res)
})

app.post("/sendaudio", async (req, res) => {

    let to = req.body.to
    let id = req.body.id
    let link = req.body.link

    sendAudio(to, id, link)
})


app.post("/sendtemplate", async (req, res) => {

    let to = req.body.to
    let name = req.body.name
    let usuario = req.body.usuario

    //console.log('eu sou o send template', to,name,usuario)

    sendTemplate(to, name, usuario, res)
})


app.post("/sendtemplateMenu", async (req, res) => {

    let to = req.body.to
    let name = req.body.name

    //console.log('SHE KNOWS')

    sendTemplateMenu(to, name, res)
})

app.post("/senddocument", async (req, res) => {

    let to = req.body.to
    let id = req.body.id
    let link = req.body.link
    let filename = req.body.filename

    sendDocument(to, id, filename, res)
})
app.get("/gerarprotocolo/:status", async (req, res, next) => {

    //console.log(v4())
    const id = v4(); // Gera um novo id
    let status = req.params.status


    let qry = `INSERT INTO meso_gravar_id (id,protocolo,dataInicio,status) VALUES (0,'${id}',now(),'${status}')`
    //console.log(qry)

    let res1 = await executaQry(qry);
    res.json(res1)
    //console.log(res1)
})

app.post("/criarlogin", async (req, res, next) => {
    let login = req.body.login
    let senha = req.body.senha
    let qry = `insert into meso_login (login, senha) values ('${login}', md5('${senha}'))`
    //console.log(qry)

    let res1 = await executaQry(qry);
    res.json(res1)
    //console.log(res1)
})

app.post("/login", async (req, res, next) => {
    let login = req.body.login
    let senha = req.body.senha
    let qry = `select login,senha from meso_login where login like '${login}' and senha like md5('${senha}');`
    //console.log(qry)
    let res1 = await executaQry(qry);
    res.json(res1)
    //console.log(res1)

})



app.use(bodyParser.json());

app.post('/registrar-token', async (req, res) => {
    //console.log("Aqui é bomba")
    const { token } = req.body;
    const { usuario } = req.body
    const tokenFunc = await funcToken(usuario);

    if (token !== tokenFunc) {
        let qry = `update meso_usuariologin set token = '${token}' where usuario = '${usuario}'`;
        executaQry(qry);
        //console.log("Token atualizado",qry); 
    }
    res.status(200).send({ 'token': 'Token registrado com sucesso!' });
});

app.post('/registrar-token-mobile', async (req, res) => {
    const { token } = req.body;
    const { usuario } = req.body

    //console.log('auauau 123', token, usuario)

    const tokenFuncMobile = await funcTokenMobile(usuario);

    //console.log("token e usuario aqui", token, usuario);

    if (token !== tokenFuncMobile) {
        let qry = `update meso_usuariologin set tokenMobile = '${token}' where usuario like '%${usuario}%'`;
        executaQry(qry);
        //console.log("Token atualizado", qry);
    }
    res.status(200).send('Token registrado com sucesso!');
});


let funcToken = async function (nome) {
    let qry = `select token from meso_usuariologin where usuario like '%${nome}%';`;
    token = await executaQry(qry)
    let tokenFormatado = token.dados.length > 0 ? token.dados[0].token : "";
    return tokenFormatado
}

let funcTokenMobile = async function (nome) {
    let qry = `select tokenMobile from meso_usuariologin where usuario like '%${nome}%';`;
    token = await executaQry(qry)
    let tokenFormatado = token.dados.length > 0 ? token.dados[0].tokenMobile : "";
    return tokenFormatado
}

let pegatokenfire = async function (mensagem, nome, usuario, setor) {
    try {
        // 1. Buscar tokens do banco
        let qry = `
            SELECT token, tokenMobile 
            FROM meso_usuariologin 
            `

        let resultado = await executaQry(qry);
        //console.log('🔍 Consulta executada:', qry);

        if (!Array.isArray(resultado.dados) || resultado.dados.length === 0) {
            //console.log('⚠️ Nenhum token encontrado');
            return;
        }

        // 2. Coletar e filtrar tokens válidos
        let tokens = [];
        resultado.dados.forEach(({ token, tokenMobile }) => {
            if (token && token.trim() !== '') tokens.push(token.trim());
            if (tokenMobile && tokenMobile.trim() !== '') tokens.push(tokenMobile.trim());
        });

        tokens = [...new Set(tokens)]; // remover duplicados

        if (tokens.length === 0) {
            //console.log('⚠️ Lista final de tokens está vazia');
            return;
        }

        const MAX_TOKENS = 500;

        // 3. Enviar notificações em lotes
        for (let i = 0; i < tokens.length; i += MAX_TOKENS) {
            const tokenBatch = tokens.slice(i, i + MAX_TOKENS);

            const multicastMessage = {
                notification: {
                    title: nome,
                    body: mensagem,
                },
                android: {
                    priority: 'high',
                    notification: {
                        sound: 'notification.wav',
                        channelId: 'custom_sound_channel',
                    },
                },
                apns: {
                    headers: {
                        'apns-priority': '10',
                    },
                    payload: {
                        aps: {
                            sound: 'notification.wav',
                        },
                    },
                },
                tokens: tokenBatch,
            };

            const response = await admin.messaging().sendEachForMulticast(multicastMessage);

            //console.log(`✅ Enviado lote de ${tokenBatch.length} tokens - Sucesso: ${response.successCount}, Falha: ${response.failureCount}`);

            // 4. Tratar falhas
            if (response.failureCount > 0) {
                await Promise.all(response.responses.map(async (res, idx) => {
                    if (!res.success) {
                        const failedToken = tokenBatch[idx];
                        const errCode = res.error?.code || 'unknown';
                        const errMsg = res.error?.message || 'Mensagem desconhecida';

                        console.warn(`⚠️ Falha no token: ${failedToken} → ${errCode} - ${errMsg}`);

                        if (errCode === 'messaging/registration-token-not-registered') {
                            //console.log(`🗑️ Limpando token inválido: ${failedToken}`);

                            let removeQry = `
                                UPDATE meso_usuariologin 
                                SET token = CASE WHEN token = '${failedToken}' THEN '' ELSE token END,
                                    tokenMobile = CASE WHEN tokenMobile = '${failedToken}' THEN '' ELSE tokenMobile END
                                WHERE token = '${failedToken}' OR tokenMobile = '${failedToken}';
                            `;
                            await executaQry(removeQry);
                        }
                    }
                }));
            }
        }
    } catch (error) {
        console.error("🔥 Erro geral ao enviar notificações:", error.message);
        console.error("📄 Detalhes completos:", error);
    }
};



let atualizaContato = async function (mensagem, telefone) {
    let qry = `update meso_contatos set ultimamsg = '${mensagem}', datahora = now() where telefone = '${telefone}'`;
    await executaQry(qry);
    //console.log("chegou aqui", qry)


}
