const os = require('os');

console.log(os.EOL)
console.log(os.arch()) // x64
console.log(os.constants);
console.log(os.constants.signals);
console.log(os.cpus())
console.log(os.cpus()[0].model)
console.log(os.cpus()[0].times.user)
console.log(os.totalmem()/1024/1024/1024)
console.log(os.freemem()/1024/1024/1024) //remaining memory of RAM in GBs
console.log(os.homedir());
console.log(os.hostname());
console.log(os.networkInterfaces());
console.log(os.platform())
console.log(os.release())
console.log(os.tmpdir())
console.log(os.type())
console.log(os.uptime()) // in seconds
console.log(os.userInfo())
console.log(os.version())