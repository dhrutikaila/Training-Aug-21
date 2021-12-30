import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-calc-component',
  templateUrl: './calc-component.component.html',
  styleUrls: ['./calc-component.component.css']
})
export class CalcComponentComponent implements OnInit {

n1:number=0;
n2:number=0;


  constructor() { }

  ngOnInit(): void {
  }

}
