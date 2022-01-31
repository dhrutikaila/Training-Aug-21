import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Assignment1Day4Component } from './assignment1-day4.component';

describe('Assignment1Day4Component', () => {
  let component: Assignment1Day4Component;
  let fixture: ComponentFixture<Assignment1Day4Component>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ Assignment1Day4Component ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(Assignment1Day4Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
