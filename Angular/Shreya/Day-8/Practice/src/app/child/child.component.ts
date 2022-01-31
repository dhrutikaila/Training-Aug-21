import { outputAst } from '@angular/compiler';
import { Component, OnInit, Output, EventEmitter, Input } from '@angular/core';

@Component({
  selector: 'app-child',
  templateUrl: './child.component.html',
  styleUrls: ['./child.component.css']
})
export class ChildComponent implements OnInit {

  constructor() { }
  //childData : string = 'Data from child ';
  @Input() parentData?: string;
  @Output() userdata = new EventEmitter();
  list: Array<any> = []

  //@Output public sendData = new EventEmitter<string>();
  ngOnInit(): void {
  }
  addList(userName: HTMLInputElement) {
    this.list.push(userName.value);
    //console.log(userName.value)
    this.userdata.emit(this.list);
  }

}
