import { Injectable, signal, inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { tap } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private readonly http = inject(HttpClient);
  private readonly router = inject(Router);
  private readonly apiUrl = 'http://localhost/usuarios/';

  // Signals para el estado del usuario
  public readonly currentUser = signal<any>(null);
  public readonly isAuthenticated = signal<boolean>(false);

  constructor() {
    this.checkSession();
  }

  login(username: string, password_hash: string) {
    return this.http.post<any>(this.apiUrl + 'autenticar', { username, password_hash }).pipe(
      tap(res => {
        if (res && res.token) {
          localStorage.setItem('auth_token', res.token);
          localStorage.setItem('user_data', JSON.stringify(res));
          this.currentUser.set(res);
          this.isAuthenticated.set(true);
        }
      })
    );
  }

  logout() {
    const user = this.currentUser();
    if (user) {
      this.http.post(this.apiUrl + 'desautenticar', { username: user.username }).subscribe();
    }
    localStorage.removeItem('auth_token');
    localStorage.removeItem('user_data');
    this.currentUser.set(null);
    this.isAuthenticated.set(false);
    this.router.navigate(['/login']);
  }

  private checkSession() {
    const token = localStorage.getItem('auth_token');
    const userData = localStorage.getItem('user_data');
    if (token && userData) {
      this.currentUser.set(JSON.parse(userData));
      this.isAuthenticated.set(true);
    }
  }

  // Helper para saber si es admin
  isAdmin() {
    return this.currentUser()?.rol === 'Administrador';
  }

  // Helper para saber si es empleado
  isEmployee() {
    return this.currentUser()?.rol === 'Empleado';
  }

  getEmpleadoId() {
    return this.currentUser()?.empleado_id;
  }
}
