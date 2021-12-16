import { Inject, Injectable } from '@angular/core';
import { IStudent } from './student/student.component'
import { LoggerService } from './logger.service'

@Injectable({
  providedIn: 'root'
})
export class StudentService {

  constructor(@Inject(LoggerService) private logger: LoggerService) { }
  studentList: IStudent[] = []

  addStudent(student: IStudent): void {
    this.studentList.push(student)
    this.logger.log("addStudent")
  }

  getStudents(): IStudent[] {
    this.logger.log("getStudent")
    return this.studentList
  }

  editStudent(index: number, student: IStudent): void {
    this.studentList[index] = student
    this.logger.log("editStudent")
  }

  deleteStudent(index: number): void {
    this.studentList.splice(index, 1)
    this.logger.log("deleteStudent")
  }
}
