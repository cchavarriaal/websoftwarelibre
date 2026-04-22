import { Component, inject, signal, computed, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { NotificationService } from '../services/notification.service';
import { Router } from '@angular/router';

export interface Departamento {
  id?: number;
  nombre: string;
}

@Component({
  selector: 'app-departamentos',
  imports: [FormsModule, CommonModule],
  templateUrl: './departamentos.html',
  styleUrl: './departamentos.css',
})
export class Departamentos implements OnInit {
  private readonly http = inject(HttpClient);
  private readonly apiUrl = 'http://localhost/departamentos/';
  private readonly notify = inject(NotificationService);
  private readonly router = inject(Router);

  protected readonly items = signal<Departamento[]>([]);
  protected readonly searchTerm = signal('');
  protected readonly showFilters = signal(false);
  protected readonly filteredItems = computed(() => {
    const term = this.searchTerm().toLowerCase();
    if (!term) return this.items();
    return this.items().filter(item => 
      (item.nombre?.toLowerCase() || '').includes(term) ||
      (item.id?.toString() || '').includes(term)
    );
  });
  protected readonly currentItem = signal<Departamento>(this.getEmptyItem());
  protected readonly isEditing = signal(false);
  protected readonly isViewing = signal(false);
  protected readonly showForm = signal(false);

  ngOnInit() {
    this.loadItems();
  }

  private getEmptyItem(): Departamento {
    return { nombre: '' };
  }

  protected loadItems() {
    this.http.get<Departamento[]>(this.apiUrl + 'departamentoslistar').subscribe({
      next: (data: any) => this.items.set(Array.isArray(data) ? data : []),
      error: (err) => this.notify.error('Error', 'Falla al cargar: ' + err.message),
    });
  }

  protected saveItem() {
    const item = this.currentItem();
    if (this.isEditing() && item.id) {
      this.http.put(`${this.apiUrl}departamentosactualizar/${item.id}`, item).subscribe({
        next: () => { this.loadItems(); this.resetForm(); this.notify.success('Éxito', 'Departamento actualizado'); },
        error: (err) => this.notify.error('Error', err.message),
      });
    } else {
      this.http.post(this.apiUrl + 'departamentoscrear', item).subscribe({
        next: () => { this.loadItems(); this.resetForm(); this.notify.success('Éxito', 'Departamento creado'); },
        error: (err) => this.notify.error('Error', err.message),
      });
    }
  }

  protected viewItemDetails(item: Departamento) {
    this.currentItem.set({ ...item });
    this.isViewing.set(true);
    this.isEditing.set(false);
    this.showForm.set(true);
  }

  protected editItem(item: Departamento) {
    this.currentItem.set({ ...item });
    this.isViewing.set(false);
    this.isEditing.set(true);
    this.showForm.set(true);
  }

  // ✏️ ESCRIBE en localStorage y navega a puestos
  protected viewPuestos(departamento: Departamento) {
    localStorage.setItem('selectedDepartamento', JSON.stringify(departamento));
    this.router.navigate(['/puestos']);
  }

  protected clearFilters() {
    this.searchTerm.set('');
  }

  protected async deleteItem(id: number) {
    if (await this.notify.confirm('¿Eliminar departamento?', 'Esta acción no se puede deshacer.')) {
      this.http.delete(`${this.apiUrl}departamentoseliminar/${id}`).subscribe({
        next: () => { this.loadItems(); this.notify.success('Éxito', 'Departamento eliminado'); },
        error: (err) => this.notify.error('Error', 'No se pudo eliminar: ' + err.message),
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
