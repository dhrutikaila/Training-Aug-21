import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  username : string = '';
  password : string = '';
  res : string = '';
  constructor() { }
  login(){
    if(this.username =='admin' && this.password == 'admin'){
        this.res ='Valid user';
    }
    else{
      this.res ='Invalid';
    }
   }
  ngOnInit(): void {
  }

}
