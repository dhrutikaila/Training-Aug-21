import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-calc',
  templateUrl: './calc.component.html',
  styleUrls: ['./calc.component.css']
})

export class CalcComponent implements OnInit {

  number1:number = 0;
  number2:number = 0;
  ans:number = 0;
  constructor() { }

  ngOnInit(): void {
    
  }

  public addition() {
    this.ans = this.number1 + this.number2;
  }

  /**
   * subtraction
   */
  public subtraction() {
    this.ans = this.number1 - this.number2;
  }

  /**
   * multiplication
   */
  public multiplication() {
    this.ans = this.number1 * this.number2;
  }

  /**
   * division
   */
  public division() {
    if(this.number2 == 0) {
      throw new Error("cant divide by 0");
    }
    else {
      this.ans = this.number1 / this.number2;
    }
  }

  /**
   * clear
   */
  public clear() {
    this.number1 = 0;
    this.number2 = 0;
    this.ans = 0;
  }


}
