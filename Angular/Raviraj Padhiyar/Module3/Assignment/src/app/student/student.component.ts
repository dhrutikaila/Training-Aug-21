import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-student',
  templateUrl: './student.component.html',
  styleUrls: ['./student.component.css'],
})
export class StudentComponent implements OnInit {
  static prevId: number = 0;
  Id: number = 0;
  name: string = '';
  age: number = 0;
  average: number = 0;
  grade: string = '';
  active: boolean = false;

  static students: Array<{
    Id: number;
    name: string;
    age: number;
    average: number;
    grade: string;
    active: boolean;
  }> = [];

  constructor() {}

  ngOnInit(): void {}

  savechange() {
    StudentComponent.students.push({
      Id : this.Id,
      name : this.name,
      age : this.age,
      average : this.average,
      grade : this.grade,
      active : this.active,
    });
  }

  changeStatus() {
    this.active = true;
  }
}
