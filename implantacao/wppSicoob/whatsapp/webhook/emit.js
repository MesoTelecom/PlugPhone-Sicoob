const { executaQry } = require("./db");

let emitMensagem = function (socket, nome, msg, telefone) {
    socket.emit('chat message', nome, msg, telefone)
    console.log('Mensagem enviada:', nome, msg, telefone);

}

async function emitMensagemFlutter(socket, telefone) {
    let qry = `SELECT * FROM meso_mensagens_solicitante WHERE telefone = ${telefone}`;
    console.log("🔍 Consultando mensagens:", qry);
    try {
      const messages = await executaQry(qry);
      socket.emit('receive-messages', messages);
    } catch (error) {
      console.error("❌ Erro ao buscar mensagens:", error);
    }
  }
  

async function cadastrarMensagem(msg) {
    console.log('buraco profundo',msg)
    let qry = `insert into meso_mensagens_solicitante 
      (telefone, nome, agent, wpnumber, mensagem, type) 
      values ('${msg.telefone}','${msg.nome}','${msg.agent}','551131646301','${msg.mensagem}','${msg.type}')`;
  
    await executaQry(qry);
  }

let emitImage = function (socket, nome, imageBuffer, telefone) {
    socket.emit('chat image', nome, imageBuffer, telefone);
    //console.log('Imagem enviada:', nome, telefone);
};

let emitAudio = function (socket, nome, audioBuffer, telefone) {
    socket.emit('chat audio', nome, audioBuffer, telefone);
    console.log('audio enviado:', nome);
};

let emitDocument = function (socket, nome, documentBuffer) {
    socket.emit('chat document', nome, documentBuffer)
    console.log('documento enviado:', nome)
}

let emitContatos = function (socket, contatosAtualizados) {
    socket.emit('atualizar-contatos', contatosAtualizados)
    console.log("contatos", contatosAtualizados)
}

module.exports = { emitMensagem, emitImage, emitAudio, emitDocument, emitContatos, emitMensagemFlutter,cadastrarMensagem};
