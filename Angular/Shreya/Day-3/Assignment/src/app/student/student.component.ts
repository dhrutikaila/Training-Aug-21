import { Component, OnInit } from '@angular/core';
import {IStudent} from './student'
@Component({
  selector: 'app-student',
  templateUrl: './student.component.html',
  styleUrls: ['./student.component.css']
})
export class StudentComponent implements OnInit {
  constructor() { }
StudentList :Array<IStudent> = 
              [{StudentId : 1 , StudentName :'Shreya',StudentAge:22,StudentAverage:455,StudentGrade:'A',StudentStatus:true},
              {StudentId : 2 , StudentName :'Diya',StudentAge:21,StudentAverage:445,StudentGrade:'B',StudentStatus:false},
              {StudentId : 3 , StudentName :'Dharal',StudentAge:22,StudentAverage:465,StudentGrade:'A+',StudentStatus:true},
              {StudentId : 4 , StudentName :'Reema',StudentAge:21,StudentAverage:200,StudentGrade:'F',StudentStatus:true},
              {StudentId : 5 , StudentName :'Raman',StudentAge:19,StudentAverage:110,StudentGrade:'F',StudentStatus:true},
              {StudentId : 6 , StudentName :'Pratik',StudentAge:20,StudentAverage:454,StudentGrade:'A+',StudentStatus:true}
            ];
 
  ngOnInit(): void {
  }

}
