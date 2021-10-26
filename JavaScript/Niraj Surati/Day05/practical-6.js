//6.Explain Function closure with practical

const add = (() => {
    let counter = 0;
    return () => { counter += 1; return counter}
})();

console.log(add());
console.log(add());
console.log(add());
console.log(add());
console.log(add());
console.log(add());

