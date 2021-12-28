
import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, FormArray, Validators } from '@angular/forms';

type Parent = {
  firstName: string
  middleName: string
  lastName: string
  email: string
  educationQualification: string
  profession: string
  designation: string
  phone: number
}

type Address = {
  city: string
  state: string
  country: string
  pin: number
}

type AddressWithTel = {
  houseno: number
  addressline1: string
  addressline2: string
  phone: number
}

type EmergencyContact = {
  relation: string
  phone: number
}

interface IStudent {
  firstName: string
  middleName: string
  lastName: string
  birthDate: Date
  birthPlace: string
  firstLanguage: string
  address: Address
  father: Parent
  mother: Parent
  emergencyContacts: EmergencyContact[]
  referenceDetails: string[]
  referenceThrough: string
  addressWithTel: AddressWithTel
}

@Component({
  selector: 'app-admission-form',
  templateUrl: './student-admission.component.html',
  styleUrls: ['./student-admission.component.css']
})

export class studentadmissonComponent implements OnInit {

  studentList: IStudent[] = []
  constructor(private fb: FormBuilder) { }

  ngOnInit(): void {
  }

  applicationForm = this.fb.group({
    firstName: ['', [Validators.required, Validators.minLength(3), Validators.pattern('[a-zA-Z]*')]],
    middleName: ['', [Validators.required, Validators.minLength(3), Validators.pattern('[a-zA-Z]*')]],
    lastName: ['', [Validators.required, Validators.minLength(3), Validators.pattern('[a-zA-Z]*')]],
    birthDate: ['', Validators.required],
    birthPlace: ['', [Validators.required, Validators.minLength(3), Validators.pattern('[a-zA-Z ]*')]],
    firstLanguage: ['', Validators.required],
    address: this.fb.group({
      city: ['', [Validators.required, Validators.pattern('[a-zA-Z ]*')]],
      state: ['', [Validators.required, Validators.pattern('[a-zA-Z ]*')]],
      country: ['', [Validators.required, Validators.pattern('[a-zA-Z ]*')]],
      pin: ['', [Validators.required, Validators.pattern('[0-9]{6,6}')]]
    }),
    father: this.createParentForm(),
    mother: this.createParentForm(),
    emergencyContacts: this.fb.array([
      this.createEmergencyContactForm()
    ]),
    referenceDetails: this.fb.array([
      this.fb.control('')
    ]),
    referenceThrough: [''],
    addressWithTel: this.fb.group({
      houseno: [''],
      addressline1: [''],
      addressline2: [''],
      phone: ['', [Validators.required, Validators.pattern('[1-9][0-9]{9,9}')]]
    })
  })

  createParentForm(): FormGroup {
    return this.fb.group({
      firstName: ['', [Validators.required, Validators.minLength(3), Validators.pattern('[a-zA-Z]*')]],
      middleName: ['', [Validators.required, Validators.minLength(3), Validators.pattern('[a-zA-Z]*')]],
      lastName: ['', [Validators.required, Validators.minLength(3), Validators.pattern('[a-zA-Z]*')]],
      email: ['', [Validators.required, Validators.email]],
      educationQualification: ['', Validators.required],
      profession: ['', Validators.required],
      designation: [''],
      phone: ['', [Validators.required, Validators.pattern('[1-9][0-9]{9,9}')]]
    })
  }

  createEmergencyContactForm(): FormGroup {
    return this.fb.group({
      relation: ['', Validators.required],
      phone: ['', [Validators.required, Validators.pattern('[1-9][0-9]{9,9}')]]
    })
  }
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
  get birthPlace() {
    return this.applicationForm.get('birthPlace')
  }
  get firstLanguage() {
    return this.applicationForm.get('firstLanguage')
  }
  get city() {
    return this.applicationForm.get('address.city')
  }
  get state() {
    return this.applicationForm.get('address.state')
  }
  get country() {
    return this.applicationForm.get('address.country')
  }
  get pin() {
    return this.applicationForm.get('address.pin')
  }
  get fatherFirstName() {
    return this.applicationForm.get('father.firstName')
  }
  get fatherMiddleName() {
    return this.applicationForm.get('father.middleName')
  }
  get fatherLastName() {
    return this.applicationForm.get('father.lastName')
  }
  get fatherEmail() {
    return this.applicationForm.get('father.email')
  }
  get fatherEduQua() {
    return this.applicationForm.get('father.educationQualification')
  }
  get fatherProfession() {
    return this.applicationForm.get('father.profession')
  }
  get fatherPhone() {
    return this.applicationForm.get('father.phone')
  }
  get motherFirstName() {
    return this.applicationForm.get('mother.firstName')
  }
  get motherMiddleName() {
    return this.applicationForm.get('mother.middleName')
  }
  get motherLastName() {
    return this.applicationForm.get('mother.lastName')
  }
  get motherEmail() {
    return this.applicationForm.get('mother.email')
  }
  get motherEduQua() {
    return this.applicationForm.get('mother.educationQualification')
  }
  get motherProfession() {
    return this.applicationForm.get('mother.profession')
  }
  get motherPhone() {
    return this.applicationForm.get('mother.phone')
  }
  get studentPhone() {
    return this.applicationForm.get('addressWithTel.phone')
  }


  addEmergencyContact() {
    this.emergencyContacts.push(this.createEmergencyContactForm())
  }

  removeEmergencyContact() {
    if (this.emergencyContacts.length > 1) {
      this.emergencyContacts.removeAt(this.emergencyContacts.length - 1)
    }
  }

  addReferenceDetail() {
    this.referenceDetails.push(this.fb.control(''))
  }

  removereferenceDetail() {
    if (this.referenceDetails.length > 1) {
      this.referenceDetails.removeAt(this.referenceDetails.length - 1)
    }
  }

  get referenceDetails() {
    return this.applicationForm.get('referenceDetails') as FormArray
  }

  onSubmit() {
    this.studentList.push(this.applicationForm.value)
    // console.log(this.applicationForm.value)
  }
}