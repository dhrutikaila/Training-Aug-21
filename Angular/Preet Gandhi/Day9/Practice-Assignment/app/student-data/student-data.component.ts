import { Component, Inject, OnInit } from '@angular/core';
import { iStudent } from '../admission-form/IStudent';
import { StudentService } from '../student.service';

@Component({
  selector: 'app-student-data',
  templateUrl: './student-data.component.html',
  styleUrls: ['./student-data.component.css']
})
export class StudentDataComponent implements OnInit {

  constructor( private studentService: StudentService) { }

  ngOnInit(): void {
  }

  studentData: iStudent[] = this.studentService.getStudents();


  editStudent(i:number){
    this.studentService.editStudent(i, this.studentData[i]);
  }

  deleteStudent(i: number){
    this.studentService.deleteStudent(i);
  }

}
