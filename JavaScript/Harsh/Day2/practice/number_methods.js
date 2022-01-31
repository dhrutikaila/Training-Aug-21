var x = 123;
console.log(x.toString());

var x = 9.656;
console.log(x.toExponential(2));

var x = 9.656;
console.log(x.toFixed(2));

var x = 9.656;
console.log(x.toPrecision(2));

var x = 123;
console.log(x.valueOf());


console.log(Number(true));
console.log(Number(false));
console.log(Number("10"));
console.log(Number("   10"));
console.log(Number("30, 40"));
console.log(Number("30 40"));
console.log(Number("john"));
console.log(Number(new Date("1970-01-01")));
console.log(Number(new Date("1970-01-02")));


console.log(parseInt("-10"));
console.log(parseInt("-10.33"));
console.log(parseInt("10"));
console.log(parseInt("10.33"));
console.log(parseInt("10 20 30"));
console.log(parseInt("10 years"));
console.log(parseInt("years 10"));

console.log(parseFloat("10"));
console.log(parseFloat("10.33"));
console.log(parseFloat("10 20 30"));
console.log(parseFloat("10 years"));
console.log(parseFloat("years 10"));

console.log(Number.MAX_VALUE);

console.log(Number.MIN_VALUE);

console.log(Number.POSITIVE_INFINITY);

var x = 1 / 0;
console.log(x);

console.log(Number.NEGATIVE_INFINITY);

var x = -1 / 0;
console.log(x);

console.log(Number.NaN);

var x = 100 / "Apple";
console.log(x);