import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';

import { HelloWorldComponent } from './app.component';
import { RectangleComponentComponent } from './rectangle-component/rectangle-component.component';
import { LoginComponentComponent } from './login-component/login-component.component';
import { CircleComponentComponent } from './circle-component/circle-component.component';
import { LeftBarComponentComponent } from './left-bar-component/left-bar-component.component';
import { SignUpComponentComponent } from './sign-up-component/sign-up-component.component';
import { HelloWorldComponentComponent } from './hello-world-component/hello-world-component.component';
import { CalcComponentComponent } from './calc-component/calc-component.component';
import { NgPracticeComponentComponent } from './ng-practice-component/ng-practice-component.component';

@NgModule({
  declarations: [
    HelloWorldComponent,
    RectangleComponentComponent,
    LoginComponentComponent,
    CircleComponentComponent,
    LeftBarComponentComponent,
    SignUpComponentComponent,
    HelloWorldComponentComponent,
    CalcComponentComponent,
    NgPracticeComponentComponent
  ],
  imports: [
    BrowserModule,
    FormsModule
  ],
  providers: [],
  bootstrap: [HelloWorldComponent]
})
export class AppModule { }
