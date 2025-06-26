
    let ami = new require('asterisk-manager')('5038', 'localhost', 'admin', 'Mtes0206', true);

    ami.keepConnected();
    let dataAtual = new Date();
    let data = dataAtual.getHours().toString().padStart(2, '0')
    let cont = 0

    async function  getHora(){

        data = dataAtual.getHours().toString().padStart(2, '0')

        return(data)
    }


    console.log(data)

    let { executaQry } = require('./db')


    ami.on('join', async function (evt) {
        uniqueid = evt.uniqueid
        if (
            evt.event != "RTCPSent" && evt.event != "RTCPReceived" && evt.event != "VarSet") {
            


                if (data === '00') {
                    cont++
                    let qry = `UPDATE meso_fluxo_ligacao set total = ${cont}, datahora = now() where id = 1`
                    await executaQry(qry)
                }
                else if (data == '01') {
                    cont++
                    let qry = `UPDATE meso_fluxo_ligacao set total = ${cont}, datahora = now() where id = 2`

                    await executaQry(qry)

                    console.log('teste 01h')
                }
                else if (data == '02') {
                    cont++
                    let qry = `UPDATE meso_fluxo_ligacao set total = ${cont}, datahora = now() where id = 3`

                    await executaQry(qry)

                    console.log('teste 02h')
                }
                else if (data == '03') {
                    cont++
                    let qry = `UPDATE meso_fluxo_ligacao set total = ${cont}, datahora = now() where id = 4`

                    await executaQry(qry)

                    console.log('teste 03h')
                }
                else if (data == '04') {
                    cont++
                    let qry = `UPDATE meso_fluxo_ligacao set total = ${cont}, datahora = now() where id = 5`

                    await executaQry(qry)

                    console.log('teste 4h')
                }
                else if (data == '05') {
                    cont++
                    let qry = `UPDATE meso_fluxo_ligacao set total = ${cont}, datahora = now() where id = 6`

                    await executaQry(qry)

                    console.log('teste 5h')
                }
                else if (data == '06') {
                    cont++
                    let qry = `UPDATE meso_fluxo_ligacao set total = ${cont}, datahora = now() where id = 7`

                    await executaQry(qry)

                    console.log('teste 6h')
                }
                else if (data == '07') {
                    cont++
                    let qry = `UPDATE meso_fluxo_ligacao set total = ${cont}, datahora = now() where id = 8`

                    await executaQry(qry)

                    console.log('teste 7h')
                }
                else if (data == '08') {
                    cont++
                    let qry = `UPDATE meso_fluxo_ligacao set total = ${cont}, datahora = now() where id = 9`

                    await executaQry(qry)

                    console.log('teste 8h')
                }
                else if (data == '09') {
                    cont++
                    let qry = `UPDATE meso_fluxo_ligacao set total = ${cont}, datahora = now() where id = 10`

                    await executaQry(qry)

                    console.log('teste 9h')
                }
                else if (data == '10') {
                    cont++
                    let qry = `UPDATE meso_fluxo_ligacao set total = ${cont}, datahora = now() where id = 11`

                    await executaQry(qry)

                    console.log('teste 10h')
                }
                else if (data == '11') {
                    cont++
                    let qry = `UPDATE meso_fluxo_ligacao set total = ${cont}, datahora = now() where id = 12`

                    await executaQry(qry)

                    console.log('teste 11h')
                }
                else if (data == '12') {
                    cont++
                    let qry = `UPDATE meso_fluxo_ligacao set total = ${cont}, datahora = now() where id = 13`

                    await executaQry(qry)

                    console.log('teste 12h')
                }
                else if (data == '13') {
                    cont++
                    let qry = `UPDATE meso_fluxo_ligacao set total = ${cont}, datahora = now() where id = 14`

                    await executaQry(qry)

                    console.log('teste 13h')
                }
                else if (data == '14') {
                    cont++
                    let qry = `UPDATE meso_fluxo_ligacao set total = ${cont}, datahora = now() where id = 15`

                    await executaQry(qry)

                    console.log('teste 14h')
                }
                else if (data == '15') {
                    cont++
                    let qry = `UPDATE meso_fluxo_ligacao set total = ${cont}, datahora = now() where id = 16`

                    await executaQry(qry)

                    console.log('teste 15h')
                }
                else if (data == '16') {
                    cont++
                    let qry = `UPDATE meso_fluxo_ligacao set total = ${cont}, datahora = now() where id = 17`

                    await executaQry(qry)

                    console.log('teste 16h')
                }
                else if (data == '17') {
                    cont++
                    let qry = `UPDATE meso_fluxo_ligacao set total = ${cont}, datahora = now() where id = 18`

                    await executaQry(qry)

                    console.log('teste 17h')
                }
                else if (data == '18') {
                    cont++
                    let qry = `UPDATE meso_fluxo_ligacao set total = ${cont}, datahora = now() where id = 19`

                    await executaQry(qry)

                    console.log('teste 18h')
                }
                else if (data == '19') {
                    cont++
                    let qry = `UPDATE meso_fluxo_ligacao set total = ${cont}, datahora = now() where id = 20`

                    await executaQry(qry)

                    console.log('teste 19h')
                }
                else if (data == '20') {
                    cont++
                    let qry = `UPDATE meso_fluxo_ligacao set total = ${cont}, datahora = now() where id = 21`

                    await executaQry(qry)

                    console.log('teste 20h')
                }
                else if (data == '21') {
                    cont++
                    let qry = `UPDATE meso_fluxo_ligacao set total = ${cont}, datahora = now() where id = 22`

                    await executaQry(qry)

                    console.log('teste 21h')
                }
                else if (data == '22') {
                    cont++
                    let qry = `UPDATE meso_fluxo_ligacao set total = ${cont}, datahora = now() where id = 23`

                    await executaQry(qry)

                    console.log('teste 22h')
                }
                else if (data == '23') {
                    cont++
                    let qry = `UPDATE meso_fluxo_ligacao set total = ${cont}, datahora = now() where id = 24`

                    await executaQry(qry)

                    console.log('teste 23h')
                    
                }
                
            
        }



    });


