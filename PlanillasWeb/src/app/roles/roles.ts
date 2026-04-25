import { Component, inject, signal, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { NotificationService } from '../services/notification.service';

@Component({
  selector: 'app-roles',
  standalone: true,
  imports: [FormsModule, CommonModule],
  templateUrl: './roles.html',
  styleUrl: './roles.css'
})
export class RolesComponent implements OnInit {
  private readonly http = inject(HttpClient);
  private readonly notify = inject(NotificationService);

  protected readonly roles = signal<any[]>([]);
  protected readonly loading = signal(false);
  protected readonly showForm = signal(false);
  protected readonly editing = signal(false);

  // Form data
  protected currentId = signal<number | null>(null);
  protected nombre = signal('');
  protected descripcion = signal('');

  ngOnInit() {
    this.loadRoles();
  }

  loadRoles() {
    this.loading.set(true);
    this.http.get<any[]>('http://localhost/roles/listar').subscribe({
      next: (data) => {
        this.roles.set(data);
        this.loading.set(false);
      },
      error: (err) => {
        this.notify.error('Error', 'No se pudieron cargar los roles');
        this.loading.set(false);
      }
    });
  }

  abrirForm(rol?: any) {
    if (rol) {
      this.editing.set(true);
      this.currentId.set(rol.id);
      this.nombre.set(rol.nombre);
      this.descripcion.set(rol.descripcion);
    } else {
      this.reset();
    }
    this.showForm.set(true);
  }

  guardar() {
    if (!this.nombre()) {
      this.notify.info('Atención', 'El nombre es obligatorio');
      return;
    }

    const data = {
      nombre: this.nombre(),
      descripcion: this.descripcion()
    };

    if (this.editing()) {
      this.http.put(`http://localhost/roles/actualizar/${this.currentId()}`, data).subscribe({
        next: () => {
          this.notify.success('Éxito', 'Rol actualizado');
          this.finalizarForm();
        },
        error: (err) => this.notify.error('Error', 'No se pudo actualizar')
      });
    } else {
      this.http.post('http://localhost/roles/crear', data).subscribe({
        next: () => {
          this.notify.success('Éxito', 'Rol creado');
          this.finalizarForm();
        },
        error: (err) => this.notify.error('Error', 'No se pudo crear')
      });
    }
  }

  eliminar(id: number) {
    if (confirm('¿Está seguro de eliminar este rol?')) {
      this.http.delete(`http://localhost/roles/eliminar/${id}`).subscribe({
        next: () => {
          this.notify.success('Éxito', 'Rol eliminado');
          this.loadRoles();
        },
        error: (err) => this.notify.error('Error', err.error?.error || 'No se pudo eliminar')
      });
    }
  }

  finalizarForm() {
    this.showForm.set(false);
    this.loadRoles();
    this.reset();
  }

  reset() {
    this.editing.set(false);
    this.currentId.set(null);
    this.nombre.set('');
    this.descripcion.set('');
  }
}
