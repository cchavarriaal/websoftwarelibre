import { Component, signal, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Router, RouterLink } from '@angular/router';

// Reutilizamos la misma interfaz de empleado
interface Empleado {
  id?: number;
  codigo_empleado: string;
  nombre: string;
  apellido: string;
  dni: string;
  fecha_ingreso: string;
  salario_base: number;
  puesto_nombre?: string;
  horario_nombre?: string;
  cuenta_iban?: string;
  banco?: string;
}

@Component({
  selector: 'app-detalle-empleado',
  imports: [CommonModule, RouterLink],
  templateUrl: './detalle-empleado.html',
  styleUrl: './detalle-empleado.css',
})
export class DetalleEmpleado implements OnInit {
  // Signal que guardará el empleado leído desde localStorage
  protected readonly empleado = signal<Empleado | null>(null);

  constructor(private router: Router) {}

  ngOnInit() {
    // Al iniciar la página, leemos el dato del localStorage
    this.loadFromLocalStorage();
  }

  // 📖 LEE el empleado guardado desde localStorage
  protected loadFromLocalStorage() {
    const data = localStorage.getItem('selectedEmpleado');
    if (data) {
      // El dato se guardó como JSON, así que lo parseamos
      this.empleado.set(JSON.parse(data));
    }
  }

  // 🗑️ BORRA el empleado del localStorage y limpia el signal
  protected clearStorage() {
    localStorage.removeItem('selectedEmpleado');
    this.empleado.set(null);
  }

  // Vuelve a la lista y limpia el storage
  protected volver() {
    this.clearStorage();
    this.router.navigate(['/empleados']);
  }
}
