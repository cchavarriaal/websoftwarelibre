import { Routes } from '@angular/router';
import { Usuarios } from './usuarios/usuarios';
import { Empleados } from './empleados/empleados';
import { Departamentos } from './departamentos/departamentos';
import { Puestos } from './puestos/puestos';
import { PeriodosPlanilla } from './periodos-planilla/periodos-planilla';
import { MovimientosPlanilla } from './movimientos-planilla/movimientos-planilla';
import { Concepto } from './concepto/concepto';

export const routes: Routes = [
    { path: 'usuarios', component: Usuarios },
    { path: 'empleados', component: Empleados },
    { path: 'departamentos', component: Departamentos },
    { path: 'puestos', component: Puestos },
    { path: 'periodos-planilla', component: PeriodosPlanilla },
    { path: 'movimientos-planilla', component: MovimientosPlanilla },
    { path: 'concepto', component: Concepto }
];
