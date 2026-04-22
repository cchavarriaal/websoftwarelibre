import { Component, inject, signal, computed, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { NotificationService } from '../services/notification.service';
import { Router } from '@angular/router';

export interface PeriodoPlanilla {
  id?: number;
  nombre_periodo: string;
  fecha_inicio: string;
  fecha_fin: string;
  estado: string;
}

@Component({
  selector: 'app-periodos-planilla',
  imports: [FormsModule, CommonModule],
  templateUrl: './periodos-planilla.html',
  styleUrl: './periodos-planilla.css',
})
export class PeriodosPlanilla implements OnInit {
  private readonly http = inject(HttpClient);
  private readonly apiUrl = 'http://localhost/periodos_planilla/';
  private readonly notify = inject(NotificationService);
  private readonly router = inject(Router);

  protected readonly items = signal<PeriodoPlanilla[]>([]);
  protected readonly searchTerm = signal('');
  protected readonly filterEstado = signal<string | 'all'>('all');
  protected readonly showFilters = signal(false);
  
  protected readonly filteredItems = computed(() => {
    let list = this.items();
    const term = this.searchTerm().toLowerCase();
    const estado = this.filterEstado();

    if (term) {
      list = list.filter(item => 
        (item.nombre_periodo?.toLowerCase() || '').includes(term) ||
        (item.estado?.toLowerCase() || '').includes(term) ||
        (item.id?.toString() || '').includes(term)
      );
    }

    if (estado !== 'all') {
      list = list.filter(item => item.estado === estado);
    }

    return list;
  });
  protected readonly currentItem = signal<PeriodoPlanilla>(this.getEmptyItem());
  protected readonly isEditing = signal(false);
  protected readonly isViewing = signal(false);
  protected readonly showForm = signal(false);

  ngOnInit() {
    this.loadItems();
  }

  private getEmptyItem(): PeriodoPlanilla {
    return { nombre_periodo: '', fecha_inicio: '', fecha_fin: '', estado: 'Abierto' };
  }

  protected loadItems() {
    this.http.get<PeriodoPlanilla[]>(this.apiUrl + 'periodos_planillalistar').subscribe({
      next: (data: any) => this.items.set(Array.isArray(data) ? data : []),
      error: (err) => this.notify.error('Error', 'Falla al cargar: ' + err.message),
    });
  }

  protected saveItem() {
    const item = this.currentItem();
    if (this.isEditing() && item.id) {
      this.http.put(`${this.apiUrl}periodos_planillaactualizar/${item.id}`, item).subscribe({
        next: () => { this.loadItems(); this.resetForm(); this.notify.success('Éxito', 'Periodo actualizado'); },
        error: (err) => this.notify.error('Error', err.message),
      });
    } else {
      this.http.post(this.apiUrl + 'periodos_planillacrear', item).subscribe({
        next: () => { this.loadItems(); this.resetForm(); this.notify.success('Éxito', 'Periodo creado'); },
        error: (err) => this.notify.error('Error', err.message),
      });
    }
  }

  protected viewItemDetails(item: PeriodoPlanilla) {
    this.currentItem.set({ ...item });
    this.isViewing.set(true);
    this.isEditing.set(false);
    this.showForm.set(true);
  }

  protected editItem(item: PeriodoPlanilla) {
    let fi = item.fecha_inicio;
    let ff = item.fecha_fin;
    if (fi && fi.includes('T')) fi = fi.split('T')[0];
    if (ff && ff.includes('T')) ff = ff.split('T')[0];
    
    this.currentItem.set({ ...item, fecha_inicio: fi, fecha_fin: ff });
    this.isViewing.set(false);
    this.isEditing.set(true);
    this.showForm.set(true);
  }

  // ✏️ ESCRIBE en localStorage y navega a movimientos
  protected viewMovimientos(periodo: PeriodoPlanilla) {
    localStorage.setItem('selectedPeriodo', JSON.stringify(periodo));
    this.router.navigate(['/movimientos-planilla']);
  }

  protected clearFilters() {
    this.searchTerm.set('');
    this.filterEstado.set('all');
  }

  protected async deleteItem(id: number) {
    if (await this.notify.confirm('¿Eliminar periodo?', 'Esta acción no se puede deshacer.')) {
      this.http.delete(`${this.apiUrl}periodos_planillaeliminar/${id}`).subscribe({
        next: () => { this.loadItems(); this.notify.success('Éxito', 'Periodo eliminado'); },
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
