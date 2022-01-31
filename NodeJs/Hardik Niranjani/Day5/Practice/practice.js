const Event = require('events');
const events= new Event();



// create events 
events.on('start',function(){
    console.log('event started')
});

//function

function f1(){
    console.log('event started');
}

function f2(){
    console.log('2nd event started');
}

const events_1 = new Event();

// ragister for e1
events_1.on('e1',f1) 



// Os modules 

const OS = require('os');

// hostname 
var hostname = OS.hostname();

// uptime
var uptime = OS.uptime();

// Memory size
var Memory = OS.memory();

// verson
var verson = OS.version();

// user information
var User = OS.userInfo();

console.log(
    `HostName: ${hostname},
     Uptime: ${uptime}, 
     Total Memory: ${Memory},
     Verson: ${verson},
     User Information: ${User}`
    )
