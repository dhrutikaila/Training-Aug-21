import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { heroesRoutingComponent, HeroesRoutingModule } from './heroes-routing.module';
import { FormsModule } from '@angular/forms';


@NgModule({
  declarations: [
      heroesRoutingComponent  
  ],
  imports: [
    CommonModule,
    FormsModule,
    HeroesRoutingModule
  ]
})
export class HeroesModule { }
