import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Practice5Day4Component } from './practice5-day4.component';

describe('Practice5Day4Component', () => {
  let component: Practice5Day4Component;
  let fixture: ComponentFixture<Practice5Day4Component>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ Practice5Day4Component ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(Practice5Day4Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
