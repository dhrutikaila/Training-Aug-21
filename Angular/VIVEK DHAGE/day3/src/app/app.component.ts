import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  
  
  title = 'Second-app';
  Course = 'aeroplane';

  Data:string='';
  
  ParentMethod(data:string){
  this.Data=data;   
  }
}

