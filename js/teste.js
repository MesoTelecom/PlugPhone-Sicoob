var ami = new require('asterisk-manager')('5038', 'localhost', 'admin', 'Mtes0206', true);

// In case of any connectiviy problems we got you coverd.
ami.keepConnected();

let { executaQry } = require('./db')

ami.on('queuememberadded', async function (evt) {
    uniqueid = evt.uniqueid
    if (
        evt.event != "RTCPSent" && evt.event != "RTCPReceived" && evt.event != "VarSet") {

        console.log('entrando em LoginFila')
        let qry = `INSERT INTO login_fila(evento, privilege, fila, localizacao, membername, stateinterface, membership, penalty, callstaken, lastcall, estado, pausado ) VALUES('${evt.event}','${evt.privilege}','${evt.queue}','${evt.location}','${evt.membername}','${evt.stateinterface}','${evt.membership}','${evt.penalty}','${evt.callstaken}','${evt.lastcall}','${evt.status}','${evt.paused}')`

        console.log('dado inserido em LoginFila')
        await executaQry(qry)
    }

});

ami.on('queuememberpaused', async function (evt) {
    if (evt.paused >= '1') {
        if (
            evt.event != "RTCPSent" && evt.event != "RTCPReceived" && evt.event != "VarSet") {
            console.log('entrando em PausaFila')
            let qry = `INSERT INTO pausa_fila (evento, privilege, fila, localizacao, membername, pausado, dataPausa, hora) values('${evt.event}','${evt.privilege}','${evt.queue}','${evt.location}','${evt.membername}','${evt.paused}', now(), now())`

            console.log('1 dado gravado ou atualizado, PausaFila')

            await executaQry(qry)


        }
    }

    else if (evt.paused === '0') {
        if (
            evt.event != "RTCPSent" && evt.event != "RTCPReceived" && evt.event != "VarSet") {
            let qry = `UPDATE pausa_fila SET despausado = now() where despausado = ('00:00:00');`
            console.log('1 dado gravado ou atualizado, despausado em PausaFila')

            await executaQry(qry)
        }

    }
})

ami.on('queuememberremoved', async function (evt) {
    uniqueid = evt.uniqueid
    if (
        evt.event != "RTCPSent" && evt.event != "RTCPReceived" && evt.event != "VarSet") {

        console.log('entrando em DeslogaFila')
        let qry = `INSERT INTO desloga_fila(evento, fila, localizacao, membername) VALUES('${evt.event}','${evt.queue}','${evt.location}','${evt.membername}')`

        await executaQry(qry)
    }


});

ami.on('join', async function (evt) {
    uniqueid = evt.uniqueid
    if (
        evt.event != "RTCPSent" && evt.event != "RTCPReceived" && evt.event != "VarSet") {

        console.log('entrando no banco entrar')
        let qry = `INSERT INTO entrar(evento, privilege, channel, calleridnum, calleridname, connectedlinenum, connectedlinename, fila, position, conta, uniqueid) VALUES ('${evt.event}','${evt.privilege}','${evt.channel}','${evt.calleridnum}','${evt.calleridname}','${evt.connectedlinenum}','${evt.connectedlinename}','${evt.queue}',' ${evt.position}','${evt.count}','${evt.uniqueid}');`

        console.log('1 dado gravado ou atualizado, entrar')

        await executaQry(qry)
    }

});


/*
ami.on('join', async function (evt) {
    uniqueid = evt.uniqueid
    if (
        evt.event != "RTCPSent" && evt.event != "RTCPReceived" && evt.event != "VarSet") {

        console.log('entrando no banco entrar')
        let qry = `INSERT INTO logs (user, ramal, fila, motivo, pausa) values('4848','${evt.calleridnum}','${evt.queue})`

        console.log('1 dado gravado ou atualizado, entrar')

        await executaQry(qry)
    }

});
*/
ami.on('dial', async function (evt) {
    if (evt.subevent === 'Begin') {
        uniqueid = evt.uniqueid
        if (
            evt.event != "RTCPSent" && evt.event != "RTCPReceived" && evt.event != "VarSet") {

            console.log('entrando em  evento dial')
            let qry = `INSERT INTO dial(evento, privilege, subevent, channel, destination, calleridnum, calleridname, connectedlinenum, connectedlinename, uniqueid, datauniqueid, dialstring, InicioChamada) VALUES ('${evt.event}','${evt.privilege}','${evt.subevent}','${evt.channel}','${evt.destination}','${evt.calleridnum}','${evt.calleridname}','${evt.connectedlinenum}','${evt.connectedlinename}','${evt.uniqueid}','${evt.destuniqueid}','${evt.dialstring}',now());`
            console.log('dado inserido em dial')
            await executaQry(qry)
        }
    } else if (evt.subevent === 'End') {
        let qry = `update dial set terminoChamada = now(), dialstatus = '${evt.dialstatus}' where uniqueid= '${evt.uniqueid}'`
        console.log('dado atualizado em dial')
        await executaQry(qry)

    }
});

ami.on('musiconhold', async function (evt) {
    uniqueid = evt.uniqueid
    if (
        evt.event != "RTCPSent" && evt.event != "RTCPReceived" && evt.event != "VarSet") {
        if (evt.state === 'Start') {

            console.log('entrando no banco MusicOnHold')
            let qry = `INSERT INTO music_on_hold(evento, privilege, estado, channel, uniqueid, class, dataInicio, hora) VALUES ('${evt.event}','${evt.privilege}','${evt.state}','${evt.channel}','${evt.uniqueid}','${evt.class}',date(now()), time(now()));`

            console.log('1 dado gravado ou atualizado, musiconhold')

            await executaQry(qry)
        } else if (evt.state === 'Stop') {
            console.log('saindo no banco MusicOnHold')
            let qry = `update music_on_hold set dataTermino = now() where uniqueid = '${evt.uniqueid}';`

            console.log('1 dado removido ou atualizado, MusicOnHold')

            await executaQry(qry)

        }

    }
});

ami.on('leave', async function (evt) {
    uniqueid = evt.uniqueid
    if (
        evt.event != "RTCPSent" && evt.event != "RTCPReceived" && evt.event != "VarSet") {
        console.log('entrando em sai')
        let qry = `INSERT INTO sair(evento, privilege, channel, fila, conta, position, uniqueid) VALUES ('${evt.event}','${evt.privilege}','${evt.channel}','${evt.queue}','${evt.count}','${evt.uniqueid}','${evt.uniqueid}');`

        console.log('1 dado gravado ou atualizado, sai')

        await executaQry(qry)
    }

});

ami.on('queuecallerabandon', async function (evt) {
    uniqueid = evt.uniqueid
    if (
        evt.event != "RTCPSent" && evt.event != "RTCPReceived" && evt.event != "VarSet") {
        console.log('entrando em abandon')
        let qry = `INSERT INTO abandon(evento, privilege, fila, uniqueid, position, originalposition, holdtime) VALUES ('${evt.event}','${evt.privilege}','${evt.queue}','${evt.uniqueid}','${evt.position}','${evt.originalposition}','${evt.holdtime}');`

        console.log('1 dado gravado ou atualizado, abandon')

        await executaQry(qry)
    }

});
/*
ami.on('newstate', async function (evt) {
    uniqueid = evt.uniqueid
    if (
        evt.event != "RTCPSent" && evt.event != "RTCPReceived" && evt.event != "VarSet") {
        if (evt.channelstatedesc === 'Ring') {

            let qry = `INSERT INTO ligacoes (channel, channelstate, channelstatedesc, uniqueid) VALUES('${evt.channel}','${evt.channelstate}','${evt.channelstatedesc}','${evt.uniqueid}');`

            await executaQry(qry)

        }


    }

});
*/
ami.on('bridge', async function (evt) {
    if (evt.bridgestate === 'Link') {
        uniqueid = evt.uniqueid
        if (
            evt.event != "RTCPSent" && evt.event != "RTCPReceived" && evt.event != "VarSet") {

            let qry = `INSERT INTO bridge(evento, privilege,  bridgestate, bridgetype, canal1, canal2, uniqueid1, uniqueid2, callerid1, callerid2, DataChamada, InicioChamada) VALUES ('${evt.event}','${evt.privilege}','${evt.bridgestate}','${evt.bridgetype}','${evt.channel1}','${evt.channel2}','${evt.uniqueid1}','${evt.uniqueid2}','${evt.callerid1}','${evt.callerid2}',now(), now());`

            console.log('1 dado gravado ou atualizado, Bridge')

            await executaQry(qry)
        }
    } else if (evt.bridgestate === 'Unlink') {
        if (
            evt.event != "RTCPSent" && evt.event != "RTCPReceived" && evt.event != "VarSet") {

            let qry = `UPDATE bridge SET terminoChamada = now() where terminoChamada = '00:00:00';`

            console.log('1 dado gravado ou atualizado, DesligaBridge')

            await executaQry(qry)
        }
    }
});

ami.on('hangup', async function (evt) {
    uniqueid = evt.uniqueid
    if (
        evt.event != "RTCPSent" && evt.event != "RTCPReceived" && evt.event != "VarSet") {

        console.log('entrando em  evento Hangup')
        let qry = `INSERT INTO desliga (evento, privilege, channel, uniqueid, calleridnum, calleridname, connectedlinenum, connectedlinename, accountcode, causa, causatxt) values('${evt.event}','${evt.privilege}','${evt.channel}','${evt.uniqueid}','${evt.calleridnum}','${evt.calleridname}','${evt.connectedlinenum}','${evt.connectedlinename}','${evt.accountcode}','${evt.cause}','${evt.causetxt}')`
        console.log('dado inserido em Desliga')
        await executaQry(qry)
    }

});

//----------------------------------------------AGENTES EVENTOS-----------------------------------------------

ami.on('agentlogin', async function (evt) {
    uniqueid = evt.uniqueid
    if (
        evt.event != "RTCPSent" && evt.event != "RTCPReceived" && evt.event != "VarSet") {
        let qry = `INSERT INTO AgenteLogin(privilege, agent, canal, uniqueid) VALUES ('${evt.privilege}','${evt.agent}','${evt.channel}','${evt.uniqueid}');`

        console.log('1 dado gravado ou atualizado, AgenteLogin')

        await executaQry(qry)
    }

});

ami.on('agentlogoff', async function (evt) {
    uniqueid = evt.uniqueid
    if (
        evt.event != "RTCPSent" && evt.event != "RTCPReceived" && evt.event != "VarSet") {
        let qry = `INSERT INTO AgenteLogoff(privilege, agent, tempologin, uniqueid) VALUES ('${evt.privilege}','${evt.agent}','${evt.longtime}','${evt.uniqueid}');`

        console.log('1 dado gravado ou atualizado, AgenteLogoff')

        await executaQry(qry)
    }

});

ami.on('agentcalled', async function (evt) {
    uniqueid = evt.uniqueid
    if (
        evt.event != "RTCPSent" && evt.event != "RTCPReceived" && evt.event != "VarSet") {
        let qry = `INSERT INTO AgentCalled(evento, privilege, fila, agentcalled, agentname, channelcalling, destinationchannel, calleridnum, calleridname, connectedlinenum, connectedlinename, context, extension, prioridade, uniqueid) VALUES ('${evt.event}','${evt.privilege}','${evt.queue}','${evt.agentcalled}','${evt.agentname}','${evt.channelcalling}','${evt.destinationchannel}','${evt.calleridnum}','${evt.calleridname}','${evt.connectedlinenum}','${evt.connectedlinename}','${evt.context}','${evt.extension}','${evt.priority}','${evt.uniqueid}');`

        console.log('1 dado gravado ou atualizado, AgentCalled')

        await executaQry(qry)
    }

});

ami.on('agentconnect', async function (evt) {
    uniqueid = evt.uniqueid
    if (
        evt.event != "RTCPSent" && evt.event != "RTCPReceived" && evt.event != "VarSet") {
        let qry = `INSERT INTO AgentConnect(evento, privilege, fila, uniqueid, canal, member, menbroNome, tempoEspera, bridgedchannel, ringtime) VALUES ('${evt.event}','${evt.privilege}','${evt.uniqueid}','${evt.queue}','${evt.channel}','${evt.member}','${evt.membername}','${evt.holdtime}','${evt.bridgedchannel}','${evt.ringtime}' now());`

        console.log('1 dado gravado ou atualizado, AgentConnect')

        await executaQry(qry)
    }

});    