import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-login-component',
  templateUrl: './login-component.component.html',
  styleUrls: ['./login-component.component.css']
})
export class LoginComponentComponent implements OnInit {


  Name:string="";
  Pass:string="";
  valid:string="";

  
  validation(){
    if(this.Name == "" || this.Pass == "")
    {
      this.valid="vaid";
      alert(" name and password should not be empty");
      this.Name="";
      this.Pass="";
    }
    else if(this.Name == "admin" && this.Pass == "admin"){
      alert(" valid name and password..!");
      this.Name="";
      this.Pass="";
    }
    else{
      this.valid="invalid";
      alert("name or password in invalid");
      this.Name="";
      this.Pass="";
    }
  }
  constructor() { }

  ngOnInit(): void {
  }
}

