import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';

@Component({
  selector: 'app-tdform',
  templateUrl: './tdform.component.html',
  styleUrls: ['./tdform.component.css']
})
export class TDFormComponent {
  @ViewChild('f') signUpForm?: NgForm;

  constructor() {

  }
  submitted = false;
  suggest() {
    const name = 'shreya';
    //    this.signUpForm?.setValue({
    //      userData:{
    //        username:name,
    //        email : ''
    //      },
    //      secret : 'pet',
    //      questionAnswer:'',
    //      gender:'male'
    //    })
    this.signUpForm?.form.patchValue({
      userData: {
        username: name,

      },
    })
  }
  defaultQuestion = 'pet';
  answer = '';
  gender = ['male', 'female']
  user = {
    username: '',
    email: '',
    secretQuestion: '',
    answer: '',
    gender: ''
  };
  ngOnInit(): void {
  }
  // onSubmit(form : NgForm){
  //   console.log(form.value)
  // }
  onSubmit() {
    this.submitted= true
    this.user.username = this.signUpForm?.value.userData.username;
    this.user.email = this.signUpForm?.value.userData.email;
    this.user.secretQuestion = this.signUpForm?.value.secret;
    this.user.answer = this.signUpForm?.value.questionAnswer;
    this.user.gender = this.signUpForm?.value.gender;
    this.signUpForm?.resetForm();
  }
}

