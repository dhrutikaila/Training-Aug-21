// os module

// var os = require("os");

// console.log(os.arch());
// console.log(os.hostname());
// console.log(os.platform());
// console.log(os.tmpdir())
// console.log(os.type());
// console.log(os.cpus());
// console.log(os.homedir());
// console.log(os.endianness());
// console.log(os.loadavg());
// console.log(os.networkInterfaces());
// console.log(os.release());
// console.log(os.uptime());
// console.log(os.userInfo());

// var freememory = os.freemem();
// console.log(`${freememory / 1024 / 1024 / 1024}`);

// var totalmemory = os.totalmem();
// console.log(`${totalmemory / 1024 / 1024 / 1024}`);

// event module

const EventEmitter = require("events");
const eventEmitter = new EventEmitter();

console.log(eventEmitter.eventNames());


// * Create an event handler:
const newEventHandler = () => {
    console.log("newEvent Handler");
};


// * Assign the event handler to an event:
eventEmitter.on("newEvent", newEventHandler);
// eventEmitter.addListener("newEvent", newEventHandler);

// * Fire the event:
eventEmitter.emit("newEvent");

console.log(eventEmitter.eventNames());

console.log(eventEmitter.getMaxListeners());

eventEmitter.setMaxListeners(20);
console.log(eventEmitter.getMaxListeners());

console.log(eventEmitter.eventNames());


eventEmitter.addListener("newEvent", () => {
    console.log("Second Event Handler");
});

eventEmitter.emit("newEvent");

console.log(eventEmitter.listeners("newEvent"));
console.log(eventEmitter.listenerCount("newEvent"));

eventEmitter.removeAllListeners("newEvent");

eventEmitter.once("eventOnce", () => {
    console.log("Called Once.");
});
eventEmitter.emit("eventOnce");
eventEmitter.listenerCount("eventOnce");

const Logger = require("./logger");
const objLogger = new Logger();

objLogger.on("loggerEvent", (arg) => {
    console.log(`Logger Event ${arg}`);
});

objLogger.log("Extending EventEmitter Class.");







