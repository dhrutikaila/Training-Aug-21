import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ChildComponent } from './child/child.component';
import { ListComponent } from './list/list.component';
import { StockStatusComponentComponent } from './stock-status-component/stock-status-component.component';

@NgModule({
  declarations: [
    AppComponent,
    ChildComponent,
    ListComponent,
    StockStatusComponentComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
