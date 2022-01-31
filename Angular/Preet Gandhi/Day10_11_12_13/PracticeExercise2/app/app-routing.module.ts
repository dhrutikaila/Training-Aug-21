import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { HomeComponent } from './home/home.component';
import { ContactComponent } from './contact/contact.component';
import { ProductComponent} from './product/product.component';
import { ErrorComponent} from './error/error.component'; 

import { ProductDetailComponent } from './product-detail/product-detail.component';

import { OverviewComponent } from './overview/overview.component';
import { SpecComponent } from './spec/spec.component';

const appRoutes: Routes = [
  { path: 'home', component: HomeComponent },
  { path: 'contact', component: ContactComponent },
  { path: 'product', component: ProductComponent, 
      children: [
        { path: 'detail/:id', component: ProductDetailComponent, 
            children : [
                { path: 'overview', component: OverviewComponent },
                { path: 'spec', component: SpecComponent },  
                { path: '', redirectTo:'overview', pathMatch:"full" }
            ]
        }
      ]
    },
  { path: '', redirectTo: 'home', pathMatch: 'full' },
  { path: '**', component: ErrorComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(appRoutes, {enableTracing: true})],
  exports: [RouterModule]
})
export class AppRoutingModule { }
