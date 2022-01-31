import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  //Parent to child
  title = 'PracticeExercise';

  
  Counter = 5;

  increment(){
    this.Counter++;
  }
  decrement(){
    this.Counter--;
  }

  currentItem: string = "Television";

  //Child to Parent
  items = ['item1', 'item2', 'item3'];

  addItem(newItem: string){
    this.items.push(newItem);
  }

  //Assignment - Child to parent
  childData: Array<any> = [];

  eventHandler(event: any[]){
    this.childData = event;
  }

}
