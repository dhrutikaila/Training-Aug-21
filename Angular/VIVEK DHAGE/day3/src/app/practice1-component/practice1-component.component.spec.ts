import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Practice1ComponentComponent } from './practice1-component.component';

describe('Practice1ComponentComponent', () => {
  let component: Practice1ComponentComponent;
  let fixture: ComponentFixture<Practice1ComponentComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ Practice1ComponentComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(Practice1ComponentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
