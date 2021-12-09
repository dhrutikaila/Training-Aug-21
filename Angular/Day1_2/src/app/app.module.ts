import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HelloWorldComponent } from './hello-world/hello-world.component';
import { CalcComponent } from './calc/calc.component';
import { RectangleComponent } from './rectangle/rectangle.component';

import { FormsModule } from '@angular/forms';
import { LoginComponent } from './login/login.component';
import { CircleComponent } from './circle/circle.component';
import { LeftbarComponent } from './leftbar/leftbar.component';
import { SignupComponent } from './signup/signup.component';
import { ItemdetailComponent } from './itemdetail/itemdetail.component';
import { StudentListComponent } from './student-list/student-list.component';
import { ItemsdataComponent } from './itemdetail/itemsdata/itemsdata.component';
import { StudentComponent } from './student/student.component';
import { StudentCountComponent } from './student-count/student-count.component';

@NgModule({
  declarations: [
    AppComponent,
    HelloWorldComponent,
    CalcComponent,
    RectangleComponent,
    LoginComponent,
    CircleComponent,
    LeftbarComponent,
    SignupComponent,
    ItemdetailComponent,
    StudentListComponent,
    ItemsdataComponent,
    StudentComponent,
    StudentCountComponent,
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
