import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HomeComponent } from './home/home.component';
import { ContactUsComponent } from './contact-us/contact-us.component';
import { AboutUsComponent } from './about-us/about-us.component';
import { ProtectedComponent } from './protected/protected.component';
import { LoginComponent } from './login/login.component';
import { LoggedinguardService } from './loggedinguard.service';
import { AUTH_PROVIDERS } from './auth.service';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    ContactUsComponent,
    AboutUsComponent,
    ProtectedComponent,
    LoginComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule
  ],
  providers: [AUTH_PROVIDERS,
    LoggedinguardService,],
  bootstrap: [AppComponent]
})
export class AppModule { }
