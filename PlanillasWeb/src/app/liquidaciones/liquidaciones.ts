import { Component, inject, signal, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { NotificationService } from '../services/notification.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-liquidaciones',
  standalone: true,
  imports: [FormsModule, CommonModule],
  templateUrl: './liquidaciones.html',
  styleUrl: './liquidaciones.css'
})
export class Liquidaciones implements OnInit {
  private readonly http = inject(HttpClient);
  private readonly notify = inject(NotificationService);
  private readonly router = inject(Router);

  protected readonly empleados = signal<any[]>([]);
  protected readonly liquidaciones = signal<any[]>([]);
  protected readonly loading = signal(false);
  protected readonly showForm = signal(false);

  // Form data
  protected readonly selectedEmpleadoId = signal<number | null>(null);
  protected readonly fechaSalida = signal(new Date().toISOString().split('T')[0]);
  protected readonly motivo = signal('Renuncia');
  protected readonly calculoPreview = signal<any>(null);

  ngOnInit() {
    this.loadEmpleados();
    this.loadLiquidaciones();
  }

  loadEmpleados() {
    this.http.get<any[]>('http://localhost/empleados/empleadoslistar').subscribe({
      next: (data) => this.empleados.set(data),
      error: (err) => this.notify.error('Error', 'No se pudieron cargar los empleados')
    });
  }

  loadLiquidaciones() {
    this.loading.set(true);
    this.http.get<any[]>('http://localhost/liquidaciones/listar').subscribe({
      next: (data) => {
        this.liquidaciones.set(data);
        this.loading.set(false);
      },
      error: (err) => {
        this.notify.error('Error', 'No se pudieron cargar las liquidaciones');
        this.loading.set(false);
      }
    });
  }

  calcular() {
    if (!this.selectedEmpleadoId()) {
      this.notify.info('Atención', 'Seleccione un empleado');
      return;
    }

    this.loading.set(true);
    const body = {
      empleado_id: this.selectedEmpleadoId(),
      fecha_salida: this.fechaSalida(),
      motivo: this.motivo()
    };

    this.http.post('http://localhost/liquidaciones/calcular', body).subscribe({
      next: (res: any) => {
        this.calculoPreview.set(res);
        this.loading.set(false);
      },
      error: (err) => {
        this.notify.error('Error', err.error?.error || 'Error al calcular');
        this.loading.set(false);
      }
    });
  }

  guardar() {
    if (!this.calculoPreview()) return;

    const data = {
      empleado_id: this.selectedEmpleadoId(),
      fecha_salida: this.fechaSalida(),
      motivo: this.motivo(),
      monto_aguinaldo: this.calculoPreview().detalle.aguinaldo,
      monto_vacaciones: this.calculoPreview().detalle.vacaciones,
      monto_preaviso: this.calculoPreview().detalle.preaviso,
      monto_cesantia: this.calculoPreview().detalle.cesantia,
      total_liquidacion: this.calculoPreview().total
    };

    this.http.post('http://localhost/liquidaciones/guardar', data).subscribe({
      next: () => {
        this.notify.success('Éxito', 'Liquidación guardada correctamente');
        this.reset();
        this.loadLiquidaciones();
        this.showForm.set(false);
      },
      error: (err) => this.notify.error('Error', 'No se pudo guardar la liquidación')
    });
  }

  reset() {
    this.selectedEmpleadoId.set(null);
    this.calculoPreview.set(null);
  }

  volver() {
    this.router.navigate(['/']);
  }
}
