//import class 
import { Animal, IEmployee} from "./PracticeExercise";

//inheritance
class Cat extends Animal{
    constructor(name: string){
        super(name);
    }
    move(distanceInMeters = 5){
        console.log("Meow...");
        super.move(distanceInMeters);
    }
} 

class Horse extends Animal{
    constructor(name: string) {
        super(name);
    }
    move(distanceInMeters = 100){
        console.log("Galloping...");
        super.move(distanceInMeters);
    }
}
let sam = new Cat("Sam");
sam.move();
let tom = new Horse("Tom");
tom.move();
//---------------------------------------------------------------
console.log("-------------------------------------------");

//INTERFACES
class Employee4 implements IEmployee{
    empCode: number;
    name: string;

    constructor(code:number, name: string) {
        this.empCode = code;
        this.name = name;
    }
    getSalary(empCode:number): number {
        return 20000;
    }
}

let emp = new Employee4(5,"Jason");
console.log(emp.getSalary(20000));





