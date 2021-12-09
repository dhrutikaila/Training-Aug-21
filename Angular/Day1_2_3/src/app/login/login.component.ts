import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent  {
username:string='';
password:string='';
res:string;
  login(){
    if (this.username && this.password =='admin') {
      this.res='Valid Users';
      
    } else {
      this.res='Invalid Users ';
      
    }
  }

}
