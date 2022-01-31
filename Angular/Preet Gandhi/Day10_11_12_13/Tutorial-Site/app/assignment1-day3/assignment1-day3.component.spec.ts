import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Assignment1Day3Component } from './assignment1-day3.component';

describe('Assignment1Day3Component', () => {
  let component: Assignment1Day3Component;
  let fixture: ComponentFixture<Assignment1Day3Component>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ Assignment1Day3Component ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(Assignment1Day3Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
