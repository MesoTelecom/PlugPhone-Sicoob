const axios = require('axios');
const { executaQry } = require('./banco/bd');
const https = require('https');

let aniversariantes = async function () {
    const agent = new https.Agent({
        rejectUnauthorized: false,
    });

    const config = {
        method: 'get',
        maxBodyLength: Infinity,
        url: 'https://api-nxcoop.sicoobnossacoop.com.br/api/v1/associados/aniversariantes-hoje/?size=1000',
        headers: {
            'Authorization': '72dd78d0-f4b6-4beb-8db4-a971dad01999'
        },
        httpsAgent: agent
    };

    try {
        let response = await axios.request(config);
        let dados = response.data.content;

        for (let item of dados) {
            let {
                pessoa: {
                    nomeAssociado: nome = 'NÃO INFORMADO',
                    document: documento = 'NÃO INFORMADO',
                    email = 'NÃO INFORMADO',
                    dataNascimento = null,
                    sexo = 'NÃO INFORMADO',
                    estadoCivil = 'NÃO INFORMADO',
                    escolaridade = 'NÃO INFORMADO',
                    endereco = [],
                    telefone = []
                },
                tipoRenda = 'NÃO INFORMADO',
                vinculoEmpregaticio = 'NÃO INFORMADO',
                tugdescricaoProfissao: profissao = 'NÃO INFORMADO',
                atividadeEconomica = 'NÃO INFORMADO',
                pa: { numero: pa_id = 0, descricao: pa_descricao = 'NÃO INFORMADO' } = {},
                isFuncionario: is_funcionario = false,
                mei = 'NÃO INFORMADO'
            } = item;

            // Tratando arrays de telefone e endereço
            let telefoneCelular = telefone.length > 0 ? telefone[0].numero || 'NÃO INFORMADO' : 'NÃO INFORMADO';

            let logradouro = endereco[0]?.logradouro || 'NÃO INFORMADO';
            let numero = endereco[0]?.numero || 'NÃO INFORMADO';
            let complemento = endereco[0]?.complemento || 'NÃO INFORMADO';
            let bairro = endereco[0]?.bairro || 'NÃO INFORMADO';
            let municipio = endereco[0]?.municipio || 'NÃO INFORMADO';
            let uf = endereco[0]?.uf || 'NÃO INFORMADO';
            let cep = endereco[0]?.cep || 'NÃO INFORMADO';

            let gerente_nome = 'NÃO INFORMADO'; // não veio no JSON

            let qry = `
INSERT INTO meso_contatos (
nome, telefone, documento, email, data_nascimento, sexo, estado_civil, escolaridade,
logradouro, numero, complemento, bairro, municipio, uf, cep,
tipo_renda, vinculo_empregaticio, profissao, atividade_economica,
pa_id, pa_descricao, gerente_nome, is_funcionario, mei,
estado, id_agencia, datahora
) VALUES (
'${nome}', '${telefoneCelular}', '${documento}', '${email}', '${dataNascimento}', '${sexo}',
'${estadoCivil}', '${escolaridade}', '${logradouro}', '${numero}', '${complemento}',
'${bairro}', '${municipio}', '${uf}', '${cep}', '${tipoRenda}', '${vinculoEmpregaticio}',
'${profissao}', '${atividadeEconomica}', ${pa_id}, '${pa_descricao}', '${gerente_nome}',
${is_funcionario}, '${mei}', 'Novo', '${pa_id}', NOW()
)
`;

            console.log('📥 Inserindo:', qry);
            await executaQry(qry);
        }

        return response.data;
    } catch (error) {
        console.error('Erro ao buscar aniversariantes:', error);
        return null;
    }
};

let associados = async function (nomeAssociado = '') {  // <-- adiciona parâmetro
    const agent = new https.Agent({ rejectUnauthorized: false });

    const config = {
        method: 'get',
        maxBodyLength: Infinity,
        url: `https://api-nxcoop.sicoobnossacoop.com.br/api/v1/associados/?nomeAssociado=${encodeURIComponent(nomeAssociado)}&size=1000`,
        headers: {
            Authorization: '72dd78d0-f4b6-4beb-8db4-a971dad01999'
        },
        httpsAgent: agent
    };


    try {
        const { data } = await axios.request(config);
        const dados = data.content ?? [];

        for (const item of dados) {
            /* ---------- Desestruturação segura ---------- */
            const {
                pessoa: {
                    nomeAssociado: nome = 'NÃO INFORMADO',
                    document: documento = 'NÃO INFORMADO',
                    email = 'NÃO INFORMADO',
                    dataNascimento = null,
                    sexo = 'NÃO INFORMADO',
                    estadoCivil = 'NÃO INFORMADO',
                    escolaridade = 'NÃO INFORMADO',
                    endereco: end = [],
                    telefone: tel = []
                } = {},
                tipoRenda = 'NÃO INFORMADO',
                vinculoEmpregaticio = 'NÃO INFORMADO',
                descricaoProfissao: profissao = 'NÃO INFORMADO',
                atividadeEconomica = 'NÃO INFORMADO',
                pa: { numero: pa_id = 0, descricao: pa_descricao = 'NÃO INFORMADO' } = {},
                isFuncionario: is_funcionario = false,
                mei = 'NÃO INFORMADO'
            } = item;

            /* ---------- Tratamento de arrays ---------- */
            const telCelular = tel.length ? tel[0].telefone?.replace(/\D/g, '') || 'NÃO INFORMADO' : 'NÃO INFORMADO';

            const {
                logradouro = 'NÃO INFORMADO',
                numero = 'NÃO INFORMADO',
                complemento = 'NÃO INFORMADO',
                bairro = 'NÃO INFORMADO',
                municipio = 'NÃO INFORMADO',
                uf = 'NÃO INFORMADO',
                cep = 'NÃO INFORMADO'
            } = end[0] || {};

            const gerente_nome = item.gerenteSisBR?.pessoa?.nome ?? 'NÃO INFORMADO';

            /* ---------- INSERT em meso_contatos ---------- */
            const qry = `
INSERT INTO meso_contatos (
  nome, telefone, documento, email, data_nascimento, sexo, estado_civil, escolaridade,
  logradouro, numero, complemento, bairro, municipio, uf, cep,
  tipo_renda, vinculo_empregaticio, profissao, atividade_economica,
  pa_id, pa_descricao, gerente_nome, is_funcionario, mei,
  estado, id_agencia, datahora
) VALUES (
  '${nome}', '${telCelular}', '${documento}', '${email}', '${dataNascimento}', '${sexo}',
  '${estadoCivil}', '${escolaridade}', '${logradouro}', '${numero}', '${complemento}',
  '${bairro}', '${municipio}', '${uf}', '${cep}', '${tipoRenda}', '${vinculoEmpregaticio}',
  '${profissao}', '${atividadeEconomica}', ${pa_id}, '${pa_descricao}', '${gerente_nome}',
  ${is_funcionario}, '${mei}', 'Novo', '${pa_id}', NOW()
)
ON DUPLICATE KEY UPDATE
  telefone='${telCelular}',
  email='${email}',
  atividade_economica='${atividadeEconomica}',
  datahora=NOW();
`;

            console.log('📥 Inserindo/Atualizando:', documento);
            await executaQry(qry);
        }

        return data;
    } catch (err) {
        console.error('Erro ao buscar associados:', err);
        return null;
    }
};
let sendSatisfacao = async (to, usuario) => {
    console.log('Caramelo');
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
                "name": "solicitacao_atendida",
                "language": { "code": "pt_BR" }
            }
        })
    };

    try {
        const fetch = require('node-fetch');
        const response = await fetch("https://graph.facebook.com/v21.0/421167414412878/messages", requestOptions);
        const data = await response.json();

        let qry = `insert into meso_mensagens_solicitante (telefone,nome,agent,wpnumber,mensagem, type)
               values ('${to}','${usuario}','${usuario}','553130580254','solicitacao_atendida','document');`;
        await executaQry(qry);

        return data;
    } catch (error) {
        console.error("Erro ao enviar mensagem de satisfação:", error);
        throw error;
    }
};

let sendPesquisa = async (to, usuario) => {
    console.log('Caramelo');
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
                "name": "pesquisa_satisafacao",
                "language": { "code": "pt_BR" }
            }
        })
    };

    try {
        const fetch = require('node-fetch');
        const response = await fetch("https://graph.facebook.com/v21.0/421167414412878/messages", requestOptions);
        const data = await response.json();

        let qry = `insert into meso_mensagens_solicitante (telefone,nome,agent,wpnumber,mensagem, type)
               values ('${to}','${usuario}','${usuario}','553130580254','pesquisa_satisafacao','document');`;
        await executaQry(qry);

        return data;
    } catch (error) {
        console.error("Erro ao enviar mensagem de pesquisa:", error);
        throw error;
    }
};


module.exports = { aniversariantes, associados, sendSatisfacao, sendPesquisa };


