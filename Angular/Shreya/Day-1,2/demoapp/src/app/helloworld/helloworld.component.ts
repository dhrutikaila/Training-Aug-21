import { Component, OnInit } from '@angular/core';
    
@Component({
 // selector: 'app-helloworld',
 //create attribute of that selector
 //selector :'[app-helloworld]',
 selector :'.app-helloworld',
 templateUrl :'./helloworld.component.html',
 //inline template
  // template: `<app-server></app-server>
  //             <app-server></app-server>`,
 styleUrls: ['./helloworld.component.css']
 
})
export class HelloworldComponent implements OnInit {

  allowNewServer = false ;
  serverCreationStatus = "No server was created";
  serverName = 'test';
  username : string = '';
  password : string = '';
  res : string = '';
  serverCreated : boolean = false;
  constructor() {
    setTimeout(() => {
      this.allowNewServer = true;
    }, 2000);
    
   }
   onUpdateServerName(event : any){
      this.serverName = (<HTMLInputElement>event.target).value;
   }
   onCreateServer(){
     this.serverCreated = true;
     this.serverCreationStatus = 'Server was created '+'name is '+ this.serverName ; 
   }
  
   login(){
    if(this.username && this.password == 'admin'){
        this.res ='Valid user';
    }
    else{
      this.res ='Invalid';
    }
   }

  ngOnInit(): void {
  }

}


