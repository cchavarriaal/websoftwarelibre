import { Component, inject, signal, computed, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { NotificationService } from '../services/notification.service';

export interface IConcepto {
  id?: number;
  nombre: string;
  tipo: string;
  es_ley: number;
  porcentaje?: number;
  monto_fijo?: number;
  modo_calculo?: 'porcentaje' | 'monto_fijo';
}

@Component({
  selector: 'app-concepto',
  imports: [FormsModule, CommonModule],
  templateUrl: './concepto.html',
  styleUrl: './concepto.css',
})
export class Concepto implements OnInit {
  private readonly http = inject(HttpClient);
  private readonly apiUrl = 'http://localhost/concepto/';
  private readonly notify = inject(NotificationService);

  protected readonly items = signal<IConcepto[]>([]);
  protected readonly searchTerm = signal('');
  protected readonly filterTipo = signal<string | 'all'>('all');
  protected readonly showFilters = signal(false);
  
  protected readonly filteredItems = computed(() => {
    let list = this.items();
    const term = this.searchTerm().toLowerCase();
    const tipo = this.filterTipo();

    if (term) {
      list = list.filter(item => 
        (item.nombre?.toLowerCase() || '').includes(term) ||
        (item.tipo?.toLowerCase() || '').includes(term) ||
        (item.id?.toString() || '').includes(term)
      );
    }

    if (tipo !== 'all') {
      list = list.filter(item => item.tipo === tipo);
    }

    return list;
  });
  protected readonly currentItem = signal<IConcepto>(this.getEmptyItem());
  protected readonly isEditing = signal(false);
  protected readonly isViewing = signal(false);
  protected readonly showForm = signal(false);

  ngOnInit() {
    this.loadItems();
  }

  private getEmptyItem(): IConcepto {
    return { nombre: '', tipo: 'Ingreso', es_ley: 1, porcentaje: 0, monto_fijo: 0, modo_calculo: 'porcentaje' };
  }

  protected loadItems() {
    this.http.get<IConcepto[]>(this.apiUrl + 'conceptoslistar').subscribe({
      next: (data: any) => this.items.set(Array.isArray(data) ? data : []),
      error: (err) => this.notify.error('Error', 'Falla al cargar: ' + err.message),
    });
  }

  protected saveItem() {
    const item = this.currentItem();
    if (this.isEditing() && item.id) {
      this.http.put(`${this.apiUrl}conceptosactualizar/${item.id}`, item).subscribe({
        next: () => { this.loadItems(); this.resetForm(); this.notify.success('Éxito', 'Concepto actualizado'); },
        error: (err) => this.notify.error('Error', err.message),
      });
    } else {
      this.http.post(this.apiUrl + 'conceptoscrear', item).subscribe({
        next: () => { this.loadItems(); this.resetForm(); this.notify.success('Éxito', 'Concepto creado'); },
        error: (err) => this.notify.error('Error', err.message),
      });
    }
  }

  protected viewItemDetails(item: IConcepto) {
    const modo = (item.monto_fijo && item.monto_fijo > 0) ? 'monto_fijo' : 'porcentaje';
    this.currentItem.set({ ...item, modo_calculo: modo });
    this.isViewing.set(true);
    this.isEditing.set(false);
    this.showForm.set(true);
  }

  protected editItem(item: IConcepto) {
    const modo = (item.monto_fijo && item.monto_fijo > 0) ? 'monto_fijo' : 'porcentaje';
    this.currentItem.set({ ...item, modo_calculo: modo });
    this.isViewing.set(false);
    this.isEditing.set(true);
    this.showForm.set(true);
  }

  protected onModoCalculoChange() {
    this.currentItem.update(item => {
      if (item.modo_calculo === 'porcentaje') {
        item.monto_fijo = 0;
      } else {
        item.porcentaje = 0;
      }
      return item;
    });
  }

  protected clearFilters() {
    this.searchTerm.set('');
    this.filterTipo.set('all');
  }

  protected async deleteItem(id: number) {
    if (await this.notify.confirm('¿Eliminar concepto?', 'Esta acción no se puede deshacer.')) {
      this.http.delete(`${this.apiUrl}conceptoseliminar/${id}`).subscribe({
        next: () => { this.loadItems(); this.notify.success('Éxito', 'Concepto eliminado'); },
        error: (err) => this.notify.error('Error', err.message),
      });
    }
  }

  protected resetForm() {
    this.currentItem.set(this.getEmptyItem());
    this.isEditing.set(false);
    this.isViewing.set(false);
    this.showFilters.set(false);
    this.showForm.set(false);
  }

  protected createNew() {
    this.resetForm();
    this.showForm.set(true);
  }
}
