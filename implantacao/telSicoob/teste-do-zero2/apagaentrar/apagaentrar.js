// Importa os módulos necessários
const { Sequelize, QueryTypes } = require('sequelize');
const cron = require('node-cron');
const { exec } = require('child_process');
const fs = require('fs');

// Configuração do Sequelize para conexão com o banco de dados
const sequelize = new Sequelize('asteriskcdrdb', 'root', 'Mtes0206', {
    host: 'localhost',
    dialect: 'mysql',
    logging: false // Desativa logs para evitar poluição no console
});

// Função para obter o primeiro dia de um mês
function getPrimeiroDiaMes(date) {
    return new Date(date.getFullYear(), date.getMonth(), 1);
}

// Função para obter o último dia de um mês
function getUltimoDiaMes(date) {
    return new Date(date.getFullYear(), date.getMonth() + 1, 0);
}

// Função para calcular o período de três meses atrás
function definirPeriodoTresMesesAtras() {
    const dataAtual = new Date();
    const tresMesesAtras = new Date(dataAtual.getFullYear(), dataAtual.getMonth() - 3, 1);

    // Define os valores de primeiroDiaMes e ultimoDiaMes
    const primeiroDiaMes = getPrimeiroDiaMes(tresMesesAtras).toISOString().split('T')[0];
    const ultimoDiaMes = getUltimoDiaMes(tresMesesAtras).toISOString().split('T')[0];

    // Retorna os valores calculados
    return { primeiroDiaMes, ultimoDiaMes };
}

// Variáveis globais para armazenar o período
let primeiroDiaMes, ultimoDiaMes;

// Função para atualizar o período de três meses atrás
function atualizarPeriodoTresMesesAtras() {
    const periodo = definirPeriodoTresMesesAtras();
    primeiroDiaMes = periodo.primeiroDiaMes;
    ultimoDiaMes = periodo.ultimoDiaMes;
}

// Função para registrar logs de execução
function registrarLog(mensagem) {
    const timestamp = new Date().toLocaleString();
    const log = `[${timestamp}] ${mensagem}\n`;
    fs.appendFileSync('cron_log.txt', log);
    console.log(log.trim());
}

// Agendamento do cron job para o primeiro dia de cada mês, à meia-noite
cron.schedule('0 0 1 * *', async () => {
    await inicia();
});

// Função principal para coordenar o cron job
async function inicia() {
    const dataCompleta = new Date().toLocaleString();
    registrarLog(`Iniciando os processos no cron job`);

    // Redefine o período de três meses antes de iniciar os processos
    atualizarPeriodoTresMesesAtras();

    try {
        await realizarBackup();
        await executarProcessos();
        registrarLog(`Processos concluídos com sucesso`);
    } catch (error) {
        registrarLog(`Erro durante a execução do cron job: ${error.message}`);
    }
}

// Função para realizar o backup da tabela antes de qualquer operação
async function realizarBackup() {
    const date = new Date().toISOString().split('T')[0]; // Formato YYYY-MM-DD
    const backupPath = `./backups`;
    const backupFile = `${backupPath}/backup_meu_teste.sql`;

    if (!fs.existsSync(backupPath)) {
        fs.mkdirSync(backupPath);
    }

    const dumpCommand = `mysqldump -u root -pMtes0206 asteriskcdrdb meu_teste > ${backupFile}`;

    registrarLog(`Iniciando backup da tabela 'meu_teste'...`);

    return new Promise((resolve, reject) => {
        exec(dumpCommand, (error, stdout, stderr) => {
            if (error) {
                registrarLog(`Erro ao realizar o backup: ${error.message}`);
                return reject(error);
            }
            if (stderr) {
                registrarLog(`Erro no mysqldump: ${stderr}`);
                return reject(new Error(stderr));
            }
            registrarLog(`Backup realizado com sucesso: ${backupFile}`);
            resolve();
        });
    });
}

// Função principal para coordenar o backup e a deleção de dados
async function executarProcessos() {
    try {
        await copiarDadosTresMesesAtras();
        await deletarDadosTresMesesAtras();
    } catch (error) {
        registrarLog(`Erro durante os processos: ${error.message}`);
        throw error;
    } finally {
        // Fecha a conexão com o banco de dados
        await sequelize.close();
    }
}

// Função para copiar os dados do banco de três meses atrás para a tabela de backup
async function copiarDadosTresMesesAtras() {
    const query = `
        INSERT INTO meu_teste_bkp
        SELECT *
        FROM meu_teste
        WHERE DATE(datahora) BETWEEN '${primeiroDiaMes}' AND '${ultimoDiaMes}';
    `;

    try {
        await sequelize.query(query, { type: QueryTypes.INSERT });
        registrarLog(`Dados copiados com sucesso!`);
    } catch (error) {
        registrarLog(`Erro ao copiar dados: ${error.message}`);
        throw error;
    }
}

// Função para deletar os dados do banco referentes a três meses atrás
async function deletarDadosTresMesesAtras() {
    const query = `
        DELETE FROM meu_teste
        WHERE DATE(datahora) BETWEEN '${primeiroDiaMes}' AND '${ultimoDiaMes}';
    `;

    try {
        await sequelize.query(query, { type: QueryTypes.DELETE });
        registrarLog(`Dados deletados com sucesso!`);
    } catch (error) {
        registrarLog(`Erro ao deletar dados: ${error.message}`);
        throw error;
    }
}

registrarLog("Cron job configurado para executar no dia 1 de cada mês");