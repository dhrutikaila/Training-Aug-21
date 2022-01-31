import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Practice2Day4Component } from './practice2-day4.component';

describe('Practice2Day4Component', () => {
  let component: Practice2Day4Component;
  let fixture: ComponentFixture<Practice2Day4Component>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ Practice2Day4Component ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(Practice2Day4Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
