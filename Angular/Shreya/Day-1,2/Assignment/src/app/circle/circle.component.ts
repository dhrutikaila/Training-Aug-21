import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-circle',
  templateUrl: './circle.component.html',
  styleUrls: ['./circle.component.css']
})
export class CircleComponent implements OnInit {
  radius : number = 0;
  res : number =0;
  AreaOfCircle(){
    this.res = 3.14 * this.radius * this.radius;
  }
  constructor() { }

  ngOnInit(): void {
  }

}
