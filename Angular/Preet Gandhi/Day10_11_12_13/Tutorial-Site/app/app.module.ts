import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HtmlComponent } from './html/html.component';
import { AngularComponent } from './angular/angular.component';
import { HomeComponent } from './home/home.component';
import { Practice1Day3Component } from './practice1-day3/practice1-day3.component';
import { Practice2Day3Component } from './practice2-day3/practice2-day3.component';
import { Practice3Day3Component } from './practice3-day3/practice3-day3.component';
import { Practice4Day3Component } from './practice4-day3/practice4-day3.component';
import { Practice5Day3Component } from './practice5-day3/practice5-day3.component';
import { Assignment1Day3Component } from './assignment1-day3/assignment1-day3.component';
import { Assignment1Day4Component } from './assignment1-day4/assignment1-day4.component';
import { Practice1Day4Component } from './practice1-day4/practice1-day4.component';
import { Practice2Day4Component } from './practice2-day4/practice2-day4.component';
import { Practice3Day4Component } from './practice3-day4/practice3-day4.component';
import { Practice4Day4Component } from './practice4-day4/practice4-day4.component';
import { Practice5Day4Component } from './practice5-day4/practice5-day4.component';
import { HtmlHomeComponent } from './html-home/html-home.component';
import { LoginComponent } from './login/login.component';


@NgModule({
  declarations: [
    AppComponent,
    HtmlComponent,
    AngularComponent,
    HomeComponent,
    Practice1Day3Component,
    Practice2Day3Component,
    Practice3Day3Component,
    Practice4Day3Component,
    Practice5Day3Component,
    Assignment1Day3Component,
    Assignment1Day4Component,
    Practice1Day4Component,
    Practice2Day4Component,
    Practice3Day4Component,
    Practice4Day4Component,
    Practice5Day4Component,
    HtmlHomeComponent,
    LoginComponent,

  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
