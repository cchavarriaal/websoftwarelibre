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
import { ResultadosPlanilla } from './resultados-planilla/resultados-planilla';
import { BoletaPago } from './boleta-pago/boleta-pago';
import { Liquidaciones } from './liquidaciones/liquidaciones';
import { Login } from './login/login';
import { authGuard } from './auth.guard';
import { RolesComponent } from './roles/roles';

export const routes: Routes = [
    { path: 'login', component: Login },
    { path: '', component: Inicio, canActivate: [authGuard] },
    { path: 'usuarios', component: Usuarios, canActivate: [authGuard] },
    { path: 'roles', component: RolesComponent, canActivate: [authGuard] },
    { path: 'empleados', component: Empleados, canActivate: [authGuard] },
    { path: 'detalle-empleado', component: DetalleEmpleado, canActivate: [authGuard] },
    { path: 'departamentos', component: Departamentos, canActivate: [authGuard] },
    { path: 'puestos', component: Puestos, canActivate: [authGuard] },
    { path: 'periodos-planilla', component: PeriodosPlanilla, canActivate: [authGuard] },
    { path: 'movimientos-planilla', component: MovimientosPlanilla, canActivate: [authGuard] },
    { path: 'concepto', component: Concepto, canActivate: [authGuard] },
    { path: 'auditoria', component: Auditoria, canActivate: [authGuard] },
    { path: 'horarios', component: Horarios, canActivate: [authGuard] },
    { path: 'resultados-planilla', component: ResultadosPlanilla, canActivate: [authGuard] },
    { path: 'boleta-pago', component: BoletaPago, canActivate: [authGuard] },
    { path: 'liquidaciones', component: Liquidaciones, canActivate: [authGuard] }
];
