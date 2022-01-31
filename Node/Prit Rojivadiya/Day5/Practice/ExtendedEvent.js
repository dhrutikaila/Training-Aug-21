const EventEmitter = require('events');

class Emitter extends EventEmitter{
    log(message){
        console.log(message);
        this.emit('Extendedevent');
    }
}

module.exports = Emitter;