import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Practice1Day3Component } from './practice1-day3.component';

describe('Practice1Day3Component', () => {
  let component: Practice1Day3Component;
  let fixture: ComponentFixture<Practice1Day3Component>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ Practice1Day3Component ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(Practice1Day3Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
