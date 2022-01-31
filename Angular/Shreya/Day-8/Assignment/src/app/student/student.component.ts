import { Component, OnInit, Output, EventEmitter } from '@angular/core';
import { FormBuilder } from '@angular/forms';


@Component({
  selector: 'app-student',
  templateUrl: './student.component.html',
  styleUrls: ['./student.component.css']
})
export class StudentComponent implements OnInit {
  @Output() studentData = new EventEmitter();
  constructor(private fb: FormBuilder) { }
  student = this.fb.group({
    enrollnumber: [''],
    name: [''],
    email: [''],
    dob: ['']
  })
  studentdata : Array<any> = [];
  ngOnInit(): void {
  }
  onSubmit() {
    this.studentdata.push(this.student.value)
   this.studentData.emit(this.studentdata)
  }
}
