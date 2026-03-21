-- ==========================================================
-- SCRIPT DE ACTUALIZACIÓN: AGREGAR MÓDULO DE HORARIOS
-- Base de Datos: planillasweb
-- ==========================================================

-- 1. Crear la tabla de horarios
CREATE TABLE IF NOT EXISTS `horarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `hora_entrada` time NOT NULL,
  `hora_salida` time NOT NULL,
  `dias_laborables` varchar(50) DEFAULT 'L-V',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 2. Insertar algunos horarios comunes (Datos Maestros Básicos)
INSERT INTO `horarios` (`nombre`, `hora_entrada`, `hora_salida`, `dias_laborables`) VALUES
('Diurno Ordinario', '08:00:00', '17:00:00', 'L-V'),
('Nocturno Fijo', '22:00:00', '06:00:00', 'L-V'),
('Jornada Continua / Call Center', '06:00:00', '14:00:00', 'L-S'),
('Medio Tiempo', '08:00:00', '12:00:00', 'L-S');

-- 3. Agregar la columna 'horario_id' a la tabla 'empleados'
ALTER TABLE `empleados` 
ADD COLUMN `horario_id` int DEFAULT NULL AFTER `puesto_id`;

-- 4. Crear la restricción de Llave Foránea para vincular Empleados -> Horarios
ALTER TABLE `empleados`
ADD CONSTRAINT `fk_empleado_horario` 
FOREIGN KEY (`horario_id`) REFERENCES `horarios` (`id`) ON DELETE SET NULL;

-- 5. Opcional: Asignar el Horario Diurno (ID 1) por defecto a todos los empleados que ya tenías guardados
UPDATE `empleados` SET `horario_id` = 1 WHERE `horario_id` IS NULL;
