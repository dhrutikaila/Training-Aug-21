//importing the employee class in ts2 file
import {Employee} from "./ts1"
let obj = new Employee("shreya",1);
obj.displayEmployee();

import * as emp from "./ts1" // for whole module 
console.log(emp.age)