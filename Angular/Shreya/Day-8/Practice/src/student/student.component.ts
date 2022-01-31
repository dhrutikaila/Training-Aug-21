import { Component, OnInit ,Input , Output,EventEmitter} from '@angular/core';

@Component({
  selector: 'app-student',
  templateUrl: './student.component.html',
  styleUrls: ['./student.component.css']
})
export class StudentComponent implements OnInit {
@Input() myinputMsg?:string;
@Output() myOutput : EventEmitter<any>= new EventEmitter();  
@Output() userdata =new  EventEmitter();
list:Array<any>=[]
  outputMessage:string="I am child component."  
  constructor() { }

  ngOnInit(): void {
    console.log(this.myinputMsg)
  }
  sendValues(){  
    this.myOutput.emit(this.outputMessage);  
 } 
 addlist(userName:HTMLInputElement)
 {
      this.list.push(userName.value);
      this.userdata.emit(this.list);
 }
 

}
