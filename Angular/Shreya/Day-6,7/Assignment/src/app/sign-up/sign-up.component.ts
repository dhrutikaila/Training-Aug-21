import { Component, OnInit,ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
@Component({
  selector: 'app-sign-up',
  templateUrl: './sign-up.component.html',
  styleUrls: ['./sign-up.component.css']
})
export class SignUpComponent implements OnInit {
  gender = ['male', 'female']
  constructor() { }
  submitted = false;
  @ViewChild('f') signUpForm?: NgForm;
  suggest()
    {
    const fname = 'John';
    const lname ='roy';
    this.signUpForm?.form.patchValue({
      userName: {
        firstname: fname,
        lastname : lname
      },
    })
  }
  student ={
    fname :'',
    lname :'',
    phoneno :'',
    email :'',
    gender:'',
    address:''
  }
  ngOnInit(): void {
  }
  onSubmit(){
    this.submitted=true;
    this.student.fname=this.signUpForm?.value.userName.firstname;
    this.student.lname=this.signUpForm?.value.userName.lastname;
    this.student.phoneno=this.signUpForm?.value.phonenumber;
    this.student.email=this.signUpForm?.value.email;
    this.student.gender=this.signUpForm?.value.gender;
    this.student.address=this.signUpForm?.value.address;
  
  } 
   
}
