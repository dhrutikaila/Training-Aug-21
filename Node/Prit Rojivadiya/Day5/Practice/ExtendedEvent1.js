const Logger = require('./ExtendedEvent');
console.log(Logger);

const logger = new Logger();

logger.on('Extendedevent',()=>{
    console.log('extended event called');
})

logger.log('Hello');