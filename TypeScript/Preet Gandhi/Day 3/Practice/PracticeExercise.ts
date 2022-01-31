//GENERIC
//Generic function
function display<T>(arg: T): T{
    return arg;
}

let output1 = display<string>("Welcome");
let output2 = display<number>(50);
let output3 = display<boolean>(true);
console.log(`${output1}, ${output2}, ${output3}`);
console.log("-------------------------------------------");

//Generic class
class StudentInfo<T,U>
{
    private Id: T;
    private Name: U;
    setValue(id: T, name: U): void{
        this.Id = id;
        this.Name = name;
    }

    display(): void{
        console.log(`Id= ${this.Id} and Name= ${this.Name}`);
    }
}

let student = new StudentInfo<number,string>();
student.setValue(1, "Hiren");
student.display();
let student2 = new StudentInfo<string,string>();
student2.setValue("Two", "Jeet");
student2.display();
console.log("-------------------------------------------");

//Generuic interface as type
interface KeyPair<T,U> {
    key: T;
    value: U;
}

let Kv1: KeyPair<number,string> = {key:1,value: "One"};
let Kv2: KeyPair<string,string> = {key:"Two", value: "Two"};
console.log("-------------------------------------------");

//Generic interface as Function Type
interface StudentInfo2<T,U>{
    (id: T, value: U): void;
}

function studentData(id: number, value: string): void{
    console.log(`Id: ${id}, Value: ${value}`);
}
let std: StudentInfo2<number, string> = studentData;
std(15, "Hiren Panchal");
console.log("-------------------------------------------");

//Array using generic
function getArray<T>(items: T[]) : T[] {
    return new Array<T>().concat(items);
}

let myStrArr = getArray<string>(["Hiii", "Hello"]);
// myStrArr.push(5); //Error due to string data type
myStrArr.push("Hey");
console.log(myStrArr);

let myNumArr = getArray<number>([5,7]);
// myNumArr.push("Hey"); //Error due to number data type
myNumArr.push(10);
console.log(myNumArr);
console.log("+++++++++++++++++++++++++++++++++");


//MODULES
//Generic class Implements generic Interface
interface IKeyValueProcessor<T,U>
{
    process(key: T, val: U): void;
};

//Export
export {StudentInfo, IKeyValueProcessor, studentCalc};


//NAMESPACES
namespace studentCalc{
    export function AnnualFeeCalc(feeAmount: number, term: number){
        return feeAmount * term;
    }
}




