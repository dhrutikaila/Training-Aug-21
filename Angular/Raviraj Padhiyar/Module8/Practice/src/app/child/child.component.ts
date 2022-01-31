import { Component, Input, OnInit, Output, EventEmitter } from '@angular/core';
import { employee } from '../parent/parent.component';


@Component({
  selector: 'app-child',
  templateUrl: './child.component.html',
  styleUrls: ['./child.component.css'],
})
export class ChildComponent implements OnInit {

  @Input() employee!:employee;
  @Output() removeEmployeeEvent = new EventEmitter<string>();
  constructor() {}

  ngOnInit(): void {}

  removeEmployee(empName:string) {
    this.removeEmployeeEvent.emit(empName);
  }
}
