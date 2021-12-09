import { Component, OnInit } from '@angular/core';
interface student{
  id:number;
  name:string;
  age:number;
  avrage:number;
  grade:string;
  isActive:boolean;
}

@Component({
  selector: 'app-student-list',
  templateUrl: './student-list.component.html',
  styleUrls: ['./student-list.component.css']
})
export class StudentListComponent {
name='angular';
students:student[]=[
  {id:1,name:"dhruti",age:17,avrage:40,grade:"A+",isActive:true},
  {id:2,name:"khusi",age:18,avrage:70,grade:"B+",isActive:true},
  {id:3,name:"avni",age:19,avrage:60,grade:"C",isActive:true},
  {id:4,name:"meet",age:19,avrage:30,grade:"D",isActive:false},
]

}
