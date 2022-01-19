
//This service sends signup, login HTTP POST requests to back-end.

import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

const AUTH_API = 'https://localhost:44305/api/Authentication/register';

const httpOptions = {
  headers: new HttpHeaders({ 'Content-type': 'appliction/json' })
};
@Injectable({
  providedIn: 'root'
})
export class AuthService {

  constructor(private http: HttpClient) { }

  login(Username: string, Password: string): Observable<any> {
    return this.http.post(AUTH_API, {
      Username,
      Password
    }, httpOptions);
  }

  register(Username: string, Email: string, Password: string): Observable<any> {
    return this.http.post(AUTH_API, {
      Username,
      Email,
      Password
    }, httpOptions);
  }
}
