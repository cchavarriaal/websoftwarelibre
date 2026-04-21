import { Component, inject, signal, computed, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { NotificationService } from '../services/notification.service';

export interface Horario {
  id?: number;
  nombre: string;
  hora_entrada: string;
  hora_salida: string;
  dias_laborables: string;
}

@Component({
  selector: 'app-horarios',
  imports: [FormsModule, CommonModule],
  templateUrl: './horarios.html',
  styleUrl: './horarios.css',
})
export class Horarios implements OnInit {
  private readonly http = inject(HttpClient);
  private readonly apiUrl = 'http://localhost/horarios/';
  private readonly notify = inject(NotificationService);

  protected readonly items = signal<Horario[]>([]);
  protected readonly searchTerm = signal('');
  protected readonly filteredItems = computed(() => {
    const term = this.searchTerm().toLowerCase();
    if (!term) return this.items();
    return this.items().filter(item => 
      (item.nombre?.toLowerCase() || '').includes(term) ||
      (item.dias_laborables?.toLowerCase() || '').includes(term) ||
      (item.id?.toString() || '').includes(term)
    );
  });
  protected readonly currentItem = signal<Horario>(this.getEmptyItem());
  protected readonly isEditing = signal(false);
  protected readonly showForm = signal(false);

  ngOnInit() {
    this.loadItems();
  }

  private getEmptyItem(): Horario {
    return { nombre: '', hora_entrada: '08:00', hora_salida: '17:00', dias_laborables: 'L-V' };
  }

  protected loadItems() {
    this.http.get<Horario[]>(this.apiUrl + 'horarioslistar').subscribe({
      next: (data: any) => this.items.set(Array.isArray(data) ? data : []),
      error: (err) => this.notify.error('Error', 'Falla al cargar: ' + err.message),
    });
  }

  protected saveItem() {
    const item = this.currentItem();
    if (this.isEditing() && item.id) {
      this.http.put(`${this.apiUrl}horariosactualizar/${item.id}`, item).subscribe({
        next: () => { this.loadItems(); this.resetForm(); this.notify.success('Éxito', 'Horario actualizado'); },
        error: (err) => this.notify.error('Error', err.message),
      });
    } else {
      this.http.post(this.apiUrl + 'horarioscrear', item).subscribe({
        next: () => { this.loadItems(); this.resetForm(); this.notify.success('Éxito', 'Horario creado'); },
        error: (err) => this.notify.error('Error', err.message),
      });
    }
  }

  protected editItem(item: Horario) {
    this.currentItem.set({ ...item });
    this.isEditing.set(true);
    this.showForm.set(true);
  }

  protected async deleteItem(id: number) {
    if (await this.notify.confirm('¿Eliminar horario?', 'Esta acción no se puede deshacer.')) {
      this.http.delete(`${this.apiUrl}horarioseliminar/${id}`).subscribe({
        next: () => { this.loadItems(); this.notify.success('Éxito', 'Horario eliminado'); },
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
