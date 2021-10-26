//es6

//template strings

var person = {
    firstName: "Raviraj",
    LastName: "padhiyar",
}

sen1 = "hello " + person.firstName + " " + person.LastName;


sen2 = `hello ${person.firstName} ${person.LastName.charAt(0).toUpperCase() + person.LastName.slice(1)}`;

console.log(sen2);

//use template string for dom manipulation

var person = {
    name: "Raviraj",
    job: "Trainee",
    hobbies: ["chess", "traveling"]
}

const container = document.querySelector(".container");

container.innerHTML = `
<h1>${person.name}</h1>
<p>${person.job}</p>
<ul>${person.hobbies.map(item => {
    return `<li>${item}</li>`
}).join("")}</ul>
`

//tagged template literals

const author = "Some Author";
const statement = "Some statement";

const quote = highlight`Here is the ${statement} by ${author} and it could not be more true`;
console.log(quote);

const result = document.getElementById("result");
result.innerHTML = quote;

function highlight(text, ...vars) {
    const highlightedText = text.map((item, index) => {
        return `${item} <strong class="blue">${vars[index] || ""}</strong>`;
    });
    return highlightedText.join("");
}


//array destructure

//array of fruit qunatity

var fruitQ = [26, 30, 50]; // index 1 for banana 2 for oragnes 3 for apple

var [bananaQ, orangesQ, appleQ] = fruitQ;

console.log(bananaQ, appleQ, orangesQ);



//swaping variable

let first = "raviraj";
let second = "Sagar";

//standard method is use an temp variable

// let temp = first;
// first = second
// second = temp;

//es6 syntax

[first, second] = [second, first];

console.log(first, second);


//

var person = {
    firstName: "Raviraj",
    LastName: "Padhiyar",
    Age: 21,
    hobbies: ["chess", "travel"]
}


let { firstName, LastName, Age, hobbies: { [0]: hobbies1 } } = person;

console.log(firstName, LastName, Age, hobbies1);



function foo({ firstName, Age: a }) {
    console.log(firstName, a);
}

foo(person);


//spread operator

let indoorSport = ["chess", "karate", "badminton", "tableTenis"];
let outdoorSport = ["cricket", "hockey", "football"];

// const sports = [indoorSport, outdoorSport]; // sports will contain two array instead of indiviual strings


const sports = [...indoorSport, ...outdoorSport];

console.log(sports);

//with objects

var person2 = { ...person, job: "developer" };

console.log(person2);


//using with nodelist and html collections

// console.log(document.getElementsByTagName("h1"));

const heading = document.querySelectorAll("h1"); //select h1 tag ele


// console.log(heading.map(item => {console.log(item);})) // not work

const ele = [...heading];

ele.map(item => console.log(item));

//spread operator in function

let nums = [12, 23, 43, 86, 123];

// console.log(Math.max(nums));// return Nan because nums is an array


console.log(Math.max(...nums)); //return 123 the largest in nums;





