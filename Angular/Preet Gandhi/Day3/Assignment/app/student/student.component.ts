import { Component, OnInit } from '@angular/core';
import { IStudent } from './student';

@Component({
  selector: 'app-student',
  templateUrl: './student.component.html',
  styleUrls: ['./student.component.css']
})

 
export class StudentComponent implements OnInit {
  
StudentList : Array<IStudent> = 
[{"Id":1, "Name": "Hiren Panchal", "Age": 15, "Average": 75, "Grade":"A-", "Active": true},
 {"Id":2, "Name": "Jai Shah", "Age": 16, "Average": 80, "Grade":"A", "Active": true},
 {"Id":3, "Name": "Meet Parikh", "Age": 14, "Average": 70, "Grade":"B+", "Active": true},
 {"Id":4, "Name": "Jeet Patel", "Age": 17, "Average": 90, "Grade":"A+", "Active": true},
 {"Id":5, "Name": "Hitesh Parekh", "Age": 12, "Average": 95, "Grade":"A++", "Active": true},
] 
  constructor() { }

  ngOnInit(): void {
  }

}
