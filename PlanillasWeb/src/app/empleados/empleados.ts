import { Component, inject, signal, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';

interface Empleado {
  id?: number;
  codigo_empleado: string;
  nombre: string;
  apellido: string;
  dni: string;
  fecha_ingreso: string;
  salario_base: number;
  puesto_id?: number;
  horario_id?: number;
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

  protected readonly empleados = signal<Empleado[]>([]);
  protected readonly currentEmpleado = signal<Empleado>(this.getEmptyEmpleado());
  protected readonly isEditing = signal(false);

  ngOnInit() {
    this.loadEmpleados();
  }

  private getEmptyEmpleado(): Empleado {
    const today = new Date().toISOString().split('T')[0];
    return {
      codigo_empleado: `EMP-${new Date().getFullYear()}${Math.floor(Math.random() * 1000).toString().padStart(3, '0')}`,
      nombre: '',
      apellido: '',
      dni: '',
      fecha_ingreso: today,
      salario_base: 0,
      puesto_id: undefined,
      horario_id: undefined
    };
  }

  protected loadEmpleados() {
    this.http.get<Empleado[]>(this.apiUrl + 'empleadoslistar').subscribe({
      next: (data: any) => {
        if (data && data.error) { alert('Error BD: ' + data.error); }
        this.empleados.set(Array.isArray(data) ? data : []);
      },
      error: (err) => alert('Error cargando empleados: ' + err.message),
    });
  }

  protected saveEmpleado() {
    const empleado = this.currentEmpleado();
    // Normalize empty strings
    if (empleado.puesto_id === '' as any) empleado.puesto_id = undefined;
    if (empleado.horario_id === '' as any) empleado.horario_id = undefined;

    if (this.isEditing() && empleado.id) {
      this.http.put(`${this.apiUrl}empleadosactualizar/${empleado.id}`, empleado).subscribe({
        next: (res: any) => {
          if (res && res.error) { alert('Error servidor: ' + res.error); return; }
          this.loadEmpleados();
          this.resetForm();
          alert('Actualizado correctamente');
        },
        error: (err) => alert('Error de red/HTTP: ' + err.message),
      });
    } else {
      this.http.post(this.apiUrl + 'empleadoscrear', empleado).subscribe({
        next: (res: any) => {
          if (res && res.error) { alert('Error servidor: ' + res.error); return; }
          this.loadEmpleados();
          this.resetForm();
          alert('Creado correctamente');
        },
        error: (err) => alert('Error de red/HTTP: ' + err.message),
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
    this.isEditing.set(true);
  }

  protected deleteEmpleado(id: number) {
    if (confirm('¿Estás seguro de dar de baja este empleado?')) {
      this.http.delete(`${this.apiUrl}empleadoseliminar/${id}`).subscribe({
        next: () => this.loadEmpleados(),
        error: (err) => console.error('Error deleting empleado', err),
      });
    }
  }

  protected resetForm() {
    this.currentEmpleado.set(this.getEmptyEmpleado());
    this.isEditing.set(false);
  }
}
