import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Practice5Day3Component } from './practice5-day3.component';

describe('Practice5Day3Component', () => {
  let component: Practice5Day3Component;
  let fixture: ComponentFixture<Practice5Day3Component>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ Practice5Day3Component ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(Practice5Day3Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
