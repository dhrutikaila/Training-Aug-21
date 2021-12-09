import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
@Component({
  selector: 'app-hello-world',
  templateUrl: './hello-world.component.html',
  styleUrls: ['./hello-world.component.css']
})
export class HelloWorldComponent implements OnInit {
name='';
updateName(){
  this.name="Dhruti Patel";
}
val:string='';
  constructor() { }

  ngOnInit(): void {
  }

}
