import { Component, OnInit } from '@angular/core';
import {StudentComponent } from '../student/student.component';

@Component({
  selector: 'app-student-table',
  templateUrl: './student-table.component.html',
  styleUrls: ['./student-table.component.css']
})
export class StudentTableComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
  }

  get students() {
    return StudentComponent.students;
  }

}
