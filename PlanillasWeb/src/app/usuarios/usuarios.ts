import { Component, inject, signal, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { FormsModule } from '@angular/forms';

interface Usuario {
  id?: number;
  username: string;
  password_hash?: string;
  rol: string;
  empleado_id?: number;
  estado: number;
  pregunta_seguridad?: string;
  respuesta_seguridad?: string;
}

@Component({
  selector: 'app-usuarios',
  imports: [FormsModule],
  templateUrl: './usuarios.html',
  styleUrl: './usuarios.css',
})
export class Usuarios implements OnInit {
  private readonly http = inject(HttpClient);
  private readonly apiUrl = 'http://localhost/usuarios/';

  protected readonly usuarios = signal<Usuario[]>([]);
  protected readonly currentUsuario = signal<Usuario>(this.getEmptyUsuario());
  protected readonly isEditing = signal(false);

  ngOnInit() {
    this.loadUsuarios();
  }

  private getEmptyUsuario(): Usuario {
    return {
      username: '',
      password_hash: '',
      rol: 'Empleado',
      estado: 1,
      pregunta_seguridad: '',
      respuesta_seguridad: ''
    };
  }

  protected loadUsuarios() {
    this.http.get<Usuario[]>(this.apiUrl + 'usuarioslistar').subscribe({
      next: (data: any) => {
        if (data && data.error) { alert('Error BD: ' + data.error); }
        this.usuarios.set(Array.isArray(data) ? data : []);
      },
      error: (err) => alert('Error cargando la lista (Posible falla de API): ' + err.message),
    });
  }

  protected saveUsuario() {
    const usuario = this.currentUsuario();
    // Normalizar a null los campos vacíos
    if (usuario.empleado_id === '' as any) usuario.empleado_id = undefined;

    if (this.isEditing() && usuario.id) {
      this.http.put(`${this.apiUrl}usuariosactualizar/${usuario.id}`, usuario).subscribe({
        next: (res: any) => {
          if (res && res.error) { alert('Error del servidor: ' + res.error); return; }
          this.loadUsuarios();
          this.resetForm();
          alert('Actualizado correctamente');
        },
        error: (err) => alert('Error de Red/HTTP (Actualizar): ' + err.message),
      });
    } else {
      this.http.post(this.apiUrl + 'usuarioscrear', usuario).subscribe({
        next: (res: any) => {
          if (res && res.error) { alert('Error del servidor: ' + res.error); return; }
          this.loadUsuarios();
          this.resetForm();
          alert('Creado correctamente');
        },
        error: (err) => alert('Error de Red/HTTP (Crear): ' + err.message),
      });
    }
  }

  protected editUsuario(usuario: Usuario) {
    this.currentUsuario.set({ ...usuario, password_hash: '' });
    this.isEditing.set(true);
  }

  protected deleteUsuario(id: number) {
    if (confirm('¿Estás seguro de eliminar este usuario?')) {
      this.http.delete(`${this.apiUrl}usuarioseliminar/${id}`).subscribe({
        next: (res: any) => {
          if (res && res.error) { alert('Error: ' + res.error); return; }
          this.loadUsuarios();
          alert('Eliminado');
        },
        error: (err) => alert('Error de Red/HTTP (Eliminar): ' + err.message),
      });
    }
  }

  protected resetForm() {
    this.currentUsuario.set(this.getEmptyUsuario());
    this.isEditing.set(false);
  }

  protected toggleEstado(event: Event) {
    const checkbox = event.target as HTMLInputElement;
    const currentUser = this.currentUsuario();
    this.currentUsuario.set({ ...currentUser, estado: checkbox.checked ? 1 : 0 });
  }
}
