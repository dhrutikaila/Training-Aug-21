import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-cricle',
  templateUrl: './cricle.component.html',
  styleUrls: ['./cricle.component.css']
})
export class CricleComponent implements OnInit{
  radius:number = 0;
  area:number = 0;
  constructor() { }

  ngOnInit(): void {

  }

  calculateArea() : void {
    this.area = this.radius * this.radius * 3.14; 
  }

}
