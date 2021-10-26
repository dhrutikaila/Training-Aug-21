console.log("Hello Storage Practice");

//adding key value pair in local storage
localStorage.setItem('Name','Piyush')
localStorage.setItem('Name1','hit')
localStorage.setItem('Name2','yash')

//clears all local storage
// localStorage.clear();

//clears particular key value pair
localStorage.removeItem('Name2')

//retrive an single item 

var a=localStorage.getItem('Name')

console.log(a);

var arr=['i1','i2','i3']
localStorage.setItem('array',arr)

var arr1 =['piyush','hit','yash','mihir']
localStorage.setItem('friends',JSON.stringify(arr1))

var b=JSON.parse(localStorage.getItem('friends'))
console.log(b);