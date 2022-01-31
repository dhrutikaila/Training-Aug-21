import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-cute-kitty',
  templateUrl: './cute-kitty.component.html',
  styleUrls: ['./cute-kitty.component.css']
})
export class CuteKittyComponent implements OnInit {
  isCatCute:boolean = false;
  constructor() { }

  ngOnInit(): void {
  }

  setCuteCat(){
    if(this.isCatCute) {
      this.isCatCute = false;
    }
    else {
      this.isCatCute = true;
    }
  }

}
