import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  title = 'practice-example';
  isHeader:boolean = true;

  isCatCute:boolean = true;

  ngOnInit() : void {
    this.setCurrentStyles();
  }

  currentStyles: Record<string, string> = {};

  setCurrentStyles() {
    // CSS styles: set per current state of component properties
    this.currentStyles = {
      'font-style':  this.isHeader      ? 'italic' : 'normal',
      'font-weight': this.isHeader ? 'bold'   : 'normal',
      'font-size':   this.isHeader    ? '64px'   : '12px'
    };
  }

  setIsHeader(){
    if(this.isHeader) {
      this.isHeader = false;
    } 
    else 
      this.isHeader = true

    this.setCurrentStyles();
  }

  
  

  
}
