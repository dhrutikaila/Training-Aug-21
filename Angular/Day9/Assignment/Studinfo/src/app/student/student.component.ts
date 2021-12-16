import { Component, Inject, OnInit } from '@angular/core';
import { FormBuilder, FormArray, Validators } from '@angular/forms';
import { StudentService } from '../student.service';



export interface IStudent {
  firstName: string
  middleName: string
  lastName: string
  birthDate: Date

  firstLanguage: string

}

@Component({
  selector: 'app-student',
  templateUrl: './student.component.html',
  styleUrls: ['./student.component.css']
})
export class StudentComponent implements OnInit {


  student: IStudent = {} as IStudent

  constructor(private fb: FormBuilder, @Inject(StudentService) private studentService: StudentService) { }

  ngOnInit(): void {
  }

  applicationForm = this.fb.group({
    firstName: ['', [Validators.required, Validators.minLength(3), Validators.pattern('[a-zA-Z]*')]],
    middleName: ['', [Validators.required, Validators.minLength(3), Validators.pattern('[a-zA-Z]*')]],
    lastName: ['', [Validators.required, Validators.minLength(3), Validators.pattern('[a-zA-Z]*')]],
    birthDate: ['', Validators.required],

    firstLanguage: ['', Validators.required],




  })




  get emergencyContacts() {
    return this.applicationForm.get('emergencyContacts') as FormArray
  }

  get firstName() {
    return this.applicationForm.get('firstName')
  }
  get middleName() {
    return this.applicationForm.get('middleName')
  }
  get lastName() {
    return this.applicationForm.get('lastName')
  }
  get birthDate() {
    return this.applicationForm.get('birthDate')
  }

  get firstLanguage() {
    return this.applicationForm.get('firstLanguage')
  }



  onSubmit() {
    this.student = this.applicationForm.value
    this.studentService.addStudent(this.student)
  }

}
