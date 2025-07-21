const { executaQry } = require("./db");
const { cadastrarMensagem } = require("./emit");

let socketConnection = function (io) {
  ioGlobal = io;
  io.on("connection", async (socket) => {
   // console.log('buhahahaha')
   // console.log("🟢 Usuário conectado:", socket.id);

    socket.on("create-message", async (msg) => {
      //console.log("📩 Nova mensagem recebida:", msg);

      try {
        await cadastrarMensagem(msg);

        const agora = new Date();
        const horaFormatada = new Intl.DateTimeFormat("pt-BR", {
          day: "2-digit",
          month: "2-digit",
          year: "numeric",
          hour: "2-digit",
          minute: "2-digit",
          second: "2-digit",
        }).format(agora);


        io.emit("receive-message", [msg.telefone, msg.nome, msg.agente, '551131646301', msg.mensagem, msg.type, horaFormatada]);
        //  //console.log("📤 Mensagem emitida para todos:", [msg.telefone, msg.nome, msg.agente, '551131646301', msg.mensagem, msg.type, horaFormatada]);
      } catch (error) {
        //console.error("❌ Erro ao processar 'create-message':", error);
      }
    });

    socket.on("buscar-contato", async () => {
      //console.log("AAAAAAAAAAAAAAAAA caralho");

      //console.log("minha data")
      let qryContatos = `select * from meso_contatos order by datahora desc`
      let contatosValor = await executaQry(qryContatos)

      //console.log("My contacts", contatosValor)

      const estadosValidos = [
        'Novo',
        'Aguardando Cliente',
        'Aguardando Atendimento',
        'Finalizado'
      ];

      const agrupados = {
        'Todos': contatosValor.dados,
        'Novo': [],
        'Aguardando Cliente': [],
        'Aguardando Atendimento': [],
        'Finalizado': []
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
            datahora: element.datahora,
            campanha: element.campanha,
            id_agencia: element.id_agencia
          });
        } else {
         // console.log('Estado desconhecido ou não tratado:', estado);
        }
      });
     // console.log("me mostra os contatos", agrupados)
      io.emit("contatos-sicoob", agrupados);

    });

    socket.on("buscar-mensagens", async (telefone) => {
      try {
        //console.log("🔎 Buscando mensagens para telefone:", telefone);

        const qry = `SELECT * FROM meso_mensagens_solicitante WHERE telefone = '${telefone}'`;
        const mensagens = await executaQry(qry);

        io.emit("mensagens", mensagens.dados || []);
      } catch (error) {
        //console.error("❌ Erro ao buscar mensagens:", error);
      }
    });

    socket.on("buscar-quantidade-contatos", async (data) => {
      try {
        //console.log("📊 Buscando quantidade de contatos para:", data.estado);

        let qry;

       // console.log("Mama eu", data)

        if (data.campanha == null || data.campanha == '') {
          qry = `
        SELECT estado, SUM(quantContatos) AS quantContatos
FROM (
    SELECT estado, COUNT(*) AS quantContatos
    FROM meso_contatos
    WHERE estado IS NOT NULL AND id_agencia = '${data.idAgencia}'
    GROUP BY estado

    UNION ALL

    SELECT 'Todos', COUNT(*)
    FROM meso_contatos
    WHERE estado IS NOT NULL AND id_agencia = '${data.idAgencia}'

    UNION ALL SELECT 'Novo', 0
    UNION ALL SELECT 'Aguardando Cliente', 0
    UNION ALL SELECT 'Aguardando Atendimento', 0
    UNION ALL SELECT 'Finalizado', 0
) AS dados
GROUP BY estado
ORDER BY FIELD(estado, 'Todos', 'Novo', 'Aguardando Cliente', 'Aguardando Atendimento', 'Finalizado');
    
        `;
        } else {


          qry = `
        SELECT estado, SUM(quantContatos) AS quantContatos
FROM (
    SELECT estado, COUNT(*) AS quantContatos
    FROM meso_contatos
    WHERE estado IS NOT NULL  and campanha like '%${data.campanha}%' AND id_agencia = '${data.idAgencia}'
    GROUP BY estado

    UNION ALL

    SELECT 'Todos', COUNT(*)
    FROM meso_contatos
    WHERE estado IS NOT NULL and campanha like '%${data.campanha}%' AND id_agencia = '${data.idAgencia}'

    UNION ALL SELECT 'Novo', 0
    UNION ALL SELECT 'Aguardando Cliente', 0
    UNION ALL SELECT 'Aguardando Atendimento', 0
    UNION ALL SELECT 'Finalizado', 0
) AS dados
GROUP BY estado
ORDER BY FIELD(estado, 'Todos', 'Novo', 'Aguardando Cliente', 'Aguardando Atendimento', 'Finalizado');
    
        `;
        }

       // console.log('me mostrar o select esquisito', qry)


        const quantContatos = await executaQry(qry);
        //console.log("Oq retorna", qry)
        io.emit("quantidade-contatos", quantContatos.dados || []);
      } catch (error) {
        //console.error("❌ Erro ao buscar quantidade de contatos:", error);
      }
    });
  });
};

module.exports = { socketConnection };
