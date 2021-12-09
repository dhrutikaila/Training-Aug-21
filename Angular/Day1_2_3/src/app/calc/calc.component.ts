import { Component } from '@angular/core';

@Component({
  selector: 'app-calc',
  templateUrl: './calc.component.html',
  styleUrls: ['./calc.component.css']
})

export class CalcComponent  {
  public num1:number;
  public num2:number;
  public num3:number;
  
  add(){
    this.num3=this.num1+this.num2;
  }
  sub(){
    this.num3=this.num1-this.num2;
  }
  mul(){
    this.num3=this.num1*this.num2;
  }

}



