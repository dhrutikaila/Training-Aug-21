// 1. Generics
class BeeKeeper {
    hasMask: boolean = true;
  }
   
  class ZooKeeper {
    nametag: string = "Mikle";
  }
   
  class Animal {
    numLegs: number = 4;
  }
   
  class Bee extends Animal {
    keeper: BeeKeeper = new BeeKeeper();
  }
   
  class Lion extends Animal {
    keeper: ZooKeeper = new ZooKeeper();
  }
   
  function createInstance<A extends Animal>(c: new () => A): A {
    return new c();
  }
   
  createInstance(Lion).keeper.nametag;
  createInstance(Bee).keeper.hasMask;

// NameSpaces
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
  
//generic function
function display<T>(args: T): T{
    return args;
}
let output1 = display<string>("welcome");
let output2 = display<number>(100);
console.log(output2);
console.log(output1);

// Generic class
class StudentInfo<T, U>{
    private Id: T;
    private Name: U;
    setValue(id:T,name:U): void{
        this.Id = id;
        this.Name = name;

    }
    display(): void{
        console.log(`Id=${this.Id},Name=${this.Name}`);
    }
}
let st = new StudentInfo<number, string>();
st.setValue(10, "Leo Messi");
st.display();
let std = new StudentInfo<string, string>();
std.setValue("201", "Sergio Busquets");
st.display();

// Generic interface as function
interface StudentInfo1<T, U>{
    (id: T, value: U): void;
}

function studentData(id:number,value:string):void {
    console.log('Id= '+id+', \nName = '+value)
}
function studentData1(id:string,value:string):void {
  console.log('Id= '+id+', \nName = '+value)
}

let stdd: StudentInfo1<number, string> = studentData;
stdd(11, "Chhteri");


