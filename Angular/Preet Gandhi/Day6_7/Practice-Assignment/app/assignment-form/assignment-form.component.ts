import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-assignment-form',
  templateUrl: './assignment-form.component.html',
  styleUrls: ['./assignment-form.component.css']
})
export class AssignmentFormComponent implements OnInit {

  onSubmit(admissionForm: { value: any; }) {
    console.log(admissionForm.value);
    this.studentData.push(admissionForm.value);
  }

  studentData: (any)[] = [];

  constructor() { }

  ngOnInit(): void {
  }

}
