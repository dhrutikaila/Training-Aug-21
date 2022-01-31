var names=["Shreya","diya","dharal","riya"];
console.log(names[1]);

//convert array to string
console.log(names.toString());

//join also used to join all array element to string , here we can also add separator
console.log(names.join('-'));

//pop is remove last element from array 
console.log(names.pop());
console.log(names);

//push is used to add element at the end of array and its also return array length
console.log(names.push("Thakkar"));
console.log(names);

//shifting is same as pop but it will remove first element instead of last
console.log(names.shift())
console.log(names)

//unshift is same as push but it will add element at the first instead of last and it also return the new length
console.log(names.unshift("Riya"))
console.log(names)

//change the element values by using index number 
names[1]="Deeya"
console.log(names)

//deleting element by using delete keyword but after deleting element it returns empty so rather than this we can use pop and shift for 
//removing element

delete names[1]
console.log(names);
names[1]="Shreya"
console.log(names);

//splice is used for adding the element and delete the element also in between any element
//it will replace shreya to patel (remove shreya and add patel)
names.splice(1,1,"Patel")
console.log(names)

//using splice we can also remove the element
//it will remove second , third element
names.splice(1,2)
console.log(names)

//merge the two array by using concat 
var firstname=["shreya","dharal","riya"]
var lastname=["Thakkar","patel","shah"]
var FLname=firstname.concat(lastname);
console.log(FLname)
//merging an array with array's value 
var fname=firstname.concat("Dhyanvi");
console.log(fname);

//slice method creates a new array it does not remove any element from the actual array 
var lname=lastname.slice(1);
console.log(lname);
console.log(lastname);