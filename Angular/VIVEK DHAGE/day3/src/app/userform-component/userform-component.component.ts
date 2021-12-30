import { Component, OnInit } from '@angular/core';
import { NgForm, FormGroup,FormControl } from '@angular/forms';



@Component({
  selector: 'app-userform-component',
  templateUrl: './userform-component.component.html',
  styleUrls: ['./userform-component.component.css']
})
export class UserformComponentComponent implements OnInit {

  mForm!: FormGroup;
  constructor() { }

  ngOnInit() {
    this.mForm=new FormGroup({
      fullname: new FormControl(),
      email:new FormControl()
    })
  }

  onsubmit():void{
    console.log(this.mForm.value);
  }

  profileForm = new FormGroup({
    firstName: new FormControl(''),
    lastName: new FormControl(''),
  });

  onSubmit() {
    console.warn(this.profileForm.value);
  }

}
