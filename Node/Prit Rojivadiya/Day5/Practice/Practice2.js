const EventEmitter = require('events');

const emitter = new EventEmitter();

emitter.on('start',()=>{
    console.log('started');
})

emitter.emit('start')

emitter.on('startWithArg',(arg)=>{
    console.log(`started at ${arg}`)
})

emitter.emit('startWithArg',10);

emitter.on('startEnd',(start,end)=>{
    console.log(`starting from ${start} to ${end}`);
})

emitter.emit('startEnd',1,100)