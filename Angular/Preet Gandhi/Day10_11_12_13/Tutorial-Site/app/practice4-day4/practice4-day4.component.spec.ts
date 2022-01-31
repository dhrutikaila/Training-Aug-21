import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Practice4Day4Component } from './practice4-day4.component';

describe('Practice4Day4Component', () => {
  let component: Practice4Day4Component;
  let fixture: ComponentFixture<Practice4Day4Component>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ Practice4Day4Component ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(Practice4Day4Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
