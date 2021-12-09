import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-circle',
  templateUrl: './circle.component.html',
  styleUrls: ['./circle.component.css']
})
export class CircleComponent {
public  Radius: number;  
   result:number=0;
   
  AreaOfCircle() {  
 this.result= 3.14 * this.Radius * this.Radius;  
  } 


}
