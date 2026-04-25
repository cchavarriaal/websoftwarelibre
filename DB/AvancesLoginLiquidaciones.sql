USE `planillasweb`;

-- 1. Crear la tabla de Roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(255),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 2. Insertar los roles básicos si no existen
INSERT IGNORE INTO `roles` (id, nombre, descripcion) VALUES 
(1, 'Administrador', 'Acceso total al sistema'),
(2, 'Recursos Humanos', 'Gestión de empleados y periodos'),
(3, 'Contador', 'Gestión de cálculos y reportes bancarios'),
(4, 'Empleado', 'Acceso limitado a su propia información');

-- 3. Modificar la tabla de Usuarios para usar la relación de Roles
ALTER TABLE `usuarios` ADD COLUMN IF NOT EXISTS `rol_id` INT DEFAULT 4;
-- Mapear roles antiguos a IDs nuevos antes de poner el constraint
UPDATE `usuarios` SET `rol_id` = 1 WHERE `rol` = 'Administrador';
UPDATE `usuarios` SET `rol_id` = 2 WHERE `rol` = 'Recursos Humanos';
UPDATE `usuarios` SET `rol_id` = 3 WHERE `rol` = 'Contador';
UPDATE `usuarios` SET `rol_id` = 4 WHERE `rol` = 'Empleado' OR `rol` IS NULL;

-- 4. Crear la tabla de Liquidaciones
CREATE TABLE IF NOT EXISTS `liquidaciones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `empleado_id` INT NOT NULL,
  `fecha_salida` DATE NOT NULL,
  `motivo` ENUM('Renuncia', 'Despido con responsabilidad', 'Despido sin responsabilidad') NOT NULL,
  `monto_aguinaldo` DECIMAL(12,2) DEFAULT 0,
  `monto_vacaciones` DECIMAL(12,2) DEFAULT 0,
  `monto_preaviso` DECIMAL(12,2) DEFAULT 0,
  `monto_cesantia` DECIMAL(12,2) DEFAULT 0,
  `total_liquidacion` DECIMAL(12,2) DEFAULT 0,
  `estado` ENUM('Pendiente', 'Pagado') DEFAULT 'Pendiente',
  `fecha_creacion` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_liquidacion_empleado` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
