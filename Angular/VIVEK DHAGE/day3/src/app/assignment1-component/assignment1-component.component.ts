import { outputAst } from '@angular/compiler';
import { Component, OnInit,Input, Output,EventEmitter} from '@angular/core';
import { never } from 'rxjs';


@Component({
  selector: 'app-assignment1-component',
  templateUrl: './assignment1-component.component.html',
  styleUrls: ['./assignment1-component.component.css']
})


// interface Itypes {
//   ID:number;
//   Name:string;
//   Age:number;
//   Average:number;
//   grade:string;
//   Active:boolean;
// }


export class Assignment1ComponentComponent implements OnInit {
 
@Input() course='';

@Output() 
notify:EventEmitter<any> = new EventEmitter<any>();


Passdata(){
  this.notify.emit("hello parent ,msg from child component");
}


  constructor() { }

  ngOnInit(): void {
  }



    StudentList:{  ID:number;
    Name:string;
    Age:number;
    Average:number;
    grade:string;
    Active:boolean;}[] = [
    { ID: 0, Name: 'varoon', Age:19, Average:5,grade:"a",Active:true },
    { ID: 1, Name: 'aroon', Age:18, Average:4,grade:"b",Active:true },
    { ID: 2, Name: 'charan', Age:20, Average:3,grade:"c",Active:true },
    { ID: 3, Name: 'aman', Age:17, Average:2,grade:"a",Active:false },
    { ID: 4, Name: 'raman', Age:17, Average:4,grade:"c",Active:true },
    { ID: 5, Name: 'sunil', Age:19, Average:3,grade:"a",Active:true },
];
}



//  Create a student Model interface with field( ID,Name,Age,Average,grade,Active )
// StudentList Component will create an array of student type.Display an array with
//  NGFor in table. Grade wise color should be given using ngSwitch and ngClass or ngStyle.
//   Only active should displayed using ngIf.
