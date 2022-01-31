import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  constructor() { }

  login(user: string, password: string): boolean{
    if(user == "admin" && password == "admin"){
      localStorage.setItem('username',user);
      alert("You have successfully LoggedIn");
      return true;
      
    }
    return false;
  }

  logout(): any{
    localStorage.removeItem('username');
    alert("LogOut Successfull")
  }

  getUser(): any{
    return localStorage.getItem('username');
  }

  isLoggedIn(): boolean {
    return this.getUser() !== null;
  }
}

export var AUTH_PROVIDERS: Array<any> = [
  {provide: AuthService, useClass: AuthService},
];
