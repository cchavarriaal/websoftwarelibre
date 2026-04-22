import { Component, inject, signal, computed, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { NotificationService } from '../services/notification.service';
import { Router } from '@angular/router';

interface Empleado {
  id?: number;
  codigo_empleado: string;
  nombre: string;
  apellido: string;
  dni: string;
  fecha_ingreso: string;
  salario_base: number;
  puesto_id?: number;
  puesto_nombre?: string;
  horario_id?: number;
  horario_nombre?: string;
  cuenta_iban?: string;
  banco?: string;
}

@Component({
  selector: 'app-empleados',
  imports: [FormsModule, CommonModule],
  templateUrl: './empleados.html',
  styleUrl: './empleados.css',
})
export class Empleados implements OnInit {
  private readonly http = inject(HttpClient);
  private readonly apiUrl = 'http://localhost/empleados/';
  private readonly router = inject(Router);

  protected readonly empleados = signal<Empleado[]>([]);
  protected readonly searchTerm = signal('');
  protected readonly filterPuesto = signal<number | 'all'>('all');
  protected readonly filterHorario = signal<number | 'all'>('all');
  protected readonly showFilters = signal(false);
  
  protected readonly filteredEmpleados = computed(() => {
    let list = this.empleados();
    const term = this.searchTerm().toLowerCase();
    const puesto = this.filterPuesto();
    const horario = this.filterHorario();

    if (term) {
      list = list.filter(e => 
        (e.nombre?.toLowerCase() || '').includes(term) ||
        (e.apellido?.toLowerCase() || '').includes(term) ||
        (e.dni?.toLowerCase() || '').includes(term) ||
        (e.codigo_empleado?.toLowerCase() || '').includes(term) ||
        (e.puesto_nombre?.toLowerCase() || '').includes(term)
      );
    }

    if (puesto !== 'all') {
      list = list.filter(e => e.puesto_id === puesto);
    }

    if (horario !== 'all') {
      list = list.filter(e => e.horario_id === horario);
    }

    return list;
  });
  protected readonly puestos = signal<any[]>([]);
  protected readonly horarios = signal<any[]>([]);
  protected readonly currentEmpleado = signal<Empleado>(this.getEmptyEmpleado());
  protected readonly isEditing = signal(false);
  protected readonly isViewing = signal(false);
  protected readonly showForm = signal(false);
  private readonly notify = inject(NotificationService);

  ngOnInit() {
    this.loadEmpleados();
    this.loadPuestos();
    this.loadHorarios();
  }

  protected loadPuestos() {
    this.http.get<any[]>('http://localhost/puestos/puestoslistar').subscribe({
      next: (data: any) => this.puestos.set(Array.isArray(data) ? data : [])
    });
  }

  protected loadHorarios() {
    this.http.get<any[]>('http://localhost/horarios/horarioslistar').subscribe({
      next: (data: any) => this.horarios.set(Array.isArray(data) ? data : [])
    });
  }

  private getEmptyEmpleado(): Empleado {
    const today = new Date().toISOString().split('T')[0];
    return {
      codigo_empleado: '',
      nombre: '',
      apellido: '',
      dni: '',
      fecha_ingreso: today,
      salario_base: 0,
      puesto_id: undefined,
      horario_id: undefined,
      cuenta_iban: '',
      banco: ''
    };
  }

  protected loadEmpleados() {
    this.http.get<Empleado[]>(this.apiUrl + 'empleadoslistar').subscribe({
      next: (data: any) => {
        if (data && data.error) { this.notify.error('Error', data.error); }
        this.empleados.set(Array.isArray(data) ? data : []);
      },
      error: (err) => this.notify.error('Error', 'Falla de API: ' + err.message),
    });
  }

  protected saveEmpleado() {
    const empleado = this.currentEmpleado();
    if (empleado.puesto_id === '' as any) empleado.puesto_id = undefined;
    if (empleado.horario_id === '' as any) empleado.horario_id = undefined;

    if (this.isEditing() && empleado.id) {
      this.http.put(`${this.apiUrl}empleadosactualizar/${empleado.id}`, empleado).subscribe({
        next: (res: any) => {
          if (res && res.error) { this.notify.error('Error', res.error); return; }
          this.loadEmpleados();
          this.resetForm();
          this.notify.success('Éxito', 'Empleado actualizado correctamente');
        },
        error: (err) => this.notify.error('Error', err.message),
      });
    } else {
      this.http.post(this.apiUrl + 'empleadoscrear', empleado).subscribe({
        next: (res: any) => {
          if (res && res.error) { this.notify.error('Error', res.error); return; }
          this.loadEmpleados();
          this.resetForm();
          this.notify.success('Éxito', 'Empleado creado correctamente');
        },
        error: (err) => this.notify.error('Error', err.message),
      });
    }
  }

  protected editEmpleado(empleado: Empleado) {
    // Normalizar posible fecha devuelta por la base de datos (e.g., eliminando la hora T00:00:00.000Z)
    let fi = empleado.fecha_ingreso;
    if (fi && fi.includes('T')) {
      fi = fi.split('T')[0];
    }
    this.currentEmpleado.set({ ...empleado, fecha_ingreso: fi });
    this.isViewing.set(false);
    this.isEditing.set(true);
    this.showForm.set(true);
  }

  // ✏️ ESCRIBE en localStorage y navega a la página de detalle
  protected viewEmpleadoDetails(empleado: Empleado) {
    this.currentEmpleado.set({ ...empleado });
    this.isViewing.set(true);
    this.isEditing.set(false);
    this.showForm.set(true);
  }

  // ✏️ ESCRIBE en localStorage y navega a la página de detalle (mantenemos compatibilidad)
  protected viewInAnotherPage(empleado: Empleado) {
    localStorage.setItem('selectedEmpleado', JSON.stringify(empleado));
    this.router.navigate(['/detalle-empleado']);
  }

  protected clearFilters() {
    this.searchTerm.set('');
    this.filterPuesto.set('all');
    this.filterHorario.set('all');
  }

  protected async deleteEmpleado(id: number) {
    const confirmed = await this.notify.confirm('¿Eliminar Empleado?', 'Se dará de baja al empleado de forma permanente.');
    if (confirmed) {
      this.http.delete(`${this.apiUrl}empleadoseliminar/${id}`).subscribe({
        next: () => {
          this.loadEmpleados();
          this.notify.success('Eliminado', 'Empleado dado de baja.');
        },
        error: (err) => this.notify.error('Error', err.message),
      });
    }
  }

  protected resetForm() {
    this.currentEmpleado.set(this.getEmptyEmpleado());
    this.isEditing.set(false);
    this.isViewing.set(false);
    this.showFilters.set(false);
    this.showForm.set(false);
  }

  protected createNew() {
    this.resetForm();
    this.currentEmpleado.update(e => ({ ...e, codigo_empleado: 'Auto-generado por DB' }));
    this.showForm.set(true);
  }
}
