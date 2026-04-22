import { Component, inject, signal, OnInit } from '@angular/core';
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

  protected viewJson(item: IAuditoria) {
    try {
      const oldV = this.safeParse(item.valor_anterior);
      const newV = this.safeParse(item.valor_nuevo);
      
      const details = `Anterior:\n${JSON.stringify(oldV, null, 2)}\n\nNuevo:\n${JSON.stringify(newV, null, 2)}`;
      
      // Use success popup as an info dialog
      this.notify.success('Detalles del Registro', details);
    } catch (e: any) {
      this.notify.error('Error de visualización', 'No se pudieron procesar los detalles: ' + e.message);
    }
  }
}
