import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { FormArray, FormBuilder, Validators } from '@angular/forms';

@Component({
  selector: 'app-student-form',
  templateUrl: './student-form.component.html',
  styleUrls: ['./student-form.component.css'],
})
export class StudentFormComponent implements OnInit {

  @Output() addnewStudent = new EventEmitter();

  studentAdmissionForm = this.fb.group({
    name: this.fb.group({
      firstName: ['', Validators.required],
      middleName: [''],
      lastName: ['',Validators.required],
    }),
    Birth: this.fb.group({
      DOB: [''],
      placeOfBirth: ['',Validators.required],
    }),
    firstLanguage: ['',Validators.required],
    address: this.fb.group({
      city: ['',Validators.required],
      state: ['',Validators.required],
      country: ['',Validators.required],
      PIN: ['',[Validators.required,Validators.minLength(6),Validators.maxLength(6)]],
    }),
    Father: this.fb.group({
      name: this.fb.group({
        firstName: ['', Validators.required],
        middleName: [''],
        lastName: ['',Validators.required],
      }),
      email: ['', [Validators.email,Validators.required]],
      EducationQualification: [''],
      Profession: [''],
      Designation: [''],
      Phone: ['', Validators.required],
    }),
    Mother: this.fb.group({
      name: this.fb.group({
        firstName: ['', Validators.required],
        middleName: [''],
        lastName: ['',Validators.required],
      }),
      email: ['', Validators.email],
      EducationQualification: [''],
      Profession: [''],
      Designation: [''],
      Phone: ['', Validators.required],
    }),
    EmergencyContactList: this.fb.group({
      relation: ['',Validators.required],
      number: ['',Validators.required],
      refernceDetail: [''],
      refernceThrough: [''],
      address: [''],
    }),
  });

  constructor(private fb: FormBuilder) {}

  ngOnInit(): void {}
  onsubmit() {
    this.addnewStudent.emit(this.studentAdmissionForm);
  }

  // addEmergencyContact() {
  //   (<FormArray>this.studentAdmissionForm.get('EmergencyContactList')).push(
  //     this.fb.group({
  //       Relation: [''],
  //       number: [''],
  //       refrenceDetail: [''],
  //       ReferenceThrough: [''],
  //       address: [''],
  //     })
  //   );
  // }

  // getContorls() {
  //   return (<FormArray>this.studentAdmissionForm.get('EmergencyContactList'))
  //     .controls;
  // }
}
