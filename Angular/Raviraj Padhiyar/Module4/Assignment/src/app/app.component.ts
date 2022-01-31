import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  students : any[] = [];
  title = 'assignment-project';

  addStudent(student: any){
    this.students.push(student.value);
    console.log(student);
  }
}
