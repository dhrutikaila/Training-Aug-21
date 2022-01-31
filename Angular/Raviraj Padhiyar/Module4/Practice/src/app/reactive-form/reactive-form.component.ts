import { Component, OnInit } from '@angular/core';
import { FormArray, FormControl, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-reactive-form',
  templateUrl: './reactive-form.component.html',
  styleUrls: ['./reactive-form.component.css'],
})
export class ReactiveFormComponent implements OnInit {
  genders = ['Male', 'Female'];
  signupForm: FormGroup= new FormGroup({
    username: new FormControl(null, [
      Validators.required,
      this.forbiddenNames.bind(this),
    ]),
    email: new FormControl(null, [Validators.required, Validators.email]),
    gender: new FormControl('Male'),
    hobbies: new FormArray([]),
  });
  forbiddenUsername = ['admin', 'ravi'];

  constructor() {
  }

  ngOnInit(): void {}
  onSubmit() {
    console.log(this.signupForm);
  }

  onAddHobby() {
    const control = new FormControl(null, Validators.required);
    (<FormArray>this.signupForm.get('hobbies')).push(control);
  }

  getControls() {
    return (this.signupForm.get('hobbies') as FormArray).controls;
  }

  forbiddenNames(control: FormControl): { [s: string]: boolean } | null {
    if (this.forbiddenUsername.indexOf(control.value) !== -1) {
      return { nameIsForbidden: true };
    }
    return null;
  }
}
