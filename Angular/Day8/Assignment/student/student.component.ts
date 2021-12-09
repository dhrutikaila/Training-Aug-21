import { Component, OnInit } from '@angular/core';
import { Input,Output,EventEmitter } from '@angular/core';
@Component({
  selector: 'app-student',
  templateUrl: './student.component.html',
  styleUrls: ['./student.component.css']
})
export class StudentComponent implements OnInit {
@Input()
all:number;

@Input()
male:number;

@Input()
female: number;

 // This variable holds the selected value of the radio button
 selectedRadioButtonValue: string = 'All';
 @Output()
 countRadioButtonSelectionChanged: EventEmitter<string> =
     new EventEmitter<string>();
 // This method raises the custom event. We will bind this
 // method to the change event of all the 3 radio buttons
 onRadioButtonSelectionChange() {
     this.countRadioButtonSelectionChanged
         .emit(this.selectedRadioButtonValue);
 }
  constructor() { }

  ngOnInit(): void {
  }

}
