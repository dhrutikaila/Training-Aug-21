import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { AboutUsComponent } from './about-us/about-us.component';
import { ContactUsComponent } from './contact-us/contact-us.component';
import { ProtectedComponent } from './protected/protected.component';
import { LoginComponent } from './login/login.component';
import { LoggedinguardService } from './loggedinguard.service';

const routes: Routes = [
  { path: '', redirectTo: 'home', pathMatch:'full' },
  {path: 'home', component: HomeComponent},
  {path: 'about-us', component: AboutUsComponent},
  {path: 'about', redirectTo: 'about-us'},
  {path: 'contact-us', component: ContactUsComponent},
  {path: 'contact', redirectTo: 'contact-us'},
  {path: 'protected', component:ProtectedComponent, canActivate: [LoggedinguardService]}
];

@NgModule({
  imports: [RouterModule.forRoot(routes, {enableTracing: true})],
  exports: [RouterModule]
})
export class AppRoutingModule { }
