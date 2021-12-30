import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-practice1-component',
  templateUrl: './practice1-component.component.html',
  styleUrls: ['./practice1-component.component.css'],
})
export class Practice1ComponentComponent implements OnInit {




  data = 'students';
  test: boolean = false;
  student = 'mihir';
  students = ['viraj', 'siraj'];





  calculate: string = 'add';

  status: boolean = false;
  input: string = '';
  flag: string = '';
  MouseHover: string = '';

  createServer() {
    this.test = true;
    this.students.push(this.student);
    this.data =  this.student;
  }

  closeServer() {
    this.test = false;
  }

  start() {
    if (this.input == 'y') {
      this.status = true;
    } else {
      this.status = false;
    }
  }

  constructor() {
    this.flag = Math.random() > 0.5 ? 'on' : 'off';
  }

  colorFun() {
    return this.flag === 'on' ? 'green' : 'red';
  }

  mouseenter() {
    this.MouseHover = 'mouse hovered';
  }

  mouseleave() {
    this.MouseHover = 'mouse left';
  }
  ngOnInit(): void {}

  
}
