
const fs = require('fs');
exec = require('child_process').exec;

// Assuming that 'path/file.txt' is a regular file.



var CronJob = require('cron').CronJob;
var job = new CronJob(
    '0 59 23 * * *',
    async function () {

       exec('echo "" >  CAD14-out.log-20230430')
       exec('echo "" >  CAD14-out.log')
       exec('echo "" >  CAD14-error.log')
       exec('echo "" >  GRAVACAO-error.log')
       exec('echo "" >  GRAVACAO-out.log')
    },
    null,
    true,
    'America/Sao_Paulo'
);