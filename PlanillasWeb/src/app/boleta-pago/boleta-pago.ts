import { Component, inject, signal, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { CommonModule } from '@angular/common';
import { NotificationService } from '../services/notification.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-boleta-pago',
  imports: [CommonModule],
  templateUrl: './boleta-pago.html',
  styleUrl: './boleta-pago.css',
})
export class BoletaPago implements OnInit {
  private readonly http = inject(HttpClient);
  private readonly notify = inject(NotificationService);
  private readonly router = inject(Router);

  protected readonly boleta = signal<any>(null);
  protected readonly loading = signal(false);

  ngOnInit() {
    const id = localStorage.getItem('selectedBoletaId');
    if (id) {
      this.loadBoleta(parseInt(id));
    } else {
      this.router.navigate(['/resultados-planilla']);
    }
  }

  loadBoleta(id: number) {
    this.loading.set(true);
    this.http.get<any>(`http://localhost/planilla/boleta/${id}`).subscribe({
      next: (data) => {
        this.boleta.set(data);
        this.loading.set(false);
      },
      error: (err) => {
        this.notify.error('Error', 'No se pudo cargar la boleta: ' + err.message);
        this.loading.set(false);
      }
    });
  }

  imprimir() {
    window.print();
  }

  volver() {
    localStorage.removeItem('selectedBoletaId');
    this.router.navigate(['/resultados-planilla']);
  }
}
