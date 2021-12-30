import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Assignment1ComponentComponent } from './assignment1-component.component';

describe('Assignment1ComponentComponent', () => {
  let component: Assignment1ComponentComponent;
  let fixture: ComponentFixture<Assignment1ComponentComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ Assignment1ComponentComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(Assignment1ComponentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
