import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Practice3Day3Component } from './practice3-day3.component';

describe('Practice3Day3Component', () => {
  let component: Practice3Day3Component;
  let fixture: ComponentFixture<Practice3Day3Component>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ Practice3Day3Component ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(Practice3Day3Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
