//Import
import {StudentInfo, IKeyValueProcessor, studentCalc} from "./PracticeExercise";

//Generic class
let student3 = new StudentInfo<number,string>();
student3.setValue(3, "Hitesh");
student3.display();
console.log("-------------------------------------------");

//Generic class Implements generic Interface
class KvProcessor<T,U> implements IKeyValueProcessor<T,U>{
    process(key: T, val: U): void {
        console.log(`Key: ${key}, Value: ${val}`);
    }
}

let proc: IKeyValueProcessor<number,string> = new KvProcessor();
proc.process(1,"Generic");
console.log("+++++++++++++++++++++++++++++++++");

//NAMESPACE
///<reference path = "./studentCalc.ts" />

let TotalFee = studentCalc.AnnualFeeCalc(1000, 4);
console.log(TotalFee);