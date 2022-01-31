import { Component, Input, OnInit } from '@angular/core';
import { Hero } from 'src/app/heroes/hero';

import { Router, ActivatedRoute, ParamMap } from '@angular/router';

import { switchMap } from 'rxjs/operators';
import { HeroService } from '../hero.service';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-hero-detail',
  template: `
    <div *ngIf="hero$ | async as hero">
      <h3>{{ hero.name | uppercase }} Details</h3>
      <p>Id : {{ hero.id }}</p>
      <label for="hero-name">Hero name: </label>
      <input type="text" id="hero-name" [(ngModel)]="hero.name" placeholder="name" />
      <button (click)="gotoHeroes(hero)">Back</button>
    </div>
  `,
  styles: [
    `
      input {
        padding: 0.5rem;
      }
    `,
  ],
})
export class HeroDetailComponent implements OnInit {
  hero$!: Observable<Hero>;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private service: HeroService
  ) {}

  ngOnInit(): void {
    this.hero$ = this.route.paramMap.pipe(
      switchMap((params: ParamMap) => this.service.getHero(params.get('id')!))
    );
  }

  gotoHeroes(hero: Hero) {
    const heroId = hero ? hero.id : null;

    this.router.navigate(['/heroes', { id: heroId, foo: 'foo' }]);
  }
}
