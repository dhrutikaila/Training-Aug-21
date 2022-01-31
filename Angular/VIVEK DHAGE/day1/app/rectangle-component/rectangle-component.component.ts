import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-rectangle-component',
  templateUrl: './rectangle-component.component.html',
  styleUrls: ['./rectangle-component.component.css']
})
export class RectangleComponentComponent  {


  a:number=0;
  b:number=0;
  constructor() { }

  ngOnInit(): void {
  }
}


// import { Component } from '@angular/core';

// @Component({
//   selector: 'app-root',
//   templateUrl: './app.HelloWorldComponent.html',
//   styleUrls: ['./app.component.css']
// })
// export class HelloWorldComponent {
//   name = '';
//   msg = 'helloworld';
//   n1='';
//   n2='';
// }

