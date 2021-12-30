import { ComponentFixture, TestBed } from '@angular/core/testing';

import { NgPracticeComponentComponent } from './ng-practice-component.component';

describe('NgPracticeComponentComponent', () => {
  let component: NgPracticeComponentComponent;
  let fixture: ComponentFixture<NgPracticeComponentComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ NgPracticeComponentComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(NgPracticeComponentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
