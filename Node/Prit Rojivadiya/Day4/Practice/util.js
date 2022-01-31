const util = require("util");
const fs = require("fs");

// callbackify Takes an async function (or a function that returns a Promise) and
// returns a function following the error-first callback style, i.e. taking an (err, value) => ...

async function fn() {
  return "hello";
}

const cbFun = util.callbackify(fn);

cbFun((err, res) => {
  console.log(res);
});

console.log(util.format("%s:%s", "foo"));

console.log(util.format("%s:%s", "foo", "bar", "baz"));

console.log(util.format(1, 2, 3));

console.log(
  util.formatWithOptions({ colors: true }, "See object %O", { hi: 42 })
);
console.log(util.formatWithOptions({ colors: true }, "See object %d", 19));

// console.log(util.inspect(util, { showHidden: true, depth: null }));

fs.access("file/that/does/not/exist", (err) => {
  const name = util.getSystemErrorName(err.errno);
  console.error(name); // ENOENT
});

fs.access("file/that/does/not/exist", (err) => {
  const errorMap = util.getSystemErrorMap();
  const name = errorMap.get(err.errno);
  console.error(name); // ENOENT
});

const o = {
  a: [
    1,
    2,
    [
      [
        "Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit, sed do " +
          "eiusmod \ntempor incididunt ut labore et dolore magna aliqua.",
        "test",
        "foo",
      ],
    ],
    4,
  ],
  b: new Map([
    ["za", 1],
    ["zb", "test"],
  ]),
};
console.log(util.inspect(o, { compact: true, depth: 5, breakLength: 80 }));


// $env:DEBUG='foo' then run node util.js
const debuglog = util.debuglog('foo'); 
debuglog('Prit from foo [%d]', 123);


obsoleteFunction = util.deprecate(() => {
    console.log('depricated')
  }, 'obsoleteFunction() is deprecated. Use newShinyFunction() instead.');

obsoleteFunction();
