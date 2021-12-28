import { Component, OnInit } from '@angular/core';
import { EnrollmentService } from '../enrollment-service.service';
import { FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
@Component({
  selector: 'app-edit-student',
  templateUrl: './edit-student.component.html',
  styleUrls: ['./edit-student.component.css']
})
export class EditStudentComponent implements OnInit {

  countryList: any
  stateList: any
  cityList: any
  isStateInvalid: boolean = true
  isCountryInvalid: boolean = true
  studentId: number = 0

  constructor(private apiService: EnrollmentService, private fb: FormBuilder, private route: ActivatedRoute, private router: Router) { }

  ngOnInit(): void {
    this.apiService.getCountry().subscribe(data => {
      this.countryList = data
    })

    this.route.params.subscribe(params => {
      this.studentId = params['id']
    })

    this.apiService.getStudent(this.studentId).subscribe(data => {
      this.applicationForm.setValue(data)
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
    studentId: [],
    cityName: [],
    isDeleted: [],
    emergencyContact: [],
    reference: []
  })

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
    this.apiService.updateStudent(this.applicationForm.value).subscribe(data => {
      console.log(data)
    })
    this.router.navigate(['get'])
  }


}
