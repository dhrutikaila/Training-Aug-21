import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { CuteKittyComponent } from './cute-kitty/cute-kitty.component';

@NgModule({
  declarations: [
    AppComponent,
    CuteKittyComponent
  ],
  imports: [
    BrowserModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
