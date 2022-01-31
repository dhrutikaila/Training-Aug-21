import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';
import { ReactiveFormsModule } from '@angular/forms';

import { AppComponent } from './app.component';
import { Practice1ComponentComponent } from './practice1-component/practice1-component.component';
import { Practice2ComponentComponent } from './practice2-component/practice2-component.component';
import { Assignment1ComponentComponent } from './assignment1-component/assignment1-component.component';
import { UserformComponentComponent } from './userform-component/userform-component.component';
// import { StudentList } from './assignment1-component/assignment1-component.component';


@NgModule({
  declarations: [
    AppComponent,
    Practice1ComponentComponent,
    Practice2ComponentComponent,
    Assignment1ComponentComponent,
    UserformComponentComponent,
    
    // StudentList,
  ],
  imports: [
    BrowserModule,
    FormsModule,
    ReactiveFormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
