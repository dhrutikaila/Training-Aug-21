import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-calc',
  templateUrl: './calc.component.html',
  styleUrls: ['./calc.component.css']
})
export class CalcComponent implements OnInit {

  value1: number = 0;
  value2: number = 0;
  answer: number = 0;

  constructor() { }

  addition(){
    this.answer = this.value1 + this.value2;
  }

  subtraction(){
    this.answer = this.value1 - this.value2;
  }

  multiplication(){
    this.answer = this.value1 * this.value2;
  }

  division(){
    this.answer = this.value1 / this.value2;
  }

  

  ngOnInit(): void {
  }

}
