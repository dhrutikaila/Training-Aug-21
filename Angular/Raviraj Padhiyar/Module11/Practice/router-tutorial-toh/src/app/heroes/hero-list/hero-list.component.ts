import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

import { Observable } from 'rxjs';
import { switchMap } from 'rxjs/operators';

import { Hero } from '../hero';
import { HeroService } from '../hero.service';
import { MessageService } from '../../message.service';

@Component({
  selector: 'app-hero-list',
  template: `
    <h2>HEROES</h2>
    <ul class="heroes">
      <li
        *ngFor="let hero of heroes$ | async"
        [class.selected]="hero.id === selectedId"
      >
        <a [routerLink]="['/hero', hero.id]">
          <span class="badge">{{ hero.id }}</span> {{ hero.name }}
        </a>
      </li>
    </ul>

    <button routerLink="/sidekicks">Go to sidekicks</button>
  `,
  styles: [
    `
      /* HeroListComponent's private CSS styles */
      .heroes {
        margin: 0 0 2em 0;
        list-style-type: none;
        padding: 0;
        width: 100%;
      }
      .heroes li {
        position: relative;
        cursor: pointer;
      }

      .heroes li:hover {
        left: 0.1em;
      }

      .heroes a {
        color: black;
        text-decoration: none;
        display: block;
        font-size: 1.2rem;
        background-color: #eee;
        margin: 0.5rem 0.5rem 0.5rem 0;
        padding: 0.5rem 0;
        border-radius: 4px;
      }

      .heroes a:hover {
        color: #2c3a41;
        background-color: #e6e6e6;
      }

      .heroes a:active {
        background-color: #525252;
        color: #fafafa;
      }

      .heroes .selected a {
        background-color: #d6e6f7;
      }

      .heroes .selected a:hover {
        background-color: #bdd7f5;
      }

      .heroes .badge {
        padding: 0.5em 0.6em;
        color: white;
        background-color: #435b60;
        min-width: 16px;
        margin-right: 0.8em;
        border-radius: 4px 0 0 4px;
      }
    `,
  ],
})
export class HeroListComponent implements OnInit {
  heroes$!: Observable<Hero[]>;
  selectedId = 0;

  constructor(
    private heroService: HeroService,
    private route : ActivatedRoute
  ) {}

  ngOnInit(): void {
    this.heroes$ = this.route.paramMap.pipe(
      switchMap((params) => {
        this.selectedId = parseInt(params.get('id')!, 10);
        return this.heroService.getHeroes();
      })
    );
  }

  // getHeroes(): void {
  //   this.heroService.getHeroes().subscribe((heroes) => (this.heroes = heroes));
  // }
}
