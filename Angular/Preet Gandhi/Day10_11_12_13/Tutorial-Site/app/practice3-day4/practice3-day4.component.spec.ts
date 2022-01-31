import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Practice3Day4Component } from './practice3-day4.component';

describe('Practice3Day4Component', () => {
  let component: Practice3Day4Component;
  let fixture: ComponentFixture<Practice3Day4Component>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ Practice3Day4Component ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(Practice3Day4Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
