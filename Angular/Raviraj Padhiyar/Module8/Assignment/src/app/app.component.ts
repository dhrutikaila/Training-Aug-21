import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
})
export class AppComponent {
  title = 'assignment-project';

  students: Array<student> = [];

  AddStudent(newStudnet: student) {
    this.students.push(newStudnet);
  }
}

export class student {
  name: string = '';
  grade: number = 0;

  // constructor(name: string, grade: number) {
  //   this.name = name;
  //   this.grade = grade;
  // }
}
