// * var vs let
var v = 0;
let l = 0;
if (1) {
  var v = 99;
  let l = 99;
  console.log(`var inside block: ${v}`);
  console.log(`let inside block: ${l}`);
}
a = () => {
  var v = 999;
  let l = 999;
  console.log(`var inside function: ${v}`);
  console.log(`let inside function: ${l}`);
};
a();

console.log(`var outside block: ${v}`);
console.log(`let outside block: ${l}`);
