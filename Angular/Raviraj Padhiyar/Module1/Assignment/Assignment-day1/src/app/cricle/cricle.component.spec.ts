import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CricleComponent } from './cricle.component';

describe('CricleComponent', () => {
  let component: CricleComponent;
  let fixture: ComponentFixture<CricleComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CricleComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CricleComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
