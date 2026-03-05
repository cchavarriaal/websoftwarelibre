-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: planillasweb
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auditoria`
--

DROP TABLE IF EXISTS `auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int DEFAULT NULL,
  `tabla_afectada` varchar(50) DEFAULT NULL,
  `registro_id` int DEFAULT NULL,
  `accion` enum('INSERT','UPDATE','DELETE') DEFAULT NULL,
  `valor_anterior` json DEFAULT NULL,
  `valor_nuevo` json DEFAULT NULL,
  `fecha_hora` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria`
--

LOCK TABLES `auditoria` WRITE;
/*!40000 ALTER TABLE `auditoria` DISABLE KEYS */;
INSERT INTO `auditoria` (`id`, `usuario_id`, `tabla_afectada`, `registro_id`, `accion`, `valor_anterior`, `valor_nuevo`, `fecha_hora`) VALUES (1,26,'empleados',21,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(2,45,'empleados',39,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(3,56,'empleados',20,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(4,4,'empleados',70,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(5,34,'empleados',20,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(6,27,'empleados',26,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(7,57,'empleados',76,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(8,47,'empleados',74,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(9,54,'empleados',61,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(10,54,'empleados',68,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(11,23,'empleados',11,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(12,9,'empleados',90,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(13,31,'empleados',6,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(14,66,'empleados',15,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(15,36,'empleados',5,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(16,61,'empleados',10,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(17,64,'empleados',65,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(18,37,'empleados',39,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(19,30,'empleados',58,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(20,37,'empleados',81,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(21,57,'empleados',79,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(22,28,'empleados',22,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(23,50,'empleados',14,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(24,45,'empleados',34,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(25,19,'empleados',9,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(26,33,'empleados',49,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(27,35,'empleados',38,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(28,46,'empleados',50,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(29,1,'empleados',91,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(30,29,'empleados',87,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(31,34,'empleados',99,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(32,65,'empleados',90,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(33,27,'empleados',29,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(34,68,'empleados',49,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(35,23,'empleados',74,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(36,67,'empleados',21,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(37,10,'empleados',58,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(38,70,'empleados',94,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(39,13,'empleados',31,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(40,28,'empleados',30,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(41,9,'empleados',24,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(42,39,'empleados',15,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(43,32,'empleados',81,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(44,28,'empleados',80,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(45,71,'empleados',76,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(46,35,'empleados',9,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(47,56,'empleados',14,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(48,68,'empleados',2,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(49,34,'empleados',36,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(50,55,'empleados',12,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(51,36,'empleados',12,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(52,26,'empleados',65,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(53,62,'empleados',23,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(54,47,'empleados',66,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(55,13,'empleados',21,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(56,17,'empleados',95,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(57,70,'empleados',63,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(58,42,'empleados',46,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(59,1,'empleados',44,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(60,23,'empleados',67,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(61,65,'empleados',82,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(62,6,'empleados',78,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(63,58,'empleados',21,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(64,52,'empleados',25,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(65,70,'empleados',9,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(66,40,'empleados',94,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(67,19,'empleados',9,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(68,45,'empleados',63,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(69,55,'empleados',92,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(70,14,'empleados',93,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(71,6,'empleados',40,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(72,55,'empleados',15,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(73,64,'empleados',16,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(74,25,'empleados',80,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(75,33,'empleados',77,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(76,75,'empleados',84,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(77,13,'empleados',91,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(78,56,'empleados',1,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(79,27,'empleados',74,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(80,42,'empleados',54,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(81,41,'empleados',17,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(82,41,'empleados',37,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(83,3,'empleados',81,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(84,55,'empleados',79,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(85,34,'empleados',81,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(86,21,'empleados',87,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(87,3,'empleados',59,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(88,26,'empleados',31,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(89,53,'empleados',43,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(90,3,'empleados',12,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(91,22,'empleados',32,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(92,2,'empleados',26,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(93,13,'empleados',86,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(94,37,'empleados',33,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(95,9,'empleados',56,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(96,1,'empleados',17,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(97,26,'empleados',28,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(98,66,'empleados',41,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(99,39,'empleados',5,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(100,22,'empleados',84,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(101,NULL,'empleados',1,'UPDATE','{\"salario\": 2017237.20}','{\"salario\": 800000.00}','2026-02-07 01:28:15');
/*!40000 ALTER TABLE `auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conceptos`
--

DROP TABLE IF EXISTS `conceptos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conceptos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `tipo` enum('Ingreso','Deduccion') NOT NULL,
  `es_ley` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conceptos`
--

LOCK TABLES `conceptos` WRITE;
/*!40000 ALTER TABLE `conceptos` DISABLE KEYS */;
INSERT INTO `conceptos` (`id`, `nombre`, `tipo`, `es_ley`) VALUES (1,'C.C.S.S. (9.67%)','Deduccion',1),(2,'Impuesto sobre la Renta','Deduccion',1),(3,'Asociación Solidarista','Deduccion',0),(4,'Horas Extra Dobles','Ingreso',0),(5,'Anualidad','Ingreso',0),(6,'Bono por Conectividad','Ingreso',0),(7,'Comisiones sobre Ventas','Ingreso',0),(8,'Bono por Productividad','Ingreso',0),(9,'Auxilio de Transporte','Ingreso',0),(10,'Pago de Viáticos (Gravables)','Ingreso',0),(11,'Reconocimiento por Antigüedad','Ingreso',0),(12,'Incentivo por Idiomas','Ingreso',0),(13,'Ajuste Salarial Retroactivo','Ingreso',0),(14,'Embargo Judicial (Alimentario)','Deduccion',1),(15,'Embargo Judicial (Comercial)','Deduccion',1),(16,'Cuota Asociación Solidarista','Deduccion',0),(17,'Aporte a Cooperativa','Deduccion',0),(18,'Seguro de Vida Colectivo','Deduccion',0),(19,'Préstamo Asociación/Caja','Deduccion',0),(20,'Deducción por Llegada Tardía','Deduccion',0);
/*!40000 ALTER TABLE `conceptos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` (`id`, `nombre`) VALUES (1,'Gerencia General'),(2,'TI'),(3,'Recursos Humanos'),(4,'Contabilidad'),(5,'Ventas'),(6,'Operaciones'),(7,'Logística'),(8,'Legal'),(9,'Mantenimiento'),(10,'Mercadeo'),(11,'Servicio al Cliente'),(12,'Calidad'),(13,'Seguridad'),(14,'Compras'),(15,'Salud Ocupacional'),(16,'I+D'),(17,'Proyectos'),(18,'Auditoría'),(19,'Tesorería'),(20,'Bodega');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo_empleado` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `dni` varchar(20) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `salario_base` decimal(12,2) NOT NULL,
  `puesto_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo_empleado` (`codigo_empleado`),
  UNIQUE KEY `dni` (`dni`),
  KEY `puesto_id` (`puesto_id`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`puesto_id`) REFERENCES `puestos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` (`id`, `codigo_empleado`, `nombre`, `apellido`, `dni`, `fecha_ingreso`, `salario_base`, `puesto_id`) VALUES (1,'EMP-2026001','Mario','Chaves Rojas','5-2058-4208','2022-02-06',800000.00,2),(2,'EMP-2026002','Esteban','Ramírez','5-4973-0821','2018-07-22',934693.38,6),(3,'EMP-2026003','Julia','Pérez','2-6178-5547','2018-07-17',993740.55,6),(4,'EMP-2026004','Julia','Pérez','8-3511-2379','2024-12-24',1596796.54,5),(5,'EMP-2026005','Esteban','González','2-0694-9548','2021-06-14',746604.21,11),(6,'EMP-2026006','Beatriz','Castro','7-0463-1908','2019-05-28',1000427.16,12),(7,'EMP-2026007','Andrés','Pérez','5-8658-9408','2025-03-23',1871169.72,3),(8,'EMP-2026008','Carlos','Mora','7-7414-4869','2024-05-17',709023.57,11),(9,'EMP-2026009','Diana','Pérez','1-4891-2127','2021-03-16',484321.32,8),(10,'EMP-2026010','Julia','Jiménez','6-2896-5005','2020-11-23',1866807.40,7),(11,'EMP-2026011','Esteban','Sánchez','9-5842-1634','2025-07-28',2083261.69,4),(12,'EMP-2026012','Julia','Rojas','6-7315-9772','2020-06-02',502761.15,13),(13,'EMP-2026013','Fabiana','González','2-0696-9432','2021-12-06',2070953.61,4),(14,'EMP-2026014','Andrés','Blanco','1-2206-0080','2022-12-30',986725.05,6),(15,'EMP-2026015','Carlos','Ramírez','1-8261-8510','2019-09-21',1133066.54,9),(16,'EMP-2026016','Diana','Jiménez','9-9188-8362','2022-08-12',1011492.52,12),(17,'EMP-2026017','Iván','Sánchez','3-7813-2139','2020-02-22',1898577.63,3),(18,'EMP-2026018','Hellen','Pérez','6-0531-5261','2022-03-25',527866.22,8),(19,'EMP-2026019','Esteban','Mora','8-6679-7959','2018-01-31',1549280.96,5),(20,'EMP-2026020','Fabiana','Sánchez','3-9908-1714','2018-11-02',1890874.82,7),(21,'EMP-2026021','Iván','Castro','1-3090-3047','2021-03-14',856902.40,14),(22,'EMP-2026022','Fabiana','Vargas','4-8861-3251','2018-02-27',1186059.79,9),(23,'EMP-2026023','Esteban','Ramírez','4-0140-0549','2024-03-11',1199826.05,9),(24,'EMP-2026024','Carlos','Ramírez','9-6608-3550','2019-08-04',1789916.35,15),(25,'EMP-2026025','Beatriz','Pérez','8-4008-4636','2025-02-25',3518698.66,1),(26,'EMP-2026026','Fabiana','Rojas','1-2809-3560','2018-05-27',511958.83,13),(27,'EMP-2026027','Carlos','Vargas','3-8043-0597','2018-10-30',1824846.46,3),(28,'EMP-2026028','Fabiana','Sánchez','4-4027-8125','2019-01-30',3583619.27,1),(29,'EMP-2026029','Gabriel','Vargas','9-3388-7281','2020-12-21',3593796.73,1),(30,'EMP-2026030','Iván','González','7-2094-8869','2019-06-24',687151.82,11),(31,'EMP-2026031','Esteban','Mora','9-5658-0548','2021-05-14',1571825.39,5),(32,'EMP-2026032','Iván','Sánchez','9-9138-6557','2021-09-09',971885.79,6),(33,'EMP-2026033','Julia','Castro','3-0417-5056','2022-10-15',1749992.81,15),(34,'EMP-2026034','Carlos','Blanco','2-4730-8865','2025-12-27',490896.39,13),(35,'EMP-2026035','Andrés','Castro','9-1369-7726','2022-05-21',1894409.26,7),(36,'EMP-2026036','Diana','Blanco','8-7498-0880','2024-07-15',2268836.81,10),(37,'EMP-2026037','Iván','González','9-9394-8689','2021-10-11',2002546.33,4),(38,'EMP-2026038','Fabiana','Jiménez','9-4470-4528','2018-07-08',1725842.19,15),(39,'EMP-2026039','Fabiana','Pérez','7-1202-5033','2024-10-26',2227135.48,10),(40,'EMP-2026040','Iván','Jiménez','3-9640-9948','2025-06-04',992689.31,12),(41,'EMP-2026041','Iván','Sánchez','1-4914-3083','2025-07-20',491132.64,8),(42,'EMP-2026042','Iván','Mora','2-7186-0466','2025-06-20',2524520.67,2),(43,'EMP-2026043','Julia','González','2-2655-7645','2025-11-19',1883887.72,3),(44,'EMP-2026044','Beatriz','Mora','4-2429-0873','2020-04-15',877784.95,14),(45,'EMP-2026045','Carlos','Ramírez','7-3541-5003','2022-06-29',519689.57,13),(46,'EMP-2026046','Beatriz','Castro','1-8129-8094','2021-02-07',1561387.26,5),(47,'EMP-2026047','Carlos','Rojas','7-6713-1862','2018-07-28',3502614.84,1),(48,'EMP-2026048','Diana','Pérez','6-4445-3690','2021-11-24',895178.37,14),(49,'EMP-2026049','Hellen','González','1-0807-3603','2021-07-03',971726.42,6),(50,'EMP-2026050','Julia','Rojas','1-8301-9893','2022-05-08',681538.54,11),(51,'EMP-2026051','Carlos','Mora','5-1432-1437','2023-09-23',901387.03,6),(52,'EMP-2026052','Carlos','Blanco','2-0143-4385','2024-11-14',1743420.38,15),(53,'EMP-2026053','Hellen','Rojas','8-9751-2632','2022-11-23',1716304.32,15),(54,'EMP-2026054','Gabriel','Castro','3-9946-0164','2025-04-19',994062.86,12),(55,'EMP-2026055','Julia','González','9-9055-7709','2024-12-19',487732.82,13),(56,'EMP-2026056','Esteban','González','5-3243-2283','2024-09-19',1115788.73,9),(57,'EMP-2026057','Carlos','Blanco','4-9069-4953','2019-11-22',1829436.37,3),(58,'EMP-2026058','Carlos','Sánchez','2-7317-1826','2020-03-16',954126.42,12),(59,'EMP-2026059','Andrés','Sánchez','9-5355-7735','2023-12-16',748551.25,11),(60,'EMP-2026060','Beatriz','Castro','4-5419-6133','2022-06-25',486406.51,13),(61,'EMP-2026061','Esteban','Rojas','1-1237-3029','2024-12-03',530865.89,8),(62,'EMP-2026062','Gabriel','Jiménez','5-9671-2548','2023-01-15',909938.32,6),(63,'EMP-2026063','Diana','Vargas','1-1432-5441','2023-09-17',2282302.49,10),(64,'EMP-2026064','Carlos','Castro','4-5565-5457','2025-08-13',1865782.99,7),(65,'EMP-2026065','Beatriz','Vargas','4-0231-0523','2024-07-09',2080502.93,4),(66,'EMP-2026066','Esteban','Pérez','6-5224-6873','2018-12-17',978584.87,12),(67,'EMP-2026067','Iván','González','9-9489-9812','2025-08-11',1835478.88,3),(68,'EMP-2026068','Fabiana','Blanco','3-0286-4018','2018-07-08',2541132.87,2),(69,'EMP-2026069','Carlos','Sánchez','8-4143-5150','2023-05-17',961607.98,12),(70,'EMP-2026070','Fabiana','Vargas','5-3795-4974','2023-03-29',1125005.76,9),(71,'EMP-2026071','Carlos','González','3-7559-9013','2024-02-20',699214.67,11),(72,'EMP-2026072','Hellen','González','4-7983-7317','2023-12-08',1112443.75,9),(73,'EMP-2026073','Iván','Castro','2-5805-5070','2019-08-02',1844640.52,7),(74,'EMP-2026074','Iván','Blanco','8-0996-8635','2025-12-10',1850633.25,3),(75,'EMP-2026075','Esteban','Pérez','8-5653-4076','2023-04-17',698769.25,11),(76,'EMP-2026076','Esteban','Vargas','5-1322-0944','2025-06-25',2209356.47,10),(77,'EMP-2026077','Carlos','Blanco','4-6849-2021','2018-04-01',1817359.48,3),(78,'EMP-2026078','Julia','Ramírez','4-8735-2302','2021-09-30',2296052.54,10),(79,'EMP-2026079','Carlos','Sánchez','1-9634-8031','2025-01-25',1521907.13,5),(80,'EMP-2026080','Hellen','Blanco','9-3640-0204','2026-01-08',548856.40,8),(81,'EMP-2026081','Julia','Vargas','3-4691-4912','2025-09-13',727017.95,11),(82,'EMP-2026082','Hellen','González','9-4174-1116','2023-08-05',2519306.83,2),(83,'EMP-2026083','Andrés','Jiménez','9-4360-2991','2024-07-24',454037.28,13),(84,'EMP-2026084','Gabriel','Mora','9-0384-4291','2025-11-08',2586391.47,2),(85,'EMP-2026085','Carlos','Vargas','9-4605-4935','2025-05-23',3595088.46,1),(86,'EMP-2026086','Esteban','Jiménez','1-6734-2724','2023-04-18',989111.69,6),(87,'EMP-2026087','Esteban','Ramírez','4-0879-2597','2025-10-25',1139536.39,9),(88,'EMP-2026088','Iván','Sánchez','2-4961-9219','2025-02-06',1784238.26,15),(89,'EMP-2026089','Iván','Castro','2-7658-4817','2025-03-10',1811101.04,7),(90,'EMP-2026090','Carlos','Castro','8-9614-1763','2017-11-28',2045773.04,4),(91,'EMP-2026091','Carlos','Sánchez','6-7198-8110','2018-09-30',454484.65,8),(92,'EMP-2026092','Fabiana','Vargas','4-3502-6017','2018-03-26',1898573.39,3),(93,'EMP-2026093','Andrés','Rojas','1-0792-0771','2024-11-19',2550918.39,2),(94,'EMP-2026094','Beatriz','Blanco','9-5183-6525','2020-04-15',2558144.99,2),(95,'EMP-2026095','Hellen','Sánchez','8-1009-9925','2020-09-05',1132234.77,9),(96,'EMP-2026096','Gabriel','Sánchez','1-9373-3919','2024-11-21',3556149.91,1),(97,'EMP-2026097','Diana','Sánchez','2-3163-9241','2020-07-31',958849.46,6),(98,'EMP-2026098','Julia','Pérez','6-8824-5566','2024-12-26',450924.56,8),(99,'EMP-2026099','Gabriel','Sánchez','7-8538-1593','2024-03-03',2569837.48,2),(100,'EMP-2026100','Hellen','Pérez','4-7821-5997','2020-09-28',696274.95,11),(101,'EMP-2026101','Mario','Chaves','2-0123-0456','2026-02-06',750000.00,2);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tg_auditoria_salario` AFTER UPDATE ON `empleados` FOR EACH ROW BEGIN
    IF OLD.salario_base <> NEW.salario_base THEN
        INSERT INTO auditoria (usuario_id, tabla_afectada, registro_id, accion, valor_anterior, valor_nuevo)
        VALUES (@usuario_id_sesion, 'empleados', OLD.id, 'UPDATE', JSON_OBJECT('salario', OLD.salario_base), JSON_OBJECT('salario', NEW.salario_base));
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `movimientos_planilla`
--

DROP TABLE IF EXISTS `movimientos_planilla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientos_planilla` (
  `id` int NOT NULL AUTO_INCREMENT,
  `empleado_id` int DEFAULT NULL,
  `periodo_id` int DEFAULT NULL,
  `concepto_id` int DEFAULT NULL,
  `monto_calculado` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `empleado_id` (`empleado_id`),
  KEY `periodo_id` (`periodo_id`),
  KEY `concepto_id` (`concepto_id`),
  CONSTRAINT `movimientos_planilla_ibfk_1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`),
  CONSTRAINT `movimientos_planilla_ibfk_2` FOREIGN KEY (`periodo_id`) REFERENCES `periodos_planilla` (`id`),
  CONSTRAINT `movimientos_planilla_ibfk_3` FOREIGN KEY (`concepto_id`) REFERENCES `conceptos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos_planilla`
--

LOCK TABLES `movimientos_planilla` WRITE;
/*!40000 ALTER TABLE `movimientos_planilla` DISABLE KEYS */;
INSERT INTO `movimientos_planilla` (`id`, `empleado_id`, `periodo_id`, `concepto_id`, `monto_calculado`) VALUES (1,1,1,1,195066.84),(2,2,1,1,90384.85),(3,3,1,1,96094.71),(4,4,1,1,154410.23),(5,5,1,1,72196.63),(6,6,1,1,96741.31),(7,7,1,1,180942.11),(8,8,1,1,68562.58),(9,9,1,1,46833.87),(10,10,1,1,180520.28),(11,11,1,1,201451.41),(12,12,1,1,48617.00),(13,13,1,1,200261.21),(14,14,1,1,95416.31),(15,15,1,1,109567.53),(16,16,1,1,97811.33),(17,17,1,1,183592.46),(18,18,1,1,51044.66),(19,19,1,1,149815.47),(20,20,1,1,182847.60),(21,21,1,1,82862.46),(22,22,1,1,114691.98),(23,23,1,1,116023.18),(24,24,1,1,173084.91),(25,25,1,1,340258.16),(26,26,1,1,49506.42),(27,27,1,1,176462.65),(28,28,1,1,346535.98),(29,29,1,1,347520.14),(30,30,1,1,66447.58),(31,31,1,1,151995.52),(32,32,1,1,93981.36),(33,33,1,1,169224.30),(34,34,1,1,47469.68),(35,35,1,1,183189.38),(36,36,1,1,219396.52),(37,37,1,1,193646.23),(38,38,1,1,166888.94),(39,39,1,1,215364.00),(40,40,1,1,95993.06),(41,41,1,1,47492.53),(42,42,1,1,244121.15),(43,43,1,1,182171.94),(44,44,1,1,84881.80),(45,45,1,1,50253.98),(46,46,1,1,150986.15),(47,47,1,1,338702.86),(48,48,1,1,86563.75),(49,49,1,1,93965.94),(50,50,1,1,65904.78),(51,51,1,1,87164.13),(52,52,1,1,168588.75),(53,53,1,1,165966.63),(54,54,1,1,96125.88),(55,55,1,1,47163.76),(56,56,1,1,107896.77),(57,57,1,1,176906.50),(58,58,1,1,92264.02),(59,59,1,1,72384.91),(60,60,1,1,47035.51),(61,61,1,4,22536.23),(62,62,1,4,25708.81),(63,63,1,4,15935.33),(64,64,1,4,17550.21),(65,65,1,4,24945.09),(66,66,1,4,27074.82),(67,67,1,4,15538.84),(68,68,1,4,41469.73),(69,69,1,4,25732.15),(70,70,1,4,19251.53),(71,71,1,4,34061.21),(72,72,1,4,37551.47),(73,73,1,4,40573.70),(74,74,1,4,15214.10),(75,75,1,4,29349.40),(76,76,1,4,26104.71),(77,77,1,4,27475.37),(78,78,1,4,44062.69),(79,79,1,4,32887.36),(80,80,1,4,17248.71),(81,81,1,4,63436.58),(82,82,1,5,48734.34),(83,83,1,4,35959.98),(84,84,1,4,60970.83),(85,85,1,4,56746.96),(86,86,1,5,43544.32),(87,87,1,5,51377.89),(88,88,1,5,34534.94),(89,89,1,5,25592.40),(90,90,1,5,64948.96),(91,91,1,5,54921.71),(92,92,1,5,40115.11),(93,93,1,5,26322.31),(94,94,1,5,72676.91),(95,95,1,4,53450.70),(96,96,1,5,63779.84),(97,97,1,4,59218.23),(98,98,1,4,65403.03),(99,99,1,5,33350.40),(100,100,1,5,52150.44);
/*!40000 ALTER TABLE `movimientos_planilla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periodos_planilla`
--

DROP TABLE IF EXISTS `periodos_planilla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periodos_planilla` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_periodo` varchar(100) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `estado` enum('Abierto','Procesado','Cerrado') DEFAULT 'Abierto',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodos_planilla`
--

LOCK TABLES `periodos_planilla` WRITE;
/*!40000 ALTER TABLE `periodos_planilla` DISABLE KEYS */;
INSERT INTO `periodos_planilla` (`id`, `nombre_periodo`, `fecha_inicio`, `fecha_fin`, `estado`) VALUES (1,'Enero 2026','2026-01-01','2026-01-30','Abierto');
/*!40000 ALTER TABLE `periodos_planilla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puestos`
--

DROP TABLE IF EXISTS `puestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puestos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `salario_base_sugerido` decimal(12,2) DEFAULT NULL,
  `departamento_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `departamento_id` (`departamento_id`),
  CONSTRAINT `puestos_ibfk_1` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puestos`
--

LOCK TABLES `puestos` WRITE;
/*!40000 ALTER TABLE `puestos` DISABLE KEYS */;
INSERT INTO `puestos` (`id`, `nombre`, `salario_base_sugerido`, `departamento_id`) VALUES (1,'Director Ejecutivo',3500000.00,1),(2,'Arquitecto IT',2500000.00,2),(3,'Desarrollador',1800000.00,2),(4,'Gerente RRHH',2000000.00,3),(5,'Contador General',1500000.00,4),(6,'Ejecutivo Comercial',900000.00,5),(7,'Jefe de Planta',1800000.00,6),(8,'Operario',450000.00,6),(9,'Encargado Logística',1100000.00,7),(10,'Abogado Senior',2200000.00,9),(11,'Técnico Junior',650000.00,10),(12,'Analista Calidad',950000.00,11),(13,'Oficial Seguridad',450000.00,12),(14,'Comprador',850000.00,13),(15,'Ingeniero Proyectos',1700000.00,17);
/*!40000 ALTER TABLE `puestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `rol` enum('Administrador','Recursos Humanos','Contador','Empleado') NOT NULL,
  `empleado_id` int DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '1',
  `pregunta_seguridad` varchar(255) DEFAULT NULL,
  `respuesta_seguridad` varchar(255) DEFAULT NULL,
  `ultimo_login` datetime DEFAULT NULL,
  `intentos_fallidos` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `empleado_id` (`empleado_id`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `username`, `password_hash`, `rol`, `empleado_id`, `estado`, `pregunta_seguridad`, `respuesta_seguridad`, `ultimo_login`, `intentos_fallidos`) VALUES (1,'mario.chaves.admin','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Administrador',1,1,'¿Color favorito?','Azul','2026-02-02 17:58:21',0),(2,'esteban.ramírez2','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',2,1,'¿Cuál fue su primer número de teléfono?','88888888','2026-02-06 17:58:21',0),(3,'julia.pérez3','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',3,1,'¿Cuál es el nombre de su escuela primaria?','Escuela Central','2026-02-06 17:58:21',0),(4,'julia.pérez4','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',4,1,'¿Cuál es el nombre de su primera mascota?','Fido','2026-02-02 17:58:21',0),(5,'esteban.gonzález5','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',5,1,'¿En qué ciudad nació su madre?','San Jose','2026-01-29 17:58:21',0),(6,'beatriz.castro6','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',6,1,'¿Cuál es el nombre de su primera mascota?','Fido','2026-01-31 17:58:21',0),(7,'andrés.pérez7','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',7,1,'¿Cuál es el nombre de su escuela primaria?','Escuela Central','2026-01-29 17:58:21',0),(8,'carlos.mora8','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',8,1,'¿Cuál es el nombre de su primera mascota?','Fido','2026-02-03 17:58:21',0),(9,'diana.pérez9','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',9,1,'¿Cuál es el nombre de su escuela primaria?','Escuela Central','2026-02-05 17:58:21',0),(10,'julia.jiménez10','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',10,1,'¿Cuál es su color favorito?','Azul','2026-02-05 17:58:21',0),(11,'esteban.sánchez11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Administrador',11,1,'¿Cuál es el nombre de su escuela primaria?','Escuela Central','2026-02-02 17:58:21',0),(12,'julia.rojas12','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',12,1,'¿Cuál es el nombre de su escuela primaria?','Escuela Central','2026-01-31 17:58:21',0),(13,'fabiana.gonzález13','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Administrador',13,1,'¿Cuál es el nombre de su primera mascota?','Fido','2026-02-03 17:58:21',0),(14,'andrés.blanco14','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',14,1,'¿Cuál es el nombre de su primera mascota?','Fido','2026-02-03 17:58:21',0),(15,'carlos.ramírez15','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',15,1,'¿En qué ciudad nació su madre?','San Jose','2026-02-01 17:58:21',0),(16,'diana.jiménez16','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',16,1,'¿Cuál es el nombre de su primera mascota?','Fido','2026-01-29 17:58:21',0),(17,'iván.sánchez17','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',17,1,'¿Cuál es el nombre de su primera mascota?','Fido','2026-01-28 17:58:21',0),(18,'hellen.pérez18','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',18,1,'¿Cuál es el nombre de su escuela primaria?','Escuela Central','2026-02-01 17:58:21',0),(19,'esteban.mora19','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',19,1,'¿Cuál es su color favorito?','Azul','2026-01-29 17:58:21',0),(20,'fabiana.sánchez20','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',20,1,'¿Cuál es su color favorito?','Azul','2026-02-02 17:58:21',0),(21,'iván.castro21','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',21,1,'¿En qué ciudad nació su madre?','San Jose','2026-02-02 17:58:21',0),(22,'fabiana.vargas22','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',22,1,'¿Cuál es su color favorito?','Azul','2026-01-30 17:58:21',0),(23,'esteban.ramírez23','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',23,1,'¿Cuál es el nombre de su escuela primaria?','Escuela Central','2026-02-06 17:58:21',0),(24,'carlos.ramírez24','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',24,1,'¿Cuál es el nombre de su escuela primaria?','Escuela Central','2026-01-29 17:58:21',0),(25,'beatriz.pérez25','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Administrador',25,1,'¿Cuál es el nombre de su escuela primaria?','Escuela Central','2026-02-06 17:58:21',0),(26,'fabiana.rojas26','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',26,1,'¿Cuál es el nombre de su primera mascota?','Fido','2026-02-06 17:58:21',0),(27,'carlos.vargas27','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',27,1,'¿Cuál es el nombre de su primera mascota?','Fido','2026-01-28 17:58:21',0),(28,'fabiana.sánchez28','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Administrador',28,1,'¿En qué ciudad nació su madre?','San Jose','2026-01-31 17:58:21',0),(29,'gabriel.vargas29','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Administrador',29,1,'¿Cuál es el nombre de su primera mascota?','Fido','2026-01-29 17:58:21',0),(30,'iván.gonzález30','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',30,1,'¿Cuál es el nombre de su escuela primaria?','Escuela Central','2026-02-01 17:58:21',0),(31,'esteban.mora31','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',31,1,'¿Cuál es su color favorito?','Azul','2026-02-01 17:58:21',0),(32,'iván.sánchez32','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',32,1,'¿En qué ciudad nació su madre?','San Jose','2026-01-29 17:58:21',0),(33,'julia.castro33','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',33,1,'¿Cuál fue su primer número de teléfono?','88888888','2026-01-29 17:58:21',0),(34,'carlos.blanco34','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',34,1,'¿Cuál fue su primer número de teléfono?','88888888','2026-02-04 17:58:21',0),(35,'andrés.castro35','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',35,1,'¿Cuál es su color favorito?','Azul','2026-02-02 17:58:21',0),(36,'diana.blanco36','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Administrador',36,1,'¿En qué ciudad nació su madre?','San Jose','2026-02-06 17:58:21',0),(37,'iván.gonzález37','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Administrador',37,1,'¿Cuál fue su primer número de teléfono?','88888888','2026-01-28 17:58:21',0),(38,'fabiana.jiménez38','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',38,1,'¿Cuál es el nombre de su escuela primaria?','Escuela Central','2026-02-06 17:58:21',0),(39,'fabiana.pérez39','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Administrador',39,1,'¿Cuál es el nombre de su escuela primaria?','Escuela Central','2026-01-30 17:58:21',0),(40,'iván.jiménez40','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',40,1,'¿Cuál fue su primer número de teléfono?','88888888','2026-02-05 17:58:21',0),(41,'iván.sánchez41','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',41,1,'¿Cuál fue su primer número de teléfono?','88888888','2026-01-30 17:58:21',0),(42,'iván.mora42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',42,1,'¿Cuál es el nombre de su escuela primaria?','Escuela Central','2026-01-29 17:58:21',0),(43,'julia.gonzález43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',43,1,'¿Cuál es su color favorito?','Azul','2026-01-30 17:58:21',0),(44,'beatriz.mora44','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',44,1,'¿En qué ciudad nació su madre?','San Jose','2026-02-02 17:58:21',0),(45,'carlos.ramírez45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',45,1,'¿En qué ciudad nació su madre?','San Jose','2026-02-06 17:58:21',0),(46,'beatriz.castro46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',46,1,'¿Cuál fue su primer número de teléfono?','88888888','2026-01-28 17:58:21',0),(47,'carlos.rojas47','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Administrador',47,1,'¿En qué ciudad nació su madre?','San Jose','2026-01-30 17:58:21',0),(48,'diana.pérez48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',48,1,'¿Cuál fue su primer número de teléfono?','88888888','2026-02-06 17:58:21',0),(49,'hellen.gonzález49','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',49,1,'¿Cuál es el nombre de su primera mascota?','Fido','2026-01-28 17:58:21',0),(50,'julia.rojas50','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',50,1,'¿Cuál es su color favorito?','Azul','2026-01-30 17:58:21',0),(51,'carlos.mora51','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',51,1,'¿Cuál es su color favorito?','Azul','2026-02-02 17:58:21',0),(52,'carlos.blanco52','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',52,1,'¿Cuál fue su primer número de teléfono?','88888888','2026-02-02 17:58:21',0),(53,'hellen.rojas53','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',53,1,'¿Cuál fue su primer número de teléfono?','88888888','2026-01-29 17:58:21',0),(54,'gabriel.castro54','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',54,1,'¿Cuál es su color favorito?','Azul','2026-02-01 17:58:21',0),(55,'julia.gonzález55','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',55,1,'¿En qué ciudad nació su madre?','San Jose','2026-01-28 17:58:21',0),(56,'esteban.gonzález56','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',56,1,'¿En qué ciudad nació su madre?','San Jose','2026-02-05 17:58:21',0),(57,'carlos.blanco57','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',57,1,'¿Cuál es su color favorito?','Azul','2026-02-02 17:58:21',0),(58,'carlos.sánchez58','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',58,1,'¿Cuál fue su primer número de teléfono?','88888888','2026-02-06 17:58:21',0),(59,'andrés.sánchez59','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',59,1,'¿En qué ciudad nació su madre?','San Jose','2026-01-29 17:58:21',0),(60,'beatriz.castro60','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',60,1,'¿Cuál es el nombre de su primera mascota?','Fido','2026-01-30 17:58:21',0),(61,'esteban.rojas61','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',61,1,'¿En qué ciudad nació su madre?','San Jose','2026-01-30 17:58:21',0),(62,'gabriel.jiménez62','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',62,1,'¿Cuál es el nombre de su primera mascota?','Fido','2026-02-02 17:58:21',0),(63,'diana.vargas63','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Administrador',63,1,'¿Cuál es el nombre de su escuela primaria?','Escuela Central','2026-01-29 17:58:21',0),(64,'carlos.castro64','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',64,1,'¿Cuál fue su primer número de teléfono?','88888888','2026-02-04 17:58:21',0),(65,'beatriz.vargas65','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Administrador',65,1,'¿En qué ciudad nació su madre?','San Jose','2026-02-01 17:58:21',0),(66,'esteban.pérez66','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',66,1,'¿Cuál es el nombre de su primera mascota?','Fido','2026-01-31 17:58:21',0),(67,'iván.gonzález67','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',67,1,'¿Cuál es el nombre de su primera mascota?','Fido','2026-01-28 17:58:21',0),(68,'fabiana.blanco68','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',68,1,'¿Cuál es su color favorito?','Azul','2026-01-31 17:58:21',0),(69,'carlos.sánchez69','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',69,1,'¿Cuál es el nombre de su primera mascota?','Fido','2026-01-29 17:58:21',0),(70,'fabiana.vargas70','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',70,1,'¿Cuál es su color favorito?','Azul','2026-02-05 17:58:21',0),(71,'carlos.gonzález71','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',71,1,'¿Cuál es el nombre de su escuela primaria?','Escuela Central','2026-01-29 17:58:21',0),(72,'hellen.gonzález72','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',72,1,'¿Cuál es el nombre de su escuela primaria?','Escuela Central','2026-02-03 17:58:21',0),(73,'iván.castro73','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',73,1,'¿Cuál es el nombre de su escuela primaria?','Escuela Central','2026-01-30 17:58:21',0),(74,'iván.blanco74','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',74,1,'¿Cuál es su color favorito?','Azul','2026-02-01 17:58:21',0),(75,'esteban.pérez75','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Empleado',75,1,'¿En qué ciudad nació su madre?','San Jose','2026-02-02 17:58:21',0),(76,'cristopher.chavarria','bcrypt_hash_simulado','Empleado',100,1,'¿Color favorito?','Verde',NULL,0);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'planillasweb'
--

--
-- Dumping routines for database 'planillasweb'
--
/*!50003 DROP PROCEDURE IF EXISTS `Cargar100RegistrosCR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Cargar100RegistrosCR`()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE r_nom VARCHAR(50);
    DECLARE r_ape VARCHAR(50);
    DECLARE r_dni VARCHAR(20);
    DECLARE v_puesto_id INT;
    DECLARE v_salario DECIMAL(12,2);

    WHILE i <= 100 DO
        -- Nombres comunes en Costa Rica
        SET r_nom = ELT(1 + FLOOR(RAND() * 15), 'Jose', 'Maria', 'Luis', 'Andrey', 'Yendry', 'Keylor', 'Shirley', 'Oscar', 'Tatiana', 'Marvin', 'Fabricio', 'Monica', 'Carlos', 'Elena', 'Randall');
        SET r_ape = ELT(1 + FLOOR(RAND() * 15), 'Mora', 'Rodriguez', 'Chavarria', 'Gonzalez', 'Jimenez', 'Solis', 'Vargas', 'Quirós', 'Sánchez', 'Villalobos', 'Cascante', 'Araya', 'Pérez', 'Guzmán', 'Ureña');
        
        -- Cédula formato CR: Provincia (1-9) - Tomo - Asiento
        SET r_dni = CONCAT(FLOOR(1 + RAND() * 7), '-', LPAD(FLOOR(RAND() * 2000), 4, '0'), '-', LPAD(FLOOR(RAND() * 2000), 4, '0'));
        
        -- Selección de puesto al azar (de los 15 creados)
        SET v_puesto_id = 1 + FLOOR(RAND() * 15);
        SELECT salario_base_sugerido INTO v_salario FROM puestos WHERE id = v_puesto_id;

        -- Insertar Empleado
        INSERT INTO `empleados` (`codigo_empleado`, `nombre`, `apellido`, `dni`, `fecha_ingreso`, `salario_base`, `puesto_id`)
        VALUES (
            CONCAT('CR-', 100 + i), r_nom, r_ape, r_dni,
            DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 3650) DAY), -- Hasta 10 años de antigüedad
            v_salario + (RAND() * 50000), -- Variación de mercado
            v_puesto_id
        );

        -- Crear acceso al sistema solo para puestos de oficina/mandos medios (60% de empleados)
        IF v_puesto_id NOT IN (5, 6, 14, 15) AND i <= 60 THEN
            INSERT INTO `usuarios` (`username`, `password_hash`, `rol`, `empleado_id`)
            VALUES (
                LOWER(CONCAT(LEFT(r_nom, 1), r_ape, i)), 
                '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', -- pass: password
                CASE WHEN v_puesto_id IN (1, 7, 13) THEN 'Administrador' WHEN v_puesto_id IN (8, 9) THEN 'Recursos Humanos' ELSE 'Empleado' END,
                LAST_INSERT_ID()
            );
        END IF;

        -- Generar movimientos de planilla (CCSS) para cada empleado en el periodo actual
        INSERT INTO `movimientos_planilla` (`empleado_id`, `periodo_id`, `concepto_id`, `monto_calculado`)
        VALUES (i, 1, 1, (v_salario * 0.0967));

        SET i = i + 1;
    END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CargarDataMaestra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CargarDataMaestra`()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE v_nom VARCHAR(50);
    DECLARE v_ape VARCHAR(50);
    DECLARE v_puesto_id INT;
    DECLARE v_salario DECIMAL(12,2);
    DECLARE v_emp_id INT;
    DECLARE v_usuario_random INT;

    -- Bucle para 100 empleados
    WHILE i <= 100 DO
        -- Nombres y Apellidos Realistas
        SET v_nom = ELT(1 + FLOOR(RAND() * 10), 'Andrés', 'Beatriz', 'Carlos', 'Diana', 'Esteban', 'Fabiana', 'Gabriel', 'Hellen', 'Iván', 'Julia');
        SET v_ape = ELT(1 + FLOOR(RAND() * 10), 'Mora', 'Sánchez', 'González', 'Rojas', 'Ramírez', 'Vargas', 'Jiménez', 'Castro', 'Pérez', 'Blanco');

        -- Selección aleatoria de puestos existentes
        SELECT id, salario_base_sugerido INTO v_puesto_id, v_salario 
        FROM puestos ORDER BY RAND() LIMIT 1;

        -- Insertar Empleado
        INSERT INTO `empleados` (`codigo_empleado`, `nombre`, `apellido`, `dni`, `fecha_ingreso`, `salario_base`, `puesto_id`)
        VALUES (
            CONCAT('EMP-', 2026, LPAD(i, 3, '0')), 
            v_nom, v_ape, 
            CONCAT(FLOOR(1+RAND()*9), '-', LPAD(FLOOR(RAND()*9999), 4, '0'), '-', LPAD(FLOOR(RAND()*9999), 4, '0')),
            DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 3000) DAY),
            v_salario + (RAND() * 100000), 
            v_puesto_id
        );

        SET v_emp_id = LAST_INSERT_ID();

        -- Crear usuario para los primeros 75 empleados
        IF i <= 75 THEN
            INSERT INTO `usuarios` (`username`, `password_hash`, `rol`, `empleado_id`)
            VALUES (
                LOWER(CONCAT(v_nom, '.', v_ape, i)), 
                '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 
                CASE WHEN v_puesto_id IN (1, 4, 10) THEN 'Administrador' ELSE 'Empleado' END, 
                v_emp_id
            );
        END IF;

        SET i = i + 1;
    END WHILE;

    -- GENERAR 100 REGISTROS DE AUDITORÍA LOGICOS
    SET i = 1;
    WHILE i <= 100 DO
        -- Seleccionamos un usuario y un empleado al azar para la auditoría
        SET v_usuario_random = (SELECT id FROM usuarios ORDER BY RAND() LIMIT 1);
        SET v_emp_id = (SELECT id FROM empleados ORDER BY RAND() LIMIT 1);
        
        INSERT INTO auditoria (usuario_id, tabla_afectada, registro_id, accion, valor_anterior, valor_nuevo)
        VALUES (
            v_usuario_random, 
            'empleados', 
            v_emp_id, 
            'UPDATE', 
            JSON_OBJECT('salario', 500000), 
            JSON_OBJECT('salario', 525000)
        );
        SET i = i + 1;
    END WHILE;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CargarDatosEstructurales` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CargarDatosEstructurales`()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE r_nom VARCHAR(50);
    DECLARE r_ape VARCHAR(50);
    DECLARE v_puesto_id INT;

    -- Insertar Departamentos
    INSERT INTO departamentos (id, nombre) VALUES 
    (1, 'Tecnología'), (2, 'Recursos Humanos'), (3, 'Ventas'), (4, 'Finanzas'), (5, 'Operaciones');

    -- Insertar Puestos ligados a Departamentos
    INSERT INTO puestos (nombre, salario_base_sugerido, departamento_id) VALUES 
    ('Sr. Developer', 3000, 1), ('Jr. Developer', 1500, 1), ('DevOps Engineer', 2800, 1),
    ('Gerente RRHH', 3500, 2), ('Reclutador', 1800, 2), ('Asistente RRHH', 1200, 2),
    ('Ejecutivo Ventas', 1000, 3), ('Key Account Manager', 2200, 3), ('Director Comercial', 4500, 3),
    ('Contador Senior', 2500, 4), ('Auxiliar Contable', 1300, 4), ('Tesorero', 2400, 4),
    ('Supervisor Planta', 1800, 5), ('Operario', 900, 5), ('Logística', 1400, 5);

    -- Conceptos
    INSERT INTO conceptos (nombre, tipo, es_ley) VALUES ('Horas Extra', 'Ingreso', 0), ('Seguro Social', 'Deduccion', 1), ('Impuesto Renta', 'Deduccion', 1);

    -- Bucle para 100 Empleados
    WHILE i <= 100 DO
        SET r_nom = ELT(1 + FLOOR(RAND() * 10), 'Ricardo', 'Beatriz', 'Andres', 'Monica', 'Felipe', 'Paola', 'Gustavo', 'Lorena', 'Daniel', 'Rosa');
        SET r_ape = ELT(1 + FLOOR(RAND() * 10), 'Mora', 'Solis', 'Chaves', 'Viquez', 'Duarte', 'Quesada', 'Alfaro', 'Ulate', 'Montoya', 'Sandoval');
        
        -- Elegir puesto al azar de los 15 creados
        SET v_puesto_id = 1 + FLOOR(RAND() * 15);
        
        INSERT INTO empleados (codigo_empleado, nombre, apellido, dni, fecha_ingreso, salario_base, puesto_id)
        VALUES (
            CONCAT('EMP-', 2026, LPAD(i, 3, '0')), r_nom, r_ape, 
            CONCAT(FLOOR(1+RAND()*9), '-', FLOOR(1000+RAND()*9999), '-', FLOOR(1000+RAND()*9999)),
            DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 1500) DAY),
            (SELECT salario_base_sugerido FROM puestos WHERE id = v_puesto_id) + (RAND() * 500),
            v_puesto_id
        );

        -- Crear usuarios para los empleados (nombre.apellido)
        IF i <= 80 THEN
            INSERT INTO usuarios (username, password_hash, rol, empleado_id)
            VALUES (LOWER(CONCAT(r_nom, '.', r_ape, i)), '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 
            CASE WHEN i <= 10 THEN 'Administrador' ELSE 'Empleado' END, i);
        END IF;

        SET i = i + 1;
    END WHILE;

    INSERT INTO periodos_planilla (nombre_periodo, fecha_inicio, fecha_fin) VALUES ('Enero 2026', '2026-01-01', '2026-01-30');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CargarMovimientosNomina` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CargarMovimientosNomina`()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE v_emp_id INT;
    DECLARE v_con_id INT;
    DECLARE v_salario DECIMAL(12,2);
    DECLARE v_monto DECIMAL(12,2);
    DECLARE v_periodo_id INT;

    -- Aseguramos que exista al menos un periodo para asignar
    IF (SELECT COUNT(*) FROM periodos_planilla) = 0 THEN
        INSERT INTO periodos_planilla (nombre_periodo, fecha_inicio, fecha_fin, estado) 
        VALUES ('Febrero 2026', '2026-02-01', '2026-02-28', 'Abierto');
    END IF;
    
    SET v_periodo_id = (SELECT id FROM periodos_planilla ORDER BY id DESC LIMIT 1);

    -- Generar 100 movimientos lógicos
    WHILE i <= 100 DO
        -- Seleccionamos un empleado de forma secuencial para que todos tengan algo
        SET v_emp_id = i; 
        
        -- Obtenemos su salario base para calcular deducciones proporcionales
        SELECT salario_base INTO v_salario FROM empleados WHERE id = v_emp_id;

        -- LÓGICA DE DISTRIBUCIÓN:
        -- El 60% serán deducciones de CCSS (Ley Costa Rica 9.67%)
        -- El 20% serán Horas Extra (Ingreso)
        -- El 20% serán Bonos o Comisiones
        
        IF (i <= 60) THEN
            -- Deducción CCSS
            SET v_con_id = (SELECT id FROM conceptos WHERE nombre LIKE '%CCSS%' OR tipo = 'Deduccion' LIMIT 1);
            SET v_monto = v_salario * 0.0967;
        ELSEIF (i <= 80) THEN
            -- Horas Extra (Monto aleatorio entre 15,000 y 45,000 colones)
            SET v_con_id = (SELECT id FROM conceptos WHERE nombre LIKE '%Extra%' OR tipo = 'Ingreso' LIMIT 1);
            SET v_monto = 15000 + (RAND() * 30000);
        ELSE
            -- Otros Ingresos / Bonos
            SET v_con_id = (SELECT id FROM conceptos WHERE tipo = 'Ingreso' ORDER BY RAND() LIMIT 1);
            SET v_monto = 25000 + (RAND() * 50000);
        END IF;

        INSERT INTO movimientos_planilla (empleado_id, periodo_id, concepto_id, monto_calculado)
        VALUES (v_emp_id, v_periodo_id, v_con_id, v_monto);

        SET i = i + 1;
    END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GenerarHistorialAuditoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GenerarHistorialAuditoria`()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE v_emp_id INT;
    DECLARE v_old_salary DECIMAL(12,2);
    DECLARE v_new_salary DECIMAL(12,2);
    
    -- Simularemos 100 eventos de cambios salariales y correcciones
    WHILE i <= 100 DO
        -- Seleccionamos un empleado al azar de los 100 existentes
        SET v_emp_id = (SELECT id FROM empleados ORDER BY RAND() LIMIT 1);
        
        -- Guardamos el salario actual
        SELECT salario_base INTO v_old_salary FROM empleados WHERE id = v_emp_id;
        
        -- LÓGICA DE NEGOCIO: 
        -- El 70% de los registros serán aumentos por costo de vida (Inflación CR)
        -- El 30% serán correcciones de errores menores en nombres
        
        IF (i % 3 <> 0) THEN
            -- Simular aumento salarial del 3% al 7%
            SET v_new_salary = v_old_salary * (1 + (3 + RAND() * 4) / 100);
            
            UPDATE empleados 
            SET salario_base = v_new_salary 
            WHERE id = v_emp_id;
            -- El TRIGGER `tg_auditoria_salario` insertará automáticamente en `auditoria`
        ELSE
            -- Simular corrección de un error de dedo en el apellido
            UPDATE empleados 
            SET apellido = CONCAT(apellido, ' (Modificado)') 
            WHERE id = v_emp_id;
            
            -- Insertamos manualmente esta auditoría ya que el trigger actual solo vigila salarios
            INSERT INTO auditoria (usuario_id, tabla_afectada, registro_id, accion, valor_anterior, valor_nuevo)
            VALUES (@usuario_id_sesion, 'empleados', v_emp_id, 'UPDATE', 
                    JSON_OBJECT('nota', 'Corrección ortográfica'), 
                    JSON_OBJECT('nota', 'Apellido actualizado'));
        END IF;

        SET i = i + 1;
    END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-06 20:14:25
