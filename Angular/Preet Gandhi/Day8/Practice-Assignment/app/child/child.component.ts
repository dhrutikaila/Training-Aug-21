import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';


@Component({
  selector: 'app-child',
  templateUrl: './child.component.html',
  styleUrls: ['./child.component.css']
})
export class ChildComponent implements OnInit {

  //Parent to child
  @Input() count: number = 0;

  @Input() item: string = '';


  constructor() { }

  ngOnInit(): void {
  }

}
