import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Practice4Day3Component } from './practice4-day3.component';

describe('Practice4Day3Component', () => {
  let component: Practice4Day3Component;
  let fixture: ComponentFixture<Practice4Day3Component>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ Practice4Day3Component ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(Practice4Day3Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
