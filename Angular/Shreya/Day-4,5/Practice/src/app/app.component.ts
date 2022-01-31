import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, FormsModule, Validators } from '@angular/forms';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent  {
 genders = ['male' , 'female']
 
  signupForm = new FormGroup({
         'username' :new FormControl(null , Validators.required),
         'email' : new FormControl(null , [Validators.required , Validators.email]) 
   });
 
 onSubmit(){
   console.log(this.signupForm.value.email);
 }
}
