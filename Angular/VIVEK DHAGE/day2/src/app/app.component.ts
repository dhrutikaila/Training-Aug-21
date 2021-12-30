import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class HelloWorldComponent {

status:boolean=false;
data='';
result='';

constructor(){
  setTimeout(()=>{
    this.status=true;
  },2000)
}


eventFun(){
  this.data="clicked";
}
  

fun2(event:Event){
this.result=(<HTMLInputElement>event.target).value;
}
}
