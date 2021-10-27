var name1="Shreya";
 console.log(name1)
//add double quatoes in string 
 var text="\"Shreya\""
 console.log(text)
 var text1 = "It\'s alright"
 console.log(text1)
 console.log(text1.length)

 //extracting part of string by using slice , substring , substr method 

 //slice extracts a part of string and return a value as a new string (count position from zero )

 var str="Shreya thakkar"
 console.log(str.slice(7,14))

//slice operation using negative value (it will start from end of the string )
console.log(str.slice(-6,-2))

//if we dont give second parameter then method will slice out the rest of the thing 
console.log(str.slice(4))

//substring cannot accept negative position 

var str1="java learning from javatpoint"
console.log(str1.substring(5,13))

//substr is same as slice but second parameter is length of that string 
console.log(str1.substr(0,13))

console.log(str1.substr(-12))

//replace is use to replace the value with another string 
//it returns the new string 
console.log(str1.replace("java","javascript"))

//uppercase
console.log(str.toUpperCase())

//lowecase
console.log(str.toLowerCase())

//concar two string
console.log(str.concat(str1))

//remove white space
var trim = "   shreya   "
console.log(trim.trim())

//charAt : return the index
var c = "shreya";
console.log(c.charAt(0))

//charcodeat method returns the unicode of the character 

console.log(c.charCodeAt(0))

//split convert array from string 

var a ="sar-jen"
console.log(a.split("-"))

//index of return the index of first occurence of a text in string 

var b = "string method learning string"
console.log(b.indexOf('string'))

//a second parameter as the starting position for the search
console.log(b.indexOf('string',20))

//it will return last occurence of text  index

console.log(b.lastIndexOf('string'))

//if the text is not found then it return the -1

console.log("word is not found"+b.indexOf('give'))

//serrch and indexof method are not same bcz the indexof method accept second parameter but the search does not accept the second paramenter

//match method is search the string for a match against a regular expression

var n = "shreya preya"
console.log(n.match(/re/g))

//include method return true if the string contain specified value 

console.log(n.includes('hr'))

//starts with return true if the string begin with specified value

console.log(n.startsWith('shreya'))
console.log(n.startsWith('thakkar'))
