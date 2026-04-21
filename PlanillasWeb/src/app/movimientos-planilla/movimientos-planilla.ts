import { Component, inject, signal, computed, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { NotificationService } from '../services/notification.service';

export interface MovimientoPlanilla {
  id?: number;
  empleado_id: number;
  periodo_id: number;
  concepto_id: number;
  monto_calculado: number;
  empleado_nombre?: string;
  periodo_nombre?: string;
  concepto_nombre?: string;
}

@Component({
  selector: 'app-movimientos-planilla',
  imports: [FormsModule, CommonModule],
  templateUrl: './movimientos-planilla.html',
  styleUrl: './movimientos-planilla.css',
})
export class MovimientosPlanilla implements OnInit {
  private readonly http = inject(HttpClient);
  private readonly apiUrl = 'http://localhost/movimientos_planilla/';
  private readonly notify = inject(NotificationService);

  protected readonly items = signal<MovimientoPlanilla[]>([]);
  protected readonly searchTerm = signal('');
  protected readonly filteredItems = computed(() => {
    const term = this.searchTerm().toLowerCase();
    if (!term) return this.items();
    return this.items().filter(item => 
      (item.empleado_nombre?.toLowerCase() || '').includes(term) ||
      (item.periodo_nombre?.toLowerCase() || '').includes(term) ||
      (item.concepto_nombre?.toLowerCase() || '').includes(term) ||
      (item.id?.toString() || '').includes(term)
    );
  });
  protected readonly empleados = signal<any[]>([]);
  protected readonly periodos = signal<any[]>([]);
  protected readonly conceptos = signal<any[]>([]);
  protected readonly currentItem = signal<MovimientoPlanilla>(this.getEmptyItem());
  protected readonly isEditing = signal(false);
  protected readonly showForm = signal(false);

  ngOnInit() {
    this.loadItems();
    this.loadEmpleados();
    this.loadPeriodos();
    this.loadConceptos();
    this.loadFromLocalStorage();
  }

  protected loadFromLocalStorage() {
    const data = localStorage.getItem('selectedPeriodo');
    if (data) {
      const periodo = JSON.parse(data);
      // Filtramos la lista buscando por el nombre del periodo
      this.searchTerm.set(periodo.nombre_periodo);
      // Opcional: preseleccionar en el formulario nuevo
      this.currentItem.update(item => ({ ...item, periodo_id: periodo.id }));
    }
  }

  protected clearStorage() {
    localStorage.removeItem('selectedPeriodo');
    this.searchTerm.set('');
  }

  protected loadEmpleados() {
    this.http.get<any[]>('http://localhost/empleados/empleadoslistar').subscribe({
      next: (data: any) => this.empleados.set(Array.isArray(data) ? data : [])
    });
  }
  protected loadPeriodos() {
    this.http.get<any[]>('http://localhost/periodos_planilla/periodos_planillalistar').subscribe({
      next: (data: any) => this.periodos.set(Array.isArray(data) ? data : [])
    });
  }
  protected loadConceptos() {
    this.http.get<any[]>('http://localhost/concepto/conceptoslistar').subscribe({
      next: (data: any) => this.conceptos.set(Array.isArray(data) ? data : [])
    });
  }

  private getEmptyItem(): MovimientoPlanilla {
    return { empleado_id: 0, periodo_id: 0, concepto_id: 0, monto_calculado: 0 };
  }

  protected loadItems() {
    this.http.get<MovimientoPlanilla[]>(this.apiUrl + 'movimientos_planillalistar').subscribe({
      next: (data: any) => this.items.set(Array.isArray(data) ? data : []),
      error: (err) => this.notify.error('Error', 'Falla al cargar: ' + err.message),
    });
  }

  protected saveItem() {
    const item = this.currentItem();
    if (this.isEditing() && item.id) {
      this.http.put(`${this.apiUrl}movimientos_planillaactualizar/${item.id}`, item).subscribe({
        next: () => { this.loadItems(); this.resetForm(); this.notify.success('Éxito', 'Movimiento actualizado'); },
        error: (err) => this.notify.error('Error', err.message),
      });
    } else {
      this.http.post(this.apiUrl + 'movimientos_planillacrear', item).subscribe({
        next: () => { this.loadItems(); this.resetForm(); this.notify.success('Éxito', 'Movimiento registrado'); },
        error: (err) => this.notify.error('Error', err.message),
      });
    }
  }

  protected editItem(item: MovimientoPlanilla) {
    this.currentItem.set({ ...item });
    this.isEditing.set(true);
    this.showForm.set(true);
  }

  protected async deleteItem(id: number) {
    if (await this.notify.confirm('¿Eliminar movimiento?', 'Esta acción revertirá el movimiento.')) {
      this.http.delete(`${this.apiUrl}movimientos_planillaeliminar/${id}`).subscribe({
        next: () => { this.loadItems(); this.notify.success('Éxito', 'Movimiento eliminado'); },
        error: (err) => this.notify.error('Error', err.message),
      });
    }
  }

  protected resetForm() {
    this.currentItem.set(this.getEmptyItem());
    this.isEditing.set(false);
    this.showForm.set(false);
  }

  protected createNew() {
    this.resetForm();
    this.showForm.set(true);
  }
}
