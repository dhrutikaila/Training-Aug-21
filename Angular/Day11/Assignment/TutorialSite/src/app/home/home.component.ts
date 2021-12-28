import { Component, OnInit } from '@angular/core';
import { LoginService } from '../login.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
  message: string;
  constructor(private loginService: LoginService) {
    this.message = '';
  }
  login(username: string, password: string): boolean {
    this.message = '';
    if (!this.loginService.login(username, password)) {
      this.message = 'Incorrect credentials.';
      setTimeout(function () {
        this.message = '';
      }.bind(this), 2500);
    }
    return false;
  }
  logout(): boolean {
    this.loginService.logout();
    return false;
  }
  ngOnInit(): void {
  }

}
