import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-rectangle',
  templateUrl: './rectangle.component.html',
  styleUrls: ['./rectangle.component.css'],
})
export class RectangleComponent implements OnInit {
  length:number = 0;
  width:number = 0;

  area:number = 0;

  constructor() {}

  ngOnInit(): void {}

  calculateArea() : void {
    this.area = this.length * this.width;
  }
}
