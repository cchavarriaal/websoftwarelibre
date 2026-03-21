import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MovimientosPlanilla } from './movimientos-planilla';

describe('MovimientosPlanilla', () => {
  let component: MovimientosPlanilla;
  let fixture: ComponentFixture<MovimientosPlanilla>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [MovimientosPlanilla],
    }).compileComponents();

    fixture = TestBed.createComponent(MovimientosPlanilla);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
