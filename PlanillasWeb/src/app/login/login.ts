import { Component, inject, signal } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { AuthService } from '../services/auth.service';
import { Router } from '@angular/router';
import { NotificationService } from '../services/notification.service';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [FormsModule, CommonModule],
  templateUrl: './login.html',
  styleUrl: './login.css'
})
export class Login {
  private readonly auth = inject(AuthService);
  private readonly router = inject(Router);
  private readonly notify = inject(NotificationService);

  protected username = signal('');
  protected password = signal('');
  protected loading = signal(false);

  onSubmit() {
    if (!this.username() || !this.password()) {
      this.notify.info('Campos Requeridos', 'Por favor ingrese su usuario y contraseña');
      return;
    }

    this.loading.set(true);
    this.auth.login(this.username(), this.password()).subscribe({
      next: (res) => {
        if (res && res.token) {
          this.notify.success('Bienvenido', `Hola ${res.username}, has iniciado sesión como ${res.rol}`);
          this.router.navigate(['/']);
        } else {
          this.notify.error('Error', 'Credenciales inválidas');
        }
        this.loading.set(false);
      },
      error: (err) => {
        this.notify.error('Error de Conexión', 'No se pudo conectar con el servidor');
        this.loading.set(false);
      }
    });
  }
}
