import { Component, OnInit } from '@angular/core';

import { EnrollmentService } from '../enrollment-service.service';
import { FormArray, FormBuilder, FormGroup, Validators } from '@angular/forms'

import { Router } from '@angular/router';

@Component({
  selector: 'app-add-student',
  templateUrl: './add-student.component.html',
  styleUrls: ['./add-student.component.css']
})
export class AddStudentComponent implements OnInit {
  countryList: any
  stateList: any
  cityList: any
  isStateInvalid: boolean = true
  isCountryInvalid: boolean = true

  constructor(private apiService: EnrollmentService, private fb: FormBuilder, private router: Router) { }

  ngOnInit(): void {
    this.apiService.getCountry().subscribe(data => {
      this.countryList = data
    })
  }

  setStates(event: any) {
    if (event.target.value) {
      this.apiService.getCountryWiseState(event.target.value).subscribe(data => {
        this.stateList = data
      })
      this.isCountryInvalid = false
    }
    else {
      this.isCountryInvalid = true
      this.stateList = []
      this.cityList = []
    }
  }

  setCity(event: any) {
    if (event.target.value) {
      this.apiService.getStateWiseCity(event.target.value).subscribe(data => {
        this.cityList = data
      })
      this.isStateInvalid = false
    }
    else {
      this.isStateInvalid = true
      this.cityList = []
    }
  }

  selectCity(event: any) {
    if (event.target.value != NaN) {
      this.applicationForm.controls['cityId'].setValue(parseInt(event.target.value))
    }
  }


  applicationForm = this.fb.group({
    firstName: ['', [Validators.required, Validators.minLength(3), Validators.pattern('[a-zA-Z]*')]],
    middleName: ['', [Validators.required, Validators.minLength(3), Validators.pattern('[a-zA-Z]*')]],
    lastName: ['', [Validators.required, Validators.minLength(3), Validators.pattern('[a-zA-Z]*')]],
    birthDate: ['', Validators.required],
    birthPlace: ['', [Validators.required, Validators.minLength(3), Validators.pattern('[a-zA-Z ]*')]],
    firstLanguage: ['', Validators.required],
    phone: ['', [Validators.required, Validators.pattern('[1-9][0-9]{9,9}')]],
    addressline1: [''],
    addressline2: [''],
    pinCode: ['', [Validators.required, Validators.pattern('[0-9]{6,6}')]],
    cityId: ['', [Validators.required, Validators.pattern('[0-9]{1,}')]],
    fatherFirstName: ['', [Validators.required, Validators.minLength(3), Validators.pattern('[a-zA-Z]*')]],
    fatherMiddleName: ['', [Validators.required, Validators.minLength(3), Validators.pattern('[a-zA-Z]*')]],
    fatherLastName: ['', [Validators.required, Validators.minLength(3), Validators.pattern('[a-zA-Z]*')]],
    fatherEmail: ['', [Validators.required, Validators.email]],
    fatherEducationQualification: ['', Validators.required],
    fatherProfession: ['', Validators.required],
    fatherDesignation: [''],
    fatherPhone: ['', [Validators.required, Validators.pattern('[1-9][0-9]{9,9}')]],
    motherFirstName: ['', [Validators.required, Validators.minLength(3), Validators.pattern('[a-zA-Z]*')]],
    motherMiddleName: ['', [Validators.required, Validators.minLength(3), Validators.pattern('[a-zA-Z]*')]],
    motherLastName: ['', [Validators.required, Validators.minLength(3), Validators.pattern('[a-zA-Z]*')]],
    motherEmail: ['', [Validators.required, Validators.email]],
    motherEducationQualification: ['', Validators.required],
    motherProfession: ['', Validators.required],
    motherDesignation: [''],
    motherPhone: ['', [Validators.required, Validators.pattern('[1-9][0-9]{9,9}')]],
    emergencyContact: this.fb.array([
      this.createEmergencyContactForm()
    ]),
    reference: this.fb.array([
      this.createReferenceForm()
    ]),
  })

  createEmergencyContactForm(): FormGroup {
    return this.fb.group({
      relation: ['', Validators.required],
      phone: ['', [Validators.required, Validators.pattern('[1-9][0-9]{9,9}')]]
    })
  }

  createReferenceForm(): FormGroup {
    return this.fb.group({
      referenceDetails: ['', Validators.required],
      referenceThrough: ['', Validators.required]
    })
  }

  get emergencyContact() {
    return this.applicationForm.get('emergencyContact') as FormArray
  }

  addEmergencyContact() {
    this.emergencyContact.push(this.createEmergencyContactForm())
  }

  removeEmergencyContact() {
    if (this.emergencyContact.length > 1) {
      this.emergencyContact.removeAt(this.emergencyContact.length - 1)
    }
  }

  get reference() {
    return this.applicationForm.get('reference') as FormArray
  }

  addReference() {
    this.reference.push(this.createReferenceForm())
  }

  removeReference() {
    if (this.reference.length > 1) {
      this.reference.removeAt(this.reference.length - 1)
    }
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
  get birthPlace() {
    return this.applicationForm.get('birthPlace')
  }
  get firstLanguage() {
    return this.applicationForm.get('firstLanguage')
  }
  get city() {
    return this.applicationForm.get('cityId')
  }
  // get state() {
  //   return this.applicationForm.get('state')
  // }
  // get country() {
  //   return this.applicationForm.get('country')
  // }
  get pin() {
    return this.applicationForm.get('pinCode')
  }
  get fatherFirstName() {
    return this.applicationForm.get('fatherFirstName')
  }
  get fatherMiddleName() {
    return this.applicationForm.get('fatherMiddleName')
  }
  get fatherLastName() {
    return this.applicationForm.get('fatherLastName')
  }
  get fatherEmail() {
    return this.applicationForm.get('fatherEmail')
  }
  get fatherEduQua() {
    return this.applicationForm.get('fatherEducationQualification')
  }
  get fatherProfession() {
    return this.applicationForm.get('fatherProfession')
  }
  get fatherPhone() {
    return this.applicationForm.get('fatherPhone')
  }
  get motherFirstName() {
    return this.applicationForm.get('motherFirstName')
  }
  get motherMiddleName() {
    return this.applicationForm.get('motherMiddleName')
  }
  get motherLastName() {
    return this.applicationForm.get('motherLastName')
  }
  get motherEmail() {
    return this.applicationForm.get('motherEmail')
  }
  get motherEduQua() {
    return this.applicationForm.get('motherEducationQualification')
  }
  get motherProfession() {
    return this.applicationForm.get('motherProfession')
  }
  get motherPhone() {
    return this.applicationForm.get('motherPhone')
  }
  get studentPhone() {
    return this.applicationForm.get('phone')
  }

  onSubmit() {
    this.apiService.addStudent(this.applicationForm.value).subscribe(data => {
      console.log(data)
    })
    this.router.navigate(['get'])
  }

}
