import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-practice2-component',
  templateUrl: './practice2-component.component.html',
  styleUrls: ['./practice2-component.component.css']
})
export class Practice2ComponentComponent implements OnInit {


  key:boolean=false
  log:Array<Date> =[]
  dt = new Date()

  person = 'Sohan';

OnClick(){
  this.key=true
  this.log.push(this.dt);
}


  constructor() { 
  
  }

  ngOnInit(): void {
  }
  nominees: {name:string,age:number}[] = [
    {name: 'Alex',age: 20},
    {name: 'gagan',age: 22},
    {name: 'hiren',age: 23},
    {name: 'aman',age: 24} 
  ]

}
