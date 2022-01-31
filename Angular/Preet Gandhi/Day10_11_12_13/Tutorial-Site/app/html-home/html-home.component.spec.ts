import { ComponentFixture, TestBed } from '@angular/core/testing';

import { HtmlHomeComponent } from './html-home.component';

describe('HtmlHomeComponent', () => {
  let component: HtmlHomeComponent;
  let fixture: ComponentFixture<HtmlHomeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ HtmlHomeComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(HtmlHomeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
