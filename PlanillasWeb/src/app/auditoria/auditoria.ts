import { Component, inject, signal, computed, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { NotificationService } from '../services/notification.service';

export interface IAuditoria {
  id: number;
  usuario_id?: number;
  tabla_afectada: string;
  registro_id: number;
  accion: string;
  valor_anterior?: string;
  valor_nuevo?: string;
  fecha_hora: string;
}

@Component({
  selector: 'app-auditoria',
  imports: [FormsModule, CommonModule],
  templateUrl: './auditoria.html',
  styleUrl: './auditoria.css',
})
export class Auditoria implements OnInit {
  private readonly http = inject(HttpClient);
  private readonly apiUrl = 'http://localhost/auditoria/';
  private readonly notify = inject(NotificationService);

  protected readonly items = signal<IAuditoria[]>([]);
  protected readonly searchTerm = signal('');
  protected readonly filterAccion = signal<string | 'all'>('all');
  protected readonly isViewing = signal(false);
  protected readonly currentItem = signal<IAuditoria | null>(null);
  protected readonly showFilters = signal(false);

  protected readonly filteredItems = computed(() => {
    let list = this.items();
    const term = this.searchTerm().toLowerCase();
    const accion = this.filterAccion();

    if (term) {
      list = list.filter(item => 
        (item.tabla_afectada?.toLowerCase() || '').includes(term) ||
        (item.accion?.toLowerCase() || '').includes(term) ||
        (item.registro_id?.toString() || '').includes(term)
      );
    }

    if (accion !== 'all') {
      list = list.filter(item => item.accion === accion);
    }

    return list;
  });

  ngOnInit() {
    this.loadItems();
  }

  protected loadItems() {
    this.http.get<IAuditoria[]>(this.apiUrl + 'auditorialistar').subscribe({
      next: (data: any) => this.items.set(Array.isArray(data) ? data : []),
      error: (err) => this.notify.error('Error de Auditoría', 'No se pudieron cargar los registros: ' + err.message),
    });
  }

  private safeParse(value: any): any {
    if (!value) return null;
    if (typeof value === 'object') return value;
    try {
      return JSON.parse(value);
    } catch {
      return value; // Si falla el parseo, retorna el string original
    }
  }

  protected viewItemDetails(item: IAuditoria) {
    this.currentItem.set(item);
    this.isViewing.set(true);
  }

  protected closeDetails() {
    this.isViewing.set(false);
    this.currentItem.set(null);
    this.showFilters.set(false);
  }

  protected clearFilters() {
    this.searchTerm.set('');
    this.filterAccion.set('all');
  }

  protected formatJson(value: any): string {
    const parsed = this.safeParse(value);
    return JSON.stringify(parsed, null, 2);
  }
}
