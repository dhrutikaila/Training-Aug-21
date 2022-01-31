import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class EmployeeService {

  constructor() { }

  getEmployees(){
    return [
      {"id":1, "name":"Hiren Panchal", "age":25},
      {"id":2, "name":"Jai Shah", "age":25},
      {"id":3, "name":"Jeet Patel", "age":25},
      {"id":4, "name":"Meet Parekh", "age":25},
      {"id":5, "name":"Het Modi", "age":25},
    ];
  }
}
