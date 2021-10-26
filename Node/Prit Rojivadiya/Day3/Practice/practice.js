// global objects

console.log(__dirname);
console.log(__filename);
console.log(module);

// exporting module
function add(n1,n2){
    console.log(n1+n2);
}

function sub(n1,n2){
    console.log(n1-n2);
}

const name = "Prit";
// module.exports.addition = add;
// module.exports.name = name;

module.exports = {add,sub,name}; 