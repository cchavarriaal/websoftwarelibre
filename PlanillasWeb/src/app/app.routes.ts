import { Routes } from '@angular/router';
import { Usuarios } from './usuarios/usuarios';
import { Empleados } from './empleados/empleados';
import { DetalleEmpleado } from './detalle-empleado/detalle-empleado';
import { Departamentos } from './departamentos/departamentos';
import { Puestos } from './puestos/puestos';
import { PeriodosPlanilla } from './periodos-planilla/periodos-planilla';
import { MovimientosPlanilla } from './movimientos-planilla/movimientos-planilla';
import { Concepto } from './concepto/concepto';
import { Auditoria } from './auditoria/auditoria';
import { Inicio } from './inicio/inicio';
import { Horarios } from './horarios/horarios';

export const routes: Routes = [
    { path: '', component: Inicio },
    { path: 'usuarios', component: Usuarios },
    { path: 'empleados', component: Empleados },
    { path: 'detalle-empleado', component: DetalleEmpleado },
    { path: 'departamentos', component: Departamentos },
    { path: 'puestos', component: Puestos },
    { path: 'periodos-planilla', component: PeriodosPlanilla },
    { path: 'movimientos-planilla', component: MovimientosPlanilla },
    { path: 'concepto', component: Concepto },
    { path: 'auditoria', component: Auditoria },
    { path: 'horarios', component: Horarios }
];
