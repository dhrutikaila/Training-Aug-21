import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-rectangle',
  templateUrl: './rectangle.component.html',
  styleUrls: ['./rectangle.component.css']
})
export class RectangleComponent  {
  public num1:number;
  public num2:number;
  public num3:number;
  
  rect(){
    this.num3=this.num1*this.num2;
  }
}
