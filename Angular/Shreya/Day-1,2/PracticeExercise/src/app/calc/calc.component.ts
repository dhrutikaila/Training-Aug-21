import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-calc',
  templateUrl: './calc.component.html',
  styleUrls: ['./calc.component.css']
})
export class CalcComponent implements OnInit {

  constructor() { }
    num1 : number = 0;
    num2 : number = 0 ;
    res : number = 0 ;
    Addition(){
     this.res= this.num1 + this.num2;
    }
    Multiplication(){
      this.res= this.num1 * this.num2;
     }
     Subtraction(){
      this.res= this.num1 - this.num2;
     }
     Division(){
      this.res= this.num1 / this.num2;
     }
  ngOnInit(): void {
  }

}
