import { Component, inject, signal, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { CommonModule } from '@angular/common';
import { NotificationService } from '../services/notification.service';
import { Router } from '@angular/router';

import { AuthService } from '../services/auth.service';

@Component({
  selector: 'app-resultados-planilla',
  imports: [CommonModule],
  templateUrl: './resultados-planilla.html',
  styleUrl: './resultados-planilla.css',
})
export class ResultadosPlanilla implements OnInit {
  private readonly http = inject(HttpClient);
  private readonly notify = inject(NotificationService);
  private readonly router = inject(Router);
  protected readonly auth = inject(AuthService);

  protected readonly resultados = signal<any[]>([]);
  protected readonly periodos = signal<any[]>([]);
  protected readonly periodoSeleccionado = signal<number | null>(null);
  protected readonly periodoNombre = signal('');
  protected readonly loading = signal(false);

  ngOnInit() {
    this.loadPeriodos();
    const data = localStorage.getItem('selectedPeriodoResultados');
    if (data) {
      const periodo = JSON.parse(data);
      this.periodoSeleccionado.set(periodo.id);
      this.periodoNombre.set(periodo.nombre_periodo);
      this.loadResultados(periodo.id);
    }
  }

  loadPeriodos() {
    this.http.get<any[]>('http://localhost/periodos_planilla/periodos_planillalistar').subscribe({
      next: (data) => {
        // Filtrar solo los que ya han sido procesados o cerrados para ver resultados
        this.periodos.set(data.filter(p => p.estado !== 'Abierto'));
      }
    });
  }

  onPeriodoChange(event: any) {
    const id = parseInt(event.target.value);
    if (id) {
      const p = this.periodos().find(x => x.id === id);
      this.periodoSeleccionado.set(id);
      this.periodoNombre.set(p ? p.nombre_periodo : '');
      this.loadResultados(id);
    } else {
      this.resultados.set([]);
      this.periodoNombre.set('');
    }
  }

  loadResultados(periodoId: number) {
    this.loading.set(true);
    this.http.get<any[]>(`http://localhost/planilla/resultados/${periodoId}`).subscribe({
      next: (data) => {
        this.resultados.set(data);
        this.loading.set(false);
      },
      error: (err) => {
        this.notify.error('Error', 'Falla al cargar resultados: ' + err.message);
        this.loading.set(false);
      }
    });
  }

  exportarBanco() {
    if (this.resultados().length === 0) return;

    let csvContent = "data:text/csv;charset=utf-8,";
    csvContent += "Codigo,Nombre,Apellido,IBAN,Monto Neto\r\n";

    this.resultados().forEach(res => {
      const row = `${res.codigo_empleado},${res.nombre},${res.apellido},${res.cuenta_iban || ''},${res.salario_neto}`;
      csvContent += row + "\r\n";
    });

    const encodedUri = encodeURI(csvContent);
    const link = document.createElement("a");
    link.setAttribute("href", encodedUri);
    link.setAttribute("download", `Pago_Planilla_${this.periodoNombre().replace(/ /g, '_')}.csv`);
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
    
    this.notify.success('Éxito', 'Archivo bancario generado correctamente');
  }

  verBoleta(id: number) {
    localStorage.setItem('selectedBoletaId', id.toString());
    this.router.navigate(['/boleta-pago']);
  }

  volver() {
    localStorage.removeItem('selectedPeriodoResultados');
    if (this.auth.isEmployee()) {
      this.router.navigate(['/']);
    } else {
      this.router.navigate(['/periodos-planilla']);
    }
  }
}
