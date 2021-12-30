import { Component, OnInit } from '@angular/core';

@Component({
  selector: '.app-circle-component',
  templateUrl: './circle-component.component.html',
  styleUrls: ['./circle-component.component.css']
})
export class CircleComponentComponent implements OnInit {

  r:number=0;
  pie:number=3.14159;

  constructor() { }

  ngOnInit(): void {
  }

}
