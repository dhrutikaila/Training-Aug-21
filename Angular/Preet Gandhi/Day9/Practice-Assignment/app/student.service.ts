import { Inject, Injectable } from '@angular/core';
import { LoggerService } from './logger.service';
import { iStudent } from './admission-form/IStudent';

@Injectable({
  providedIn: 'root'
})
export class StudentService {

  constructor( private logg: LoggerService) { }
  studentData: iStudent[] = [];

  getStudents(): iStudent[]{
    this.logg.log("Getting children");
    return this.studentData;
    
  }

  addStudent(child: iStudent):void {
    this.studentData.push(child);
    this.logg.log("Adding child");
  }

  editStudent(i: number, child: iStudent):void{
    this.studentData[i] = child;
    this.logg.log("Edit child");
  }

  deleteStudent(i: number):void{
    this.studentData.splice(i,1);
    this.logg.log("Delete child");
  }
}
