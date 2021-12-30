import { Component, Input, OnInit } from '@angular/core';
import { student } from '../app.component';


@Component({
  selector: 'app-student-list',
  templateUrl: './student-list.component.html',
  styleUrls: ['./student-list.component.css']
})
export class StudentListComponent implements OnInit {
  @Input () students : Array<student> = [];
  constructor() { }

  ngOnInit(): void {
  }



}
