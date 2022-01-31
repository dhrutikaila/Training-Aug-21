import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { ReactiveFormsModule } from '@angular/forms';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { PracticeFormComponent } from './practice-form/practice-form.component';
import { AssignmentFormComponent } from './assignment-form/assignment-form.component';

@NgModule({
  declarations: [
    AppComponent,
    PracticeFormComponent,
    AssignmentFormComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    ReactiveFormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
