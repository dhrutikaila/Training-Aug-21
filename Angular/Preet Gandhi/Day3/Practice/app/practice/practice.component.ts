import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-practice',
  templateUrl: './practice.component.html',
  styleUrls: ['./practice.component.css']
})
export class PracticeComponent implements OnInit {

  //Practice ngStyle
  show_ngStyle(){
  return{ 'font-size.px':40,
           'font-style': 'bold',
           'color': 'orange',
           'background-color': 'blue'
        }
}

//Practice ngClass
show_ngClass(){
  return{
    'btn':true,
    'btn-danger':true,
    'btn-lg': true
  }
}

//Practice ngModel
title: string = '';

//Practice ngIf
choice: boolean = true;
prac_ngIf(){
  if(this.choice == true){
    this.choice = false;
  }
  else{
    this.choice = true;
  }
}

//Practice ngFor
item = [
  {Id: 1, Name: "Colgate", Price: 100},
  {Id: 2, Name: "Close UP", Price: 90},
  {Id: 3, Name: "Dabar Red", Price: 110}
];

//Practice ngSwitch
num: number = 0;

  constructor() { }

  ngOnInit(): void {
  }

}
