console.log("hello World");
var num1=parseInt(prompt("Enter First Number"));
var num2=parseInt(prompt("Enter the Second Number"));
var num3=parseInt(prompt("Enter Third Number"));
if(num1>num2 & num1>num3)
{
    console.log("number1 "+num1+" is grestest number");
}
else if(num2>num1 & num2>num3){
    console.log("number2 "+num2+" is grestest number");   
}
else if(num1==num2 & num2==num3){
    console.log("all numbers are equals");
}
else if (num1+num2+num3>40){
    console.log(num1+num2+num3);
}
else{
    console.log("none30330");
}

var arr=Array();
arr.push("Ahmedabad");
arr.push("Surat");
arr.push("vadodra");
arr.push("Bhavnagar");
arr.push("himmatnagar");
for(i=0;i<arr.length;i++){
    alert(arr[i]);
}