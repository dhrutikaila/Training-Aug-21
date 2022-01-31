import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-parent',
  templateUrl: './parent.component.html',
  styleUrls: ['./parent.component.css'],
})
export class ParentComponent implements OnInit {
  managers: Array<manager>;
  employees:Array<employee>;
  constructor() {
    this.employees = employees;

    this.managers = [
      new manager("Mohil Parmar","IT", this.employees.filter(emp => emp.department == "IT")),
      new manager("Nimral Kumar","Admin", this.employees.filter(emp => emp.department == "Admin")),
      new manager("Tushar Singh","HR", this.employees.filter(emp => emp.department == "HR"))
    ]
  }

  ngOnInit(): void {}

  rmEmp(empName: string) {
    console.log("remove " + empName);
  }
}



class manager {
  name:string;
  department:string;

  employees:Array<employee>;

  constructor(name:string,department:string,employees:Array<employee>) {
    this.name = name;
    this.department = department;

    this.employees = employees;
  }
}

export class employee {
  name: string;
  department: string;

  constructor(name: string, department: string) {
    this.name = name;
    this.department = department;
  }

  
}

var employees = [
  new employee("Ravi Kishan","IT"),
  new employee("Santanu Thakur","Admin"),
  new employee("Abhi Vyas","Admin"),
  new employee("Rutwik Bhatt","IT"),
  new employee("Harshil Bhatt","HR"),
  new employee("Anuj Patel","HR")
];
