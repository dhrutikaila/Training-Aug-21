import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LeftBarComponentComponent } from './left-bar-component.component';

describe('LeftBarComponentComponent', () => {
  let component: LeftBarComponentComponent;
  let fixture: ComponentFixture<LeftBarComponentComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ LeftBarComponentComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(LeftBarComponentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
