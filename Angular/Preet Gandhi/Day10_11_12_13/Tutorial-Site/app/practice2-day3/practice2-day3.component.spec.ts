import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Practice2Day3Component } from './practice2-day3.component';

describe('Practice2Day3Component', () => {
  let component: Practice2Day3Component;
  let fixture: ComponentFixture<Practice2Day3Component>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ Practice2Day3Component ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(Practice2Day3Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
