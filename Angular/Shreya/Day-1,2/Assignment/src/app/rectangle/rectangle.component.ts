import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-rectangle',
  templateUrl: './rectangle.component.html',
  styleUrls: ['./rectangle.component.css']
})
export class RectangleComponent implements OnInit {
  length : number = 0;
  width : number = 0;
  res : number = 0;
  constructor() { }
    AreaOfRectangle(){
        this.res = this.length * this.width;
    }
  ngOnInit(): void {
  }

}
