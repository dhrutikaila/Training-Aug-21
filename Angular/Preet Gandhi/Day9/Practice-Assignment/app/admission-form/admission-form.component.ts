import { Component, Inject, OnInit } from '@angular/core';
import {FormArray, FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { StudentService } from '../student.service';
import { iStudent } from './IStudent';

@Component({
  selector: 'app-admission-form',
  templateUrl: './admission-form.component.html',
  styleUrls: ['./admission-form.component.css']
})
export class AdmissionFormComponent implements OnInit {

  constructor(private fb: FormBuilder, private studentService: StudentService) { }

  

  ngOnInit(): void {
  }

  admissionForm = this.fb.group({
    FirstName:['',Validators.required],
    MiddleName:['',Validators.required],
    LastName:['',Validators.required],
    Dob: [null,Validators.required],
    PlaceOfBirth: ['',Validators.required],
    FirstLanguage: [''],
    Address: this.fb.group({
      City: ['',Validators.minLength(3)],
      State: ['',Validators.minLength(3)],
      Country:['',Validators.minLength(3)],
      Pin: ['',Validators.pattern("^[1-9][0-9]{5}$")]
    }),
    Father: this.fb.group({
      FatherFirstName: ['',Validators.required],
      FatherMiddleName: [''],
      FatherLastName: ['',Validators.required],
      FatherEmail: ['',[Validators.required,Validators.email]],
      FatherEducationQualification: [''],
      FatherProfession: [''],
      FatherDesignation: [''],
      FatherPhone: ['',Validators.required]
    }),
    Mother: this.fb.group({
      MotherFirstName: ['',Validators.required],
      MotherMiddleName: [''],
      MotherLastName: ['',Validators.required],
      MotherEmail: ['',[Validators.required,Validators.email]],
      MotherEducationQualification: [''],
      MotherProfession: [''],
      MotherDesignation: [''],
      MotherPhone: ['',Validators.required]
    }),
    EmergancyContactList: 
    this.fb.array(
      [this.fb.control('')]
    )
  });

get FirstName(){
  return this.admissionForm.get('FirstName');
}

get MiddleName(){
  return this.admissionForm.get('MiddleName');
}

get LastName(){
  return this.admissionForm.get('LastName');
}

get Dob(){
  return this.admissionForm.get('Dob');
}

get PlaceOfBirth(){
  return this.admissionForm.get('PlaceOfBirth');
}

get City(){
  return this.admissionForm.get('Address')?.get('City');
}

get State(){
  return this.admissionForm.get('Address')?.get('State');
}

get Country(){
  return this.admissionForm.get('Address')?.get('Country');
}

get Pin(){
  return this.admissionForm.get('Address')?.get('Pin');
}

get FatherFirstName(){
  return this.admissionForm.get('Father')?.get('FatherFirstName');
}

get FatherLastName(){
  return this.admissionForm.get('Father')?.get('FatherLastName');
}

get FatherEmail(){
  return this.admissionForm.get('Father')?.get('FatherEmail');
}

get FatherPhone(){
  return this.admissionForm.get('Father')?.get('FatherPhone');
}

get MotherFirstName(){
  return this.admissionForm.get('Mother')?.get('MotherFirstName');
}

get MotherLastName(){
  return this.admissionForm.get('Mother')?.get('MotherLastName');
}

get MotherEmail(){
  return this.admissionForm.get('Mother')?.get('MotherEmail');
}

get MotherPhone(){
  return this.admissionForm.get('Mother')?.get('MotherPhone');
}

  get EmergancyContactList(){
    return this.admissionForm.get("EmergancyContactList") as FormArray;
  }

  addEmergencyContactList(){
    this.EmergancyContactList.push(this.fb.control(''));
  }

  // studentData: iStudent[] = [];
  child:any = {};
  
  onSubmit(){
    // console.warn(this.admissionForm.value);
    // this.studentData.push(this.admissionForm.value);
    // console.log(this.studentData);
    this.child = this.admissionForm.value;
    this.studentService.addStudent(this.child);
  }

}
