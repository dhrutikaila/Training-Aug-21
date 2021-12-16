import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class LoggerService {

  constructor() { }
  log(method: string) {
    console.log(`${method} called!`);
  }
}
