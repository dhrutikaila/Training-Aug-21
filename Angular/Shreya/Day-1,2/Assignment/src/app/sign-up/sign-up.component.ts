import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-sign-up',
  templateUrl: './sign-up.component.html',
  styleUrls: ['./sign-up.component.css']
})
export class SignUpComponent implements OnInit {
  Username: string='';
  Address : string = '';
  panNumber : string = '';
  result : string = '';
  constructor() { }
  signup(){
    this.result = 'Username is ' + this.Username +' Address is '+ this.Address+'Pancard number is '+ this.panNumber
  }
  ngOnInit(): void {
  }

}
