const admin = require('firebase-admin');

const serviceAccount = require('./plugphone-2d637-firebase-adminsdk-fbsvc-1096a56db2.json');

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount)
});


console.log("Sou admin", admin.app().options.credential.projectId)