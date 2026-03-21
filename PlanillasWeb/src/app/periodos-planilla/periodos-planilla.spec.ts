import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PeriodosPlanilla } from './periodos-planilla';

describe('PeriodosPlanilla', () => {
  let component: PeriodosPlanilla;
  let fixture: ComponentFixture<PeriodosPlanilla>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [PeriodosPlanilla],
    }).compileComponents();

    fixture = TestBed.createComponent(PeriodosPlanilla);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
