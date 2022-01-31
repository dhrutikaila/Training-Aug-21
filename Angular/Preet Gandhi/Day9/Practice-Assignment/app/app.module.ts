import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { EmployeeDetailComponent } from './employee-detail/employee-detail.component';
import { EmployeeListComponent } from './employee-list/employee-list.component';
import { EmployeeService } from './employee.service';
import { FormsModule } from '@angular/forms';
import { ReactiveFormsModule } from '@angular/forms';
import { AdmissionFormComponent } from './admission-form/admission-form.component';
import { StudentService } from './student.service';
import { StudentDataComponent } from './student-data/student-data.component';
import { LoggerService } from './logger.service';

@NgModule({
  declarations: [
    AppComponent,
    EmployeeDetailComponent,
    EmployeeListComponent,
    AdmissionFormComponent,
    StudentDataComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    ReactiveFormsModule
  ],
  providers: [EmployeeService, StudentService, LoggerService],
  bootstrap: [AppComponent]
})
export class AppModule { }
