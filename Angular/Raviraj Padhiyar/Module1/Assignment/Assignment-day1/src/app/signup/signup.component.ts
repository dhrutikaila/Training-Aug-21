import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-signup',
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.css'],
})
export class SignupComponent implements OnInit {
  static prevKey = 0;
  name:string = '';
  phoneNumber:string = ''
  address:string = '';

  static users : Array<{name:string,phoneNumber:string,address:string}> = [];
  constructor() { }

  ngOnInit(): void {
  }

  /**
   * processDate
   */
  public processData() {
    SignupComponent.prevKey++;
    SignupComponent.users.push({name : this.name, phoneNumber : this.phoneNumber,address : this.address});
  }

  get users() {
    return SignupComponent.users;
  }

}
