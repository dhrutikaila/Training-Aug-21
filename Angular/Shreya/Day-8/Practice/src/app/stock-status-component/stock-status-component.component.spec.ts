import { ComponentFixture, TestBed } from '@angular/core/testing';

import { StockStatusComponentComponent } from './stock-status-component.component';

describe('StockStatusComponentComponent', () => {
  let component: StockStatusComponentComponent;
  let fixture: ComponentFixture<StockStatusComponentComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ StockStatusComponentComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(StockStatusComponentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
