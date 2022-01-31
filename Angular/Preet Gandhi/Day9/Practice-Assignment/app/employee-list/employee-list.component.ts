import { Component, OnInit } from '@angular/core';
import { EmployeeService } from '../employee.service';

@Component({
  selector: 'app-employee-list',
  templateUrl: './employee-list.component.html',
  styleUrls: ['./employee-list.component.css']
})
export class EmployeeListComponent implements OnInit {

  id:any;
  name: string = '';
  age: any;

  public employees: any;

  constructor(private _employeeService: EmployeeService) { }

  ngOnInit(): void{
    this.employees = this._employeeService.getEmployees();
    
  }

  addEmployee(id:number, name: string, age: number){
    this.employees.push({id,name,age})
  }

}
