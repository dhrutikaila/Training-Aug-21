import { Component, OnInit } from '@angular/core';
import {  FormBuilder } from '@angular/forms';
import { FormArray } from '@angular/forms';
import { Validators } from '@angular/forms';
interface Istudent{
  id:number;
  firstName:string;
  middelName:string;
  lastName:string;
  DOB:Date;
  PlaceofBirth:String;
  FirstLanguage:String;
address:{Country:string,city:string,state:string,zip:number};
fatherName:{ firstName:string,middelName:string,lastName:string,email:string,EducationQualification:string,Profession:string,Designation:string,Phone:number};
MotherName:{ firstName:string,middelName:string,lastName:string,email:string,EducationQualification:string,Profession:string,Designation:string,Phone:number};
EmergencyContactList1:{Relation:string;Number:number;};
}
@Component({
  selector: 'app-student-admission',
  templateUrl: './student-admission.component.html',
  styleUrls: ['./student-admission.component.css']
})

export class StudentAdmissionComponent  {
  profileForm = this.fb.group({
   
      firstName: ['',Validators.required],
      middelName: [''],
      lastName: [''],
    
    DOB:[''],
    PlaceofBirth: [''],
    FirstLanguage : [''],

    address: this.fb.group({
      Country: [''],
      city: [''],
      state: [''],
      zip: ['']
    }),
    
    fatherName:this.fb.group({
      firstName: [''],
      middelName: [''],
      lastName:[''],
      email:['',Validators.email],
      EducationQualification:[''],
      Profession :[''],
      Designation: [''],
      Phone: ['',Validators.maxLength(10)],
    }),
    MotherName:this.fb.group({
      firstName: [''],
      middelName: [''],
      lastName:[''],
      email:['',Validators.email],
      EducationQualification:[''],
      Profession :[''],
      Designation: [''],
      Phone: ['',Validators.maxLength(10)],
    }),
    EmergencyContactList1:this.fb.array([
      this.fb.group({
        Relation:[''],
        Number:['',Validators.required]
      })
    ])    
    
  });
  constructor(private fb: FormBuilder) { }
  
  get EmergencyContactList1() {
    return this.profileForm.get('EmergencyContactList1') as FormArray;
  }
  addAlias() {
    this.EmergencyContactList1.push(this.fb.group({
         Relation:[''],
         Number:['']
    }))
  }

  students:Array<Istudent>=[];
 
  onSubmit(){
      console.log(this.profileForm);
  this.students.push(this.profileForm.value)
  }
  
  get firstName(){
    return this.profileForm.get('firstName');
  }
 
}
