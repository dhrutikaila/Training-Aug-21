import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-login-component',
  templateUrl: './login-component.component.html',
  styleUrls: ['./login-component.component.css'],
})
export class LoginComponentComponent implements OnInit {
  username: string = '';
  password: string = '';

  response:string = '';
  constructor() {}

  ngOnInit(): void {}

  validate() {
    if(this.username == "admin" && this.password == "admin"){
      this.response = "Success";
    }
    else this.response = "Failed";
  }
}
