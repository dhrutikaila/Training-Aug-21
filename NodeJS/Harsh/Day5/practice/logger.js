// * Extending EventEmitter Class
const EventEmitter = require("events");


class Logger extends EventEmitter {
    log(message) {
        console.log(message);
        this.emit("loggerEvent", "Calling from log method.");
    }
}

module.exports = Logger;
