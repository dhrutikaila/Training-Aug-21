import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CalcComponentComponent } from './calc-component.component';

describe('CalcComponentComponent', () => {
  let component: CalcComponentComponent;
  let fixture: ComponentFixture<CalcComponentComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CalcComponentComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CalcComponentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
