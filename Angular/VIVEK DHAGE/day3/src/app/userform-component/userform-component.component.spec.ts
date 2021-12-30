import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UserformComponentComponent } from './userform-component.component';

describe('UserformComponentComponent', () => {
  let component: UserformComponentComponent;
  let fixture: ComponentFixture<UserformComponentComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UserformComponentComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(UserformComponentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
