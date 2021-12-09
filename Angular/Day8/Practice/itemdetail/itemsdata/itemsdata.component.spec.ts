import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ItemsdataComponent } from './itemsdata.component';

describe('ItemsdataComponent', () => {
  let component: ItemsdataComponent;
  let fixture: ComponentFixture<ItemsdataComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ItemsdataComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ItemsdataComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
