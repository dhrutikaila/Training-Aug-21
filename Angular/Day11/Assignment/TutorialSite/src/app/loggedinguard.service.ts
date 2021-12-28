import { Injectable } from '@angular/core';
import { LoginService } from './login.service';
import { CanActivate } from '@angular/router';
@Injectable({
  providedIn: 'root'
})
export class LoggedinguardService {

  constructor(private loginService: LoginService) { }

  canActivate(): boolean {
    return this.loginService.isLoggedIn();
  }
}
