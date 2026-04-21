USE `planillasweb`;

/* =====================================================================
   1. MODIFICACIÓN DE LA TABLA EMPLEADOS (Información Bancaria)
   ===================================================================== */
-- Si ya existen las columnas cuenta_iban y banco, comentamos estas 3 líneas:
-- ALTER TABLE `empleados` 
-- ADD COLUMN `cuenta_iban` varchar(50) DEFAULT NULL AFTER `horario_id`,
-- ADD COLUMN `banco` varchar(100) DEFAULT NULL AFTER `cuenta_iban`;

-- Desactivamos el modo seguro temporalmente para permitir actualizaciones masivas
SET SQL_SAFE_UPDATES = 0;

-- Actualizamos los empleados existentes con datos simulados realistas para Costa Rica (BAC y Nacional)
UPDATE `empleados` 
SET `banco` = IF(id % 2 = 0, 'BAC Credomatic', 'Banco Nacional de Costa Rica'),
    `cuenta_iban` = CONCAT('CR', LPAD(FLOOR(RAND() * 999999999999999999), 20, '0'))
WHERE id > 0;

-- Volvemos a activar el modo seguro
SET SQL_SAFE_UPDATES = 1;

/* =====================================================================
   2. TABLA DE MARCAS DE ASISTENCIA
   ===================================================================== */
CREATE TABLE IF NOT EXISTS `marcas_asistencia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `empleado_id` int NOT NULL,
  `fecha` date NOT NULL,
  `hora_entrada` time DEFAULT NULL,
  `hora_salida` time DEFAULT NULL,
  `estado` enum('Presente', 'Ausente', 'Llegada Tardía', 'Incapacidad', 'Vacaciones') DEFAULT 'Presente',
  PRIMARY KEY (`id`),
  KEY `empleado_id` (`empleado_id`),
  CONSTRAINT `fk_marcas_empleado` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/* =====================================================================
   3. TABLA DE AUSENCIAS E INCAPACIDADES
   ===================================================================== */
CREATE TABLE IF NOT EXISTS `ausencias_incapacidades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `empleado_id` int NOT NULL,
  `tipo` enum('Incapacidad CCSS', 'Incapacidad INS', 'Vacaciones', 'Permiso sin goce', 'Permiso con goce') NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `estado` enum('Pendiente', 'Aprobado', 'Rechazado') DEFAULT 'Pendiente',
  `observacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `empleado_id` (`empleado_id`),
  CONSTRAINT `fk_ausencias_empleado` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/* =====================================================================
   4. TABLA DE PLANILLA CALCULADA (COLILLAS DE PAGO)
   ===================================================================== */
CREATE TABLE IF NOT EXISTS `planilla_calculada` (
  `id` int NOT NULL AUTO_INCREMENT,
  `empleado_id` int NOT NULL,
  `periodo_id` int NOT NULL,
  `salario_base_periodo` decimal(12,2) NOT NULL DEFAULT '0.00',
  `total_ingresos` decimal(12,2) NOT NULL DEFAULT '0.00',
  `total_deducciones` decimal(12,2) NOT NULL DEFAULT '0.00',
  `salario_neto` decimal(12,2) NOT NULL DEFAULT '0.00',
  `fecha_calculo` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_empleado_periodo` (`empleado_id`, `periodo_id`),
  KEY `periodo_id` (`periodo_id`),
  CONSTRAINT `fk_planilla_empleado` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_planilla_periodo` FOREIGN KEY (`periodo_id`) REFERENCES `periodos_planilla` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/* =====================================================================
   5. TABLA DE PROVISIONES / ACUMULADOS
   ===================================================================== */
CREATE TABLE IF NOT EXISTS `acumulados_empleado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `empleado_id` int NOT NULL,
  `mes` int NOT NULL,
  `anio` int NOT NULL,
  `aguinaldo_acumulado` decimal(12,2) DEFAULT '0.00',
  `cesantia_acumulada` decimal(12,2) DEFAULT '0.00',
  `vacaciones_acumuladas` decimal(5,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_acumulado_mes` (`empleado_id`, `mes`, `anio`),
  CONSTRAINT `fk_acumulados_empleado` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


/* =====================================================================
   DATOS DE EJEMPLO PARA PRUEBAS
   ===================================================================== */

-- Insertar marcas de asistencia de ejemplo para el primer periodo
INSERT INTO `marcas_asistencia` (`empleado_id`, `fecha`, `hora_entrada`, `hora_salida`, `estado`)
SELECT id, '2026-02-02', '07:55:00', '17:05:00', 'Presente' FROM empleados WHERE id <= 20;

INSERT INTO `marcas_asistencia` (`empleado_id`, `fecha`, `hora_entrada`, `hora_salida`, `estado`)
SELECT id, '2026-02-03', '08:15:00', '17:00:00', 'Llegada Tardía' FROM empleados WHERE id BETWEEN 21 AND 30;

-- Insertar incapacidades / vacaciones de ejemplo
INSERT INTO `ausencias_incapacidades` (`empleado_id`, `tipo`, `fecha_inicio`, `fecha_fin`, `estado`, `observacion`) VALUES 
(2, 'Incapacidad CCSS', '2026-02-04', '2026-02-06', 'Aprobado', 'Gripe Fuerte'),
(5, 'Vacaciones', '2026-02-10', '2026-02-15', 'Aprobado', 'Viaje familiar a Guanacaste'),
(10, 'Permiso sin goce', '2026-02-05', '2026-02-05', 'Pendiente', 'Trámite personal bancario');

-- Insertar una planilla calculada ficticia para el periodo 1 (Enero) 
-- Esto simula cómo se verá la "Colilla" final tras el cálculo del motor.
INSERT INTO `planilla_calculada` (`empleado_id`, `periodo_id`, `salario_base_periodo`, `total_ingresos`, `total_deducciones`, `salario_neto`)
SELECT 
    id, 
    1, 
    salario_base, 
    (salario_base * 0.10), -- Simulando 10% de bono o ingresos
    (salario_base * 0.0967), -- Deducción de CCSS real de CR
    (salario_base + (salario_base * 0.10) - (salario_base * 0.0967))
FROM empleados WHERE id <= 10;

-- Insertar acumulados/provisiones para enero (mes 1, año 2026)
INSERT INTO `acumulados_empleado` (`empleado_id`, `mes`, `anio`, `aguinaldo_acumulado`, `cesantia_acumulada`, `vacaciones_acumuladas`)
SELECT 
    id, 
    1, 
    2026, 
    (salario_base / 12), -- Aguinaldo es aprox un salario entre 12
    (salario_base * 0.0533), -- Provisión de cesantía estándar en CR
    1.16 -- Días de vacaciones ganados por mes trabajado
FROM empleados WHERE id <= 15;
