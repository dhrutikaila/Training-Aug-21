import { Component,OnInit } from '@angular/core';

@Component({
  selector: 'app-hello-world-component',
  templateUrl: './hello-world-component.component.html',
  styleUrls: ['./hello-world-component.component.css']
})
export class HelloWorldComponentComponent implements OnInit {
  name = '';
  msg = '';
 
  n1:number=0;
  n2:number=0;

   constructor() { }

  ngOnInit(): void {
  }
}



// import { Component, OnInit } from '@angular/core';

// @Component({
//   selector: 'app-hello-world-component',
//   templateUrl: './hello-world-component.component.html',
//   styleUrls: ['./hello-world-component.component.css']
// })
// export class HelloWorldComponentComponent implements OnInit {

//   constructor() { }

//   ngOnInit(): void {
//   }

// }
