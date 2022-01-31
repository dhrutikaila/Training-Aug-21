import { Component } from '@angular/core';
import { FormArray, FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { Istudent } from './student';
@Component({
  selector: 'app-student',
  templateUrl: './student.component.html',
  styleUrls: ['./student.component.css']
})
export class StudentComponent {

  signUp = this.fb.group({
    firstName: ['', Validators.required],
    middleName: ['' , Validators.required],
    lastName: ['',Validators.required],
    dob: ['',Validators.required],
    placeOfBirth: ['',Validators.required],
    firstLanguage: ['',Validators.required],
    address: this.fb.group({
      city: ['',Validators.required],
      state: ['',Validators.required],
      country: ['',Validators.required],
      pinCode: ['',Validators.required]
    }),
    FatherDetails: this.fb.group({
      firstName: ['',Validators.required],
      middleName: ['',Validators.required],
      lastName: ['',Validators.required],
      email: ['',Validators.email],
      Qualification: ['',Validators.required],
      profession: ['',Validators.required],
      designation: [''],
      phoneNumber: ['',Validators.required,Validators.maxLength(10)]
    }),
    MotherDetails: this.fb.group({
      firstName: ['',Validators.required],
      middleName: ['',Validators.required],
      lastName: ['',Validators.required],
      email: ['',Validators.email],
      Qualification: ['',Validators.required],
      profession: ['',Validators.required],
      designation: [''],
      phoneNumber: ['',Validators.required,Validators.maxLength(10)]
    }),
    emergencyContact: this.fb.array([
      this.fb.group({
        relation: ['', Validators.required],
        phonenumber: ['', Validators.required,Validators.maxLength(10)]
      })
    ])
    
  });
  
  get emergencyContact() {
    
    return this.signUp.get('emergencyContact')  as FormArray 
  }
  addContact(){
    this.emergencyContact.push(this.fb.group({
      relation : [''],
      phonenumber:['']
    }))
  }
  studentData : Array<Istudent> = [];
  constructor(private fb: FormBuilder) { }
  onSubmit() {
    this.studentData.push(this.signUp.value)
    console.log(this.signUp.value)
  }
  get firstName(){
    return this.signUp.get('firstName');
  }
  get middleName(){
    return this.signUp.get('middleName');
  }
  get lastName(){
    return this.signUp.get('lastName');
  }
  get dob(){
    return this.signUp.get('dob');
  }
  get placeOfBirth(){
    return this.signUp.get('placeOfBirth');
  }
  get firstLanguage(){
    return this.signUp.get('firstLanguage');
  }
  get address(){
    return this.signUp.get('address')
  }
  get FatherDetails(){
    return this.signUp.get('FatherDetails')
  }
  get MotherDetails(){
    return this.signUp.get('MotherDetails');
  }

// get f(){
//   return this.signUp.controls;  
// }
  
  
}
