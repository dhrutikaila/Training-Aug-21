import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { ReactiveFormsModule } from '@angular/forms';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { StudentAdmissionComponent } from './student-admission/student-admission.component';
import { HeroFormComponent } from './hero-form/hero-form.component';
import { FormsModule } from '@angular/forms';
import { TicketsComponent } from './tickets/tickets.component';
@NgModule({
  declarations: [
    AppComponent,
    StudentAdmissionComponent,
    HeroFormComponent,
    TicketsComponent 
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    ReactiveFormsModule,
 FormsModule,
 
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
