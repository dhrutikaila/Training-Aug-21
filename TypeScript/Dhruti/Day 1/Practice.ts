var age:number=44;
var Name :string ="dhruti";
var isUpdated: boolean=true;
console.log( age);
console.log(Name);
console.log(isUpdated);

 function helloUser(): void{
     alert("this is a welcome message");
 }
 helloUser();


 //enum
 enum Color {
    Red = 1,
    Green,
    Blue,
  }
  let colorName: string = Color[2];
   
  // Displays 'Green'
  console.log(colorName);

