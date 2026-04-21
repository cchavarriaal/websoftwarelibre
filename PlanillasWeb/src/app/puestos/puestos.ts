import { Component, inject, signal, computed, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { NotificationService } from '../services/notification.service';

export interface Puesto {
  id?: number;
  nombre: string;
  salario_base_sugerido?: number;
  departamento_id?: number;
  departamento_nombre?: string;
}

@Component({
  selector: 'app-puestos',
  imports: [FormsModule, CommonModule],
  templateUrl: './puestos.html',
  styleUrl: './puestos.css',
})
export class Puestos implements OnInit {
  private readonly http = inject(HttpClient);
  private readonly apiUrl = 'http://localhost/puestos/';
  private readonly notify = inject(NotificationService);

  protected readonly items = signal<Puesto[]>([]);
  protected readonly searchTerm = signal('');
  protected readonly filteredItems = computed(() => {
    const term = this.searchTerm().toLowerCase();
    if (!term) return this.items();
    return this.items().filter(item => 
      (item.nombre?.toLowerCase() || '').includes(term) ||
      (item.departamento_nombre?.toLowerCase() || '').includes(term) ||
      (item.id?.toString() || '').includes(term)
    );
  });
  protected readonly currentItem = signal<Puesto>(this.getEmptyItem());
  protected readonly departamentos = signal<any[]>([]);
  protected readonly isEditing = signal(false);
  protected readonly showForm = signal(false);

  ngOnInit() {
    this.loadItems();
    this.loadDepartamentos();
    this.loadFromLocalStorage();
  }

  protected loadFromLocalStorage() {
    const data = localStorage.getItem('selectedDepartamento');
    if (data) {
      const departamento = JSON.parse(data);
      this.searchTerm.set(departamento.nombre);
      this.currentItem.update(item => ({ ...item, departamento_id: departamento.id }));
    }
  }

  protected clearStorage() {
    localStorage.removeItem('selectedDepartamento');
    this.searchTerm.set('');
  }

  protected loadDepartamentos() {
    this.http.get<any[]>('http://localhost/departamentos/departamentoslistar').subscribe({
      next: (data: any) => this.departamentos.set(Array.isArray(data) ? data : [])
    });
  }

  private getEmptyItem(): Puesto {
    return { nombre: '', salario_base_sugerido: 0, departamento_id: undefined };
  }

  protected loadItems() {
    this.http.get<Puesto[]>(this.apiUrl + 'puestoslistar').subscribe({
      next: (data: any) => this.items.set(Array.isArray(data) ? data : []),
      error: (err) => this.notify.error('Error', 'Falla al cargar: ' + err.message),
    });
  }

  protected saveItem() {
    const item = this.currentItem();
    if (item.departamento_id === '' as any) item.departamento_id = undefined;

    if (this.isEditing() && item.id) {
      this.http.put(`${this.apiUrl}puestosactualizar/${item.id}`, item).subscribe({
        next: () => { this.loadItems(); this.resetForm(); this.notify.success('Éxito', 'Puesto actualizado'); },
        error: (err) => this.notify.error('Error', err.message),
      });
    } else {
      this.http.post(this.apiUrl + 'puestoscrear', item).subscribe({
        next: () => { this.loadItems(); this.resetForm(); this.notify.success('Éxito', 'Puesto creado'); },
        error: (err) => this.notify.error('Error', err.message),
      });
    }
  }

  protected editItem(item: Puesto) {
    this.currentItem.set({ ...item });
    this.isEditing.set(true);
    this.showForm.set(true);
  }

  protected async deleteItem(id: number) {
    if (await this.notify.confirm('¿Eliminar puesto?', 'Esta acción no se puede deshacer.')) {
      this.http.delete(`${this.apiUrl}puestoseliminar/${id}`).subscribe({
        next: () => { this.loadItems(); this.notify.success('Éxito', 'Puesto eliminado'); },
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
