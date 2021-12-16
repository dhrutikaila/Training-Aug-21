import { Component, NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HTMLComponent } from './html/html.component';
import { CSSComponent } from './css/css.component';
import { RouterModule, Routes } from '@angular/router';
import { JavaScriptComponent } from './java-script/java-script.component';
import { Day1Component } from './html/day1/day1.component';
import { Day2Component } from './html/day2/day2.component';
import { Day3Component } from './css/day3/day3.component';
import { Day4Component } from './css/day4/day4.component';
import { Day5Component } from './css/day5/day5.component';
import { Day15Component } from './java-script/day15/day15.component';
import { Day16Component } from './java-script/day16/day16.component';
import { Day17Component } from './java-script/day17/day17.component';
import { Day18Component } from './java-script/day18/day18.component';
import { Day19Component } from './java-script/day19/day19.component';
import { Day20Component } from './java-script/day20/day20.component';

const appRoutes: Routes = [
  {
    path: 'Html', component: HTMLComponent,
    children: [{
      path: 'Day1', component: Day1Component
    },
    {
      path: 'Day2', component: Day2Component
    }]
  },
  {
    path: 'css', component: CSSComponent,
    children: [{
      path: 'Day3', component: Day3Component
    },
    {
      path: 'Day4', component: Day4Component
    },
    {
      path: 'Day5', component: Day5Component
    }
    ]
  },
  {
    path: 'javascript', component: JavaScriptComponent,
    children: [{
      path: 'Day15', component: Day15Component
    },
    {
      path: 'Day16', component: Day16Component
    },
    {
      path: 'Day17', component: Day17Component
    },
    {
      path: 'Day18', component: Day18Component
    },
    {
      path: 'Day19', component: Day19Component
    },
    {
      path: 'Day20', component: Day20Component
    }
    ]
  },
  { path: '', redirectTo: '/Html', pathMatch: 'full' }
]
@NgModule({
  declarations: [
    AppComponent,
    HTMLComponent,
    CSSComponent,
    JavaScriptComponent,
    Day1Component,
    Day2Component,
    Day3Component,
    Day4Component,
    Day5Component,
    Day15Component,
    Day17Component,
    Day18Component,
    Day19Component,
    Day20Component
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    RouterModule.forRoot(
      appRoutes,
      { enableTracing: true } // <-- debugging purposes only
    )
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
