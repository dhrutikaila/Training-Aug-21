//Using Function Constructor, find the area of rectangle
//create a function using Function( ) constructor along with the new operator.
var func = new Function("l","b","return l*b;");

function area(){
    let ans;
    ans = func(10,5);
    console.log("Area of rectangle is "+ ans)
}
area();

// var func = function (length , width)
// {
// 	this.length = length ;
// 	this.width = width;
//     var ans;
//     ans = length * width ;
// };

// var AreaOfRec = new func(5 ,10)
// console.log(AreaOfRec.ans)
