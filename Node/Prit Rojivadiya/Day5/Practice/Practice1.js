function main() {
    setTimeout(() => console.log('1'), 0);
    setImmediate(() => console.log('2'));
  }

  main();

function main1() {
  setTimeout(() => console.log("1"), 50);
  process.nextTick(() => console.log("2"));
  setImmediate(() => console.log("3"));
  process.nextTick(() => console.log("4"));
}

main1();

const fs = require("fs");

function main2() {
  setTimeout(() => console.log("1"), 0);
  setImmediate(() => console.log("2"));

  fs.readFile("./xyz.txt", (err, buff) => {
    setTimeout(() => {
      console.log("3");
    }, 1000);

    process.nextTick(() => {
      console.log("process.nextTick");
    });

    setImmediate(() => console.log("4"));
  });

  setImmediate(() => console.log("5"));

  setTimeout(() => {
    process.on("exit", (code) => {
      console.log(`close callback`);
    });
  }, 1100);
}

main2();
