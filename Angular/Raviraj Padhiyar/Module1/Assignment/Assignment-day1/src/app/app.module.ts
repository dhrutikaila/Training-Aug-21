import { NgModule } from '@angular/core';
import { FormsModule, NgModel } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { RectangleComponent } from './rectangle/rectangle.component';
import { LoginComponentComponent } from './login-component/login-component.component';
import { CricleComponent } from './cricle/cricle.component';
import { LeftBarComponent } from './left-bar/left-bar.component';
import { SignupComponent } from './signup/signup.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';

@NgModule({
  declarations: [
    AppComponent,
    RectangleComponent,
    LoginComponentComponent,
    CricleComponent,
    LeftBarComponent,
    SignupComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    NgbModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
