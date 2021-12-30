import { Component, EventEmitter, OnInit, Output } from '@angular/core';

@Component({
  selector: 'app-student',
  templateUrl: './student.component.html',
  styleUrls: ['./student.component.css']
})
export class StudentComponent implements OnInit {
  name : string = '';
  grade : number = 0;

  @Output() newStudent = new EventEmitter<{name:string,grade:number}>();

  constructor() { }

  ngOnInit(): void {
  }

  addNewStudent(name : string,grade : number) {
    this.newStudent.emit({name:name,grade:grade});
  }

  

}
