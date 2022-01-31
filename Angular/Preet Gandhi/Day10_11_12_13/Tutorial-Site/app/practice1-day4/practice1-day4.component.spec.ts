import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Practice1Day4Component } from './practice1-day4.component';

describe('Practice1Day4Component', () => {
  let component: Practice1Day4Component;
  let fixture: ComponentFixture<Practice1Day4Component>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ Practice1Day4Component ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(Practice1Day4Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
