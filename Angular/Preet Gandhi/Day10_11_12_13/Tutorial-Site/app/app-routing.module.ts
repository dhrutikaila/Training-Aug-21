import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { HomeComponent } from './home/home.component';
import { AngularComponent } from './angular/angular.component';
import { HtmlComponent } from './html/html.component';

import { Practice1Day3Component } from './practice1-day3/practice1-day3.component';
import { Practice2Day3Component } from './practice2-day3/practice2-day3.component';
import { Practice3Day3Component } from './practice3-day3/practice3-day3.component';
import { Practice4Day3Component } from './practice4-day3/practice4-day3.component';
import { Practice5Day3Component } from './practice5-day3/practice5-day3.component';
import { Assignment1Day3Component } from './assignment1-day3/assignment1-day3.component';
import { Practice1Day4Component } from './practice1-day4/practice1-day4.component';
import { Practice2Day4Component } from './practice2-day4/practice2-day4.component';
import { Practice3Day4Component } from './practice3-day4/practice3-day4.component';
import { Practice4Day4Component } from './practice4-day4/practice4-day4.component';
import { Practice5Day4Component } from './practice5-day4/practice5-day4.component';
import { Assignment1Day4Component } from './assignment1-day4/assignment1-day4.component';
import { HtmlHomeComponent } from './html-home/html-home.component';
import { LoginComponent } from './login/login.component';
import { LoggedinguardService } from './loggedinguard.service';

const routes: Routes = [
  { path: 'home', component: HomeComponent },
  { path: 'html', component: HtmlComponent,canActivate: [LoggedinguardService],
    children: [
        { path: 'day3/practice1-day3', component: Practice1Day3Component },
        { path: 'day3/practice2-day3', component: Practice2Day3Component },
        { path: 'day3/practice3-day3', component: Practice3Day3Component },
        { path: 'day3/practice4-day3', component: Practice4Day3Component },
        { path: 'day3/practice5-day3', component: Practice5Day3Component },
        { path: 'day3/assignment1-day3', component: Assignment1Day3Component },
        { path: 'day4/practice1-day4', component: Practice1Day4Component },
        { path: 'day4/practice2-day4', component: Practice2Day4Component },
        { path: 'day4/practice3-day4', component: Practice3Day4Component },
        { path: 'day4/practice4-day4', component: Practice4Day4Component },
        { path: 'day4/practice5-day4', component: Practice5Day4Component },
        { path: 'day4/assignment1-day4', component: Assignment1Day4Component },
        { path: '', component: HtmlHomeComponent}
      ]
  },
  { path: 'angular', component: AngularComponent,canActivate: [LoggedinguardService] },
  { path: 'login', component: LoginComponent },
  { path: '', redirectTo: 'home', pathMatch: 'full' },
  
];

@NgModule({
  imports: [RouterModule.forRoot(routes, {enableTracing: true})],
  exports: [RouterModule]
})
export class AppRoutingModule { }
