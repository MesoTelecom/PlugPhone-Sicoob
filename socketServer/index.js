const http = require('http');
const express = require('express');
const socketIo = require('socket.io');

const app = express();
const server = http.createServer(app);
const io = socketIo(server);
io.on('connection', (socket) => {
  console.log('Um cliente se conectou.');

  socket.on('Chat message', (message) => {
    console.log(`Mensagem do cliente ${socket.id}: ${message}`);
    io.emit('Chat message', { id: socket.id, message }); // Transmita a mensagem para todos os clientes, incluindo o remetente
  });

  socket.on('disconnect', () => {
    console.log('Um cliente se desconectou.');
  });
});

const PORT = process.env.PORT || 4113;
server.listen(PORT, () => {
  console.log(`Servidor Socket.IO está ouvindo na porta ${PORT}`);
});