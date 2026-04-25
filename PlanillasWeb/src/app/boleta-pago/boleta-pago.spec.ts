import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BoletaPago } from './boleta-pago';

describe('BoletaPago', () => {
  let component: BoletaPago;
  let fixture: ComponentFixture<BoletaPago>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [BoletaPago],
    }).compileComponents();

    fixture = TestBed.createComponent(BoletaPago);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
