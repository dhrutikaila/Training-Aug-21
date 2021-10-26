const EventEmitter = require('events');
const emitter = new EventEmitter();

emitter.on('log',()=>{
    console.log('working')
})
emitter.emit('log');


emitter.on('myEvent',function(a,b){
    console.log(a, b, this, this === emitter);
})
emitter.emit('myEvent',10,20);


emitter.on('myEvent1',(a,b)=>{
    console.log(a, b, this, this === emitter);
})
emitter.emit('myEvent1',10,20);

// handling event Asynchronously
emitter.on('event2',(a,b)=>{
    setImmediate(() => {
        console.log('this happens asynchronously');
      });
})
emitter.emit('event2',10,20)
emitter.emit('event2',10,20)
emitter.emit('event2',10,20)
emitter.emit('event2',10,20)
emitter.emit('event2',10,20)


// Handling events one at a time
let m = 0;
emitter.on('event3',()=>{
   console.log(++m)
})
emitter.emit('event3')
emitter.emit('event3')
emitter.emit('event3')
emitter.emit('event3')
emitter.emit('event3')


// called at most one time
emitter.once('callOnce',()=>{
    console.log('this is called only once')
})
emitter.emit('callOnce')
emitter.emit('callOnce')
emitter.emit('callOnce')


// handling error
emitter.on('error', (err) => {
    console.error('whoops! there was an error',err);
  });
emitter.emit('error', new Error('whoops!'));

