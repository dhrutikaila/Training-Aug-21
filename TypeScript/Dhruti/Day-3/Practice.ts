
function color(arg:string){
  return arg;

}


//generic class
class studinfo<T,U>{
  private ID:T;
  private name:U;
  setvalue(id:T,name:U):void{
    this.ID=id;
    this.name=name;
  }
  display():void{
    console.log(`id=${this.ID},name=${this.name}`);
  }
}
let st=new studinfo<number,string>();
st.setvalue(101,"dhruti");
st.display();
let std=new studinfo<string,string>();
std.setvalue("1","meet");
std.display();


//interface
interface studtinfo<T,U>{
  (ID:T,value:U):void;
};
function studentData(id:number,value:string):void{
  console.log('id= '+ id + ',\nName='+value)
}
let std1: studtinfo<number,string>= studentData;
std1(11,"dhruti patel"); 

//export and import Module
export interface StringValidator{
  isAcceptable(s:string):boolean;
}

//NameSpacing 
//Namespace validartors
namespace Validation {
  export interface StringValidator {
    isAcceptable(s: string): boolean;
  }
  const lettersRegexp = /^[A-Za-z]+$/;
  const numberRegexp = /^[0-9]+$/;
  export class LettersOnlyValidator implements StringValidator {
    isAcceptable(s: string) {
      return lettersRegexp.test(s);
    }
  }
  export class ZipCodeValidator implements StringValidator {
    isAcceptable(s: string) {
      return s.length === 5 && numberRegexp.test(s);
    }
  }
}
// Some samples to try
let strings = ["Hello", "98052", "101"];
// Validators to use
let validators: { [s: string]: Validation.StringValidator } = {};
validators["ZIP code"] = new Validation.ZipCodeValidator();
validators["Letters only"] = new Validation.LettersOnlyValidator();
// Show whether each string passed each validator
for (let s of strings) {
  for (let name in validators) {
    console.log(
      `"${s}" - ${
        validators[name].isAcceptable(s) ? "matches" : "does not match"
      } ${name}`
    );
  }
}