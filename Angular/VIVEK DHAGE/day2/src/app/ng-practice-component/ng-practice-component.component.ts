import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-ng-practice-component',
  templateUrl: './ng-practice-component.component.html',
  styleUrls: ['./ng-practice-component.component.css'],
})
export class NgPracticeComponentComponent implements OnInit {
  
  status: boolean = false;
  input: string = '';

  flag:string='';


// checkArray(){
//   var emp = [
//   {id:1,name:"ajay"},
//   {id:2,name:"vijay"},
//   {id:3,name:"sanjay"}
//   ]
// }



  start() {
    if (this.input == 'y') {
      this.status = true;
    } else {
      this.status = false;
    }
  }


  constructor() {
this.flag = Math.random() > 0.5 ? 'on':'off';
}

  WorkingStatus(){
    return this.flag === 'on' ? 'green':'red';
  }



  mouseenter(){
    this.flag = "mouse enter";
  }

  ngOnInit(): void {}

 


}
