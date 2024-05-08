const express = require("express");
const App = express();
const http = require('http');
const CORS = require("cors");
const BodyParser = require('body-parser');
const DB = require('./db');
const auth = require("./routes/auth");
const socketIO = require('socket.io');
const initialiseSockets = require('./socket');

App.use(CORS());
App.use(express.json());

// Parse application/json
App.use(BodyParser.json({ limit: '100mb' }));
// Parse application/json
App.use(BodyParser.urlencoded({ extended: false, limit: '50mb' }));

//Routes
App.use("/api/auth", auth);

const server = http.createServer(App);
const io = socketIO(server);
initialiseSockets(io);

App.listen(5000, () => {
  console.log("Convo cove Server Running at http://localhost:5000");
});
