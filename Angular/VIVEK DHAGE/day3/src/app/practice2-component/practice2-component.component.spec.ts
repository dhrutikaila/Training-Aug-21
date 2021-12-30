import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Practice2ComponentComponent } from './practice2-component.component';

describe('Practice2ComponentComponent', () => {
  let component: Practice2ComponentComponent;
  let fixture: ComponentFixture<Practice2ComponentComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ Practice2ComponentComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(Practice2ComponentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
