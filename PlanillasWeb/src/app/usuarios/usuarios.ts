import { Component, inject, signal, computed, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { NotificationService } from '../services/notification.service';

import { CommonModule } from '@angular/common';

interface Usuario {
  id?: number;
  username: string;
  password_hash?: string;
  rol_id: number;
  rol_nombre?: string;
  empleado_id?: number | null;
  empleado_nombre?: string;
  estado: number;
  pregunta_seguridad?: string;
  respuesta_seguridad?: string;
  crear_empleado?: boolean;
}

@Component({
  selector: 'app-usuarios',
  imports: [FormsModule, CommonModule],
  templateUrl: './usuarios.html',
  styleUrl: './usuarios.css',
})
export class Usuarios implements OnInit {
  private readonly http = inject(HttpClient);
  private readonly apiUrl = 'http://localhost/usuarios/';

  protected readonly usuarios = signal<Usuario[]>([]);
  protected readonly searchTerm = signal('');
  protected readonly filterEstado = signal<string>('all');
  protected readonly filterRol = signal<string>('all');
  protected readonly showFilters = signal(false);
  
  protected readonly filteredUsuarios = computed(() => {
    const term = this.searchTerm().toLowerCase();
    const estado = this.filterEstado();
    const rol = this.filterRol();

    return this.usuarios().filter(u => {
      const matchTerm = !term || 
        (u.username?.toLowerCase() || '').includes(term) ||
        (u.rol_nombre?.toLowerCase() || '').includes(term) ||
        (u.empleado_nombre?.toLowerCase() || '').includes(term);

      const matchEstado = estado === 'all' || u.estado === parseInt(estado, 10);
      const matchRol = rol === 'all' || u.rol_nombre === rol;

      return matchTerm && matchEstado && matchRol;
    });
  });

  protected readonly rolesList = signal<any[]>([]);
  protected readonly empleados = signal<any[]>([]);

  protected clearFilters() {
    this.searchTerm.set('');
    this.filterEstado.set('all');
    this.filterRol.set('all');
  }
  protected readonly currentUsuario = signal<Usuario>(this.getEmptyUsuario());
  protected readonly isEditing = signal(false);
  protected readonly isViewing = signal(false);
  protected readonly showForm = signal(false);
  protected readonly crearEmpleado = signal(false);
  protected readonly dniEmpleado = signal('');
  protected readonly nombreEmpleado = signal('');
  protected readonly apellidoEmpleado = signal('');
  protected readonly selectedEmpleadoFull = computed(() => {
    const user = this.currentUsuario();
    if (!user.empleado_id) return null;
    return this.empleados().find(e => e.id === user.empleado_id);
  });
  private readonly notify = inject(NotificationService);

  ngOnInit() {
    this.loadFromLocalStorage();
    this.loadUsuarios();
    this.loadEmpleados();
    this.loadRoles();
  }

  protected loadRoles() {
    this.http.get<any[]>('http://localhost/roles/listar').subscribe({
      next: (data) => this.rolesList.set(data)
    });
  }

  private loadFromLocalStorage() {
    const cached = localStorage.getItem('usuarios_cache');
    if (cached) {
      try {
        this.usuarios.set(JSON.parse(cached));
      } catch (e) {
        console.error('Error parsing localStorage', e);
      }
    }
  }

  protected loadEmpleados() {
    this.http.get<any[]>('http://localhost/empleados/empleadoslistar').subscribe({
      next: (data: any) => this.empleados.set(Array.isArray(data) ? data : [])
    });
  }

  private getEmptyUsuario(): Usuario {
    return {
      username: '',
      password_hash: '',
      rol_id: 4, // Empleado por defecto
      estado: 1,
      pregunta_seguridad: '',
      respuesta_seguridad: ''
    };
  }

  protected loadUsuarios() {
    this.http.get<Usuario[]>(this.apiUrl + 'usuarioslistar').subscribe({
      next: (data: any) => {
        if (data && data.error) { this.notify.error('Error', data.error); }
        const userList = Array.isArray(data) ? data : [];
        this.usuarios.set(userList);
        localStorage.setItem('usuarios_cache', JSON.stringify(userList));
      },
      error: (err) => this.notify.error('Error', 'Falla de API: ' + err.message),
    });
  }

  protected saveUsuario() {
    const usuario = this.currentUsuario();
    if (usuario.empleado_id === '' as any) usuario.empleado_id = undefined;

    // Agregar el flag de crear empleado al payload
    usuario.crear_empleado = this.crearEmpleado();
    (usuario as any).dni_empleado = this.dniEmpleado();
    (usuario as any).nombre_empleado = this.nombreEmpleado();
    (usuario as any).apellido_empleado = this.apellidoEmpleado();

    if (this.isEditing() && usuario.id) {
      this.http.put(`${this.apiUrl}usuariosactualizar/${usuario.id}`, usuario).subscribe({
        next: (res: any) => {
          if (res && res.error) { this.notify.error('Error', res.error); return; }
          this.loadUsuarios();
          this.resetForm();
          this.notify.success('Éxito', 'Usuario actualizado correctamente');
        },
        error: (err) => this.notify.error('Error', err.message),
      });
    } else {
      this.http.post(this.apiUrl + 'usuarioscrear', usuario).subscribe({
        next: (res: any) => {
          if (res && res.error) { this.notify.error('Error', res.error); return; }
          this.loadUsuarios();
          this.resetForm();
          this.notify.success('Éxito', 'Usuario creado correctamente');
        },
        error: (err) => this.notify.error('Error', err.message),
      });
    }
  }

  protected editUsuario(usuario: Usuario) {
    this.currentUsuario.set({ ...usuario, password_hash: '' });
    this.isEditing.set(true);
    this.isViewing.set(false);
    this.showForm.set(true);
  }

  protected viewUsuarioDetails(usuario: Usuario) {
    this.currentUsuario.set(usuario);
    this.isEditing.set(false);
    this.isViewing.set(true);
    this.showForm.set(true);
  }

  protected async deleteUsuario(id: number) {
    const confirmed = await this.notify.confirm('¿Eliminar Usuario?', 'Esta acción no se puede deshacer.');
    if (confirmed) {
      this.http.delete(`${this.apiUrl}usuarioseliminar/${id}`).subscribe({
        next: (res: any) => {
          if (res && res.error) { this.notify.error('Error', res.error); return; }
          this.loadUsuarios();
          this.notify.success('Eliminado', 'El usuario ha sido eliminado.');
        },
        error: (err) => this.notify.error('Error', err.message),
      });
    }
  }

  protected resetForm() {
    this.currentUsuario.set(this.getEmptyUsuario());
    this.isEditing.set(false);
    this.isViewing.set(false);
    this.showForm.set(false);
    this.crearEmpleado.set(false);
    this.showFilters.set(false);
    this.dniEmpleado.set('');
    this.nombreEmpleado.set('');
    this.apellidoEmpleado.set('');
  }

  protected async generarEmpleado() {
    const usuario = this.currentUsuario();
    if (!usuario.id) return;

    const confirmed = await this.notify.confirm(
      '¿Generar Empleado?',
      `Se creará un registro de empleado vinculado al usuario "${usuario.username}". ¿Desea continuar?`
    );
    if (!confirmed) return;

    this.http.post(`${this.apiUrl}generarEmpleado/${usuario.id}`, { 
      dni: this.dniEmpleado(),
      nombre: this.nombreEmpleado(),
      apellido: this.apellidoEmpleado()
    }).subscribe({
      next: (res: any) => {
        if (res && res.error) { this.notify.error('Error', res.error); return; }
        this.notify.success('Éxito', 'Empleado generado y vinculado correctamente.');
        this.loadUsuarios();
        this.loadEmpleados();
        // Actualizar el usuario actual con el nuevo empleado_id
        this.currentUsuario.set({ ...usuario, empleado_id: res.empleado_id });
      },
      error: (err) => this.notify.error('Error', err.message),
    });
  }

  protected toggleCrearEmpleado(event: Event) {
    const checkbox = event.target as HTMLInputElement;
    this.crearEmpleado.set(checkbox.checked);
  }

  protected createNew() {
    this.resetForm();
    this.showForm.set(true);
  }

  protected toggleEstado(event: Event) {
    const checkbox = event.target as HTMLInputElement;
    const currentUser = this.currentUsuario();
    this.currentUsuario.set({ ...currentUser, estado: checkbox.checked ? 1 : 0 });
  }
}
