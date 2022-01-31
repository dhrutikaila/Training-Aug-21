import { Component, OnInit } from '@angular/core';
import {FormArray, FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-practice-form',
  templateUrl: './practice-form.component.html',
  styleUrls: ['./practice-form.component.css']
})
export class PracticeFormComponent implements OnInit {

  //FormGroup and FormControl
  profileForm = this.fb.group({
    firstName:['',Validators.required],
    lastName: ['',Validators.required],
    address: this.fb.group({
      street: [''],
      city: [''],
      state: [''],
      zip: ['',[Validators.required,Validators.minLength(6)]]
    }),
    aliases: this.fb.array([this.fb.control('')])
  });

  //getter for aliases array
  get aliases(){
    return this.profileForm.get('aliases') as FormArray;
  }

  //adding more aliases
  addAlias(){
    this.aliases.push(this.fb.control(''));
  }

  //onsubmit event
  onSubmit(){
    console.warn(this.profileForm.value);
  }

  //for patch value
  updateProfile() {
    this.profileForm.patchValue({
      firstName: 'Hiren',
      address: {
        street: 'Happy Street'
      },
      aliases: ['Hello','World'],
    });
  }

  //FormBuilder in constructor
  constructor(private fb: FormBuilder) { }

  ngOnInit(): void {
  }

}
