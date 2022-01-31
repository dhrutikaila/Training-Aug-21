import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';

import { BrowserAnimationsModule } from '@angular/platform-browser/animations'
import { AppComponent } from './app.component';
import { HeroesModule } from './heroes/heroes.module';
import { AppRoutingModule, RoutingComponent } from './app-routing.module';
import { CrisisCenterModule } from './crisis-center/crisis-center.module';



@NgModule({
  declarations: [
    AppComponent,
    RoutingComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HeroesModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    CrisisCenterModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
