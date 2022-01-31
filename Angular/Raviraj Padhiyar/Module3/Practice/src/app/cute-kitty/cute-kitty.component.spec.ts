import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CuteKittyComponent } from './cute-kitty.component';

describe('CuteKittyComponent', () => {
  let component: CuteKittyComponent;
  let fixture: ComponentFixture<CuteKittyComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CuteKittyComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CuteKittyComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
