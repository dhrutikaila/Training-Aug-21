import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  usernameInput: string = '';
  passwordInput: any = '';
  answer: string = '';

  login(){
    if(this.usernameInput  == "admin" && this.passwordInput == "admin"){
      this.answer = "You are valid user";
    }
    else{
      this.answer = "Invalid user";
    }
  }

  constructor() { }

  ngOnInit(): void {
  }

}
