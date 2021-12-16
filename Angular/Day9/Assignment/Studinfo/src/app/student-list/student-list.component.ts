import { Component, Inject, OnInit } from '@angular/core';
import { StudentService } from '../student.service';
import { IStudent } from '../student/student.component';
@Component({
  selector: 'app-student-list',
  templateUrl: './student-list.component.html',
  styleUrls: ['./student-list.component.css']
})
export class StudentListComponent implements OnInit {



  constructor(@Inject(StudentService) private studentService: StudentService) { }

  ngOnInit(): void {
  }
  studentList: IStudent[] = this.studentService.getStudents()

  editStudent(index: number) {
    this.studentService.editStudent(index, this.studentList[index])
  }

  deleteStudent(index: number) {
    this.studentService.deleteStudent(index)
  }
}
