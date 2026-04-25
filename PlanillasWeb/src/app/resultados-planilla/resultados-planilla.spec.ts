import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ResultadosPlanilla } from './resultados-planilla';

describe('ResultadosPlanilla', () => {
  let component: ResultadosPlanilla;
  let fixture: ComponentFixture<ResultadosPlanilla>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ResultadosPlanilla],
    }).compileComponents();

    fixture = TestBed.createComponent(ResultadosPlanilla);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
