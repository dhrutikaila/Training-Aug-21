import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-rectangle',
  templateUrl: './rectangle.component.html',
  styleUrls: ['./rectangle.component.css']
})
export class RectangleComponent implements OnInit {


  length: number = 0;
  width: number = 0;
  answer: any;

  rectangleArea(){
    this.answer = this.length * this.width;
  }
  constructor() { }

  ngOnInit(): void {
  }

}
