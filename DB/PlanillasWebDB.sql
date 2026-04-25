CREATE DATABASE  IF NOT EXISTS `planillasweb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `planillasweb`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: planillasweb
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `acumulados_empleado`
--

DROP TABLE IF EXISTS `acumulados_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acumulados_empleado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `empleado_id` int NOT NULL,
  `mes` int NOT NULL,
  `anio` int NOT NULL,
  `aguinaldo_acumulado` decimal(12,2) DEFAULT '0.00',
  `cesantia_acumulada` decimal(12,2) DEFAULT '0.00',
  `vacaciones_acumuladas` decimal(5,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_acumulado_mes` (`empleado_id`,`mes`,`anio`),
  CONSTRAINT `fk_acumulados_empleado` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acumulados_empleado`
--

LOCK TABLES `acumulados_empleado` WRITE;
/*!40000 ALTER TABLE `acumulados_empleado` DISABLE KEYS */;
INSERT INTO `acumulados_empleado` (`id`, `empleado_id`, `mes`, `anio`, `aguinaldo_acumulado`, `cesantia_acumulada`, `vacaciones_acumuladas`) VALUES (1,2,1,2026,77891.12,49819.16,1.25),(2,3,1,2026,82811.71,52966.37,1.25),(3,4,1,2026,133066.38,85109.26,1.25),(4,5,1,2026,62217.02,39794.00,1.25),(5,6,1,2026,83368.93,53322.77,1.25),(6,7,1,2026,155930.81,99733.35,1.25),(7,8,1,2026,59085.30,37790.96,1.25),(8,9,1,2026,40360.11,25814.33,1.25),(9,10,1,2026,155567.28,99500.83,1.25),(10,11,1,2026,173605.14,111037.85,1.25),(11,12,1,2026,41896.76,26797.17,1.25),(12,13,1,2026,172579.47,110381.83,1.25),(13,14,1,2026,82227.09,52592.45,1.25),(14,15,1,2026,94422.21,60392.45,1.25),(29,16,1,2026,84291.04,0.00,1.25),(30,17,1,2026,158214.80,0.00,1.25),(31,18,1,2026,43988.85,0.00,1.25),(32,19,1,2026,129106.75,0.00,1.25),(33,20,1,2026,157572.90,0.00,1.25),(34,21,1,2026,71408.53,0.00,1.25),(35,22,1,2026,98838.32,0.00,1.25),(36,23,1,2026,99985.50,0.00,1.25),(37,24,1,2026,149159.70,0.00,1.25),(38,25,1,2026,293224.89,0.00,1.25),(39,26,1,2026,42663.24,0.00,1.25),(40,27,1,2026,152070.54,0.00,1.25),(41,28,1,2026,298634.94,0.00,1.25),(42,29,1,2026,299483.06,0.00,1.25),(43,30,1,2026,57262.65,0.00,1.25),(44,31,1,2026,130985.45,0.00,1.25),(45,32,1,2026,80990.48,0.00,1.25),(46,33,1,2026,145832.73,0.00,1.25),(47,34,1,2026,40908.03,0.00,1.25),(48,35,1,2026,157867.44,0.00,1.25),(49,36,1,2026,189069.73,0.00,1.25),(50,37,1,2026,166878.86,0.00,1.25),(51,38,1,2026,143820.18,0.00,1.25),(52,39,1,2026,185594.62,0.00,1.25),(53,40,1,2026,82724.11,0.00,1.25),(54,41,1,2026,40927.72,0.00,1.25),(55,42,1,2026,210376.72,0.00,1.25),(56,43,1,2026,156990.64,0.00,1.25),(57,44,1,2026,73148.75,0.00,1.25),(58,45,1,2026,43307.46,0.00,1.25),(59,46,1,2026,130115.61,0.00,1.25),(60,47,1,2026,291884.57,0.00,1.25),(61,48,1,2026,74598.20,0.00,1.25),(62,49,1,2026,80977.20,0.00,1.25),(63,50,1,2026,56794.88,0.00,1.25),(64,51,1,2026,75115.59,0.00,1.25),(65,52,1,2026,145285.03,0.00,1.25),(66,53,1,2026,143025.36,0.00,1.25),(67,54,1,2026,82838.57,0.00,1.25),(68,55,1,2026,40644.40,0.00,1.25),(69,56,1,2026,92982.39,0.00,1.25),(70,57,1,2026,152453.03,0.00,1.25),(71,58,1,2026,79510.54,0.00,1.25),(72,59,1,2026,62379.27,0.00,1.25),(73,60,1,2026,40533.88,0.00,1.25),(74,61,1,2026,44238.82,0.00,1.25),(75,62,1,2026,75828.19,0.00,1.25),(76,63,1,2026,190191.87,0.00,1.25),(77,64,1,2026,155481.92,0.00,1.25),(78,65,1,2026,173375.24,0.00,1.25),(79,66,1,2026,81548.74,0.00,1.25),(80,67,1,2026,152956.57,0.00,1.25),(81,68,1,2026,211761.07,0.00,1.25),(82,69,1,2026,80134.00,0.00,1.25),(83,70,1,2026,93750.48,0.00,1.25),(84,71,1,2026,58267.89,0.00,1.25),(85,72,1,2026,92703.65,0.00,1.25),(86,73,1,2026,153720.04,0.00,1.25),(87,74,1,2026,154219.44,0.00,1.25),(88,75,1,2026,58230.77,0.00,1.25),(89,76,1,2026,184113.04,0.00,1.25),(90,77,1,2026,151446.62,0.00,1.25),(91,78,1,2026,191337.71,0.00,1.25),(92,79,1,2026,126825.59,0.00,1.25),(93,80,1,2026,45738.03,0.00,1.25),(94,81,1,2026,60584.83,0.00,1.25),(95,82,1,2026,209942.24,0.00,1.25),(96,83,1,2026,37836.44,0.00,1.25),(97,84,1,2026,215532.62,0.00,1.25),(98,85,1,2026,299590.71,0.00,1.25),(99,86,1,2026,82425.97,0.00,1.25),(100,87,1,2026,94961.37,0.00,1.25),(101,88,1,2026,148686.52,0.00,1.25),(102,89,1,2026,150925.09,0.00,1.25),(103,90,1,2026,170481.09,0.00,1.25),(104,91,1,2026,37873.72,0.00,1.25),(105,92,1,2026,158214.45,0.00,1.25),(106,93,1,2026,212576.53,0.00,1.25),(107,94,1,2026,213178.75,0.00,1.25),(108,95,1,2026,94352.90,0.00,1.25),(109,96,1,2026,296345.83,0.00,1.25),(110,97,1,2026,79904.12,0.00,1.25),(111,98,1,2026,37577.05,0.00,1.25),(112,99,1,2026,214153.12,0.00,1.25),(113,100,1,2026,58022.91,0.00,1.25),(114,101,1,2026,62500.00,0.00,1.25),(115,106,1,2026,41666.67,0.00,1.25),(116,107,1,2026,0.00,0.00,1.25),(117,108,1,2026,0.08,0.00,1.25),(118,113,1,2026,0.00,0.00,1.25),(119,114,1,2026,0.00,0.00,1.25),(120,115,1,2026,8333.33,0.00,1.25),(121,127,1,2026,166666.67,0.00,1.25),(122,128,1,2026,8333.33,0.00,1.25),(123,129,1,2026,0.00,0.00,1.25);
/*!40000 ALTER TABLE `acumulados_empleado` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria`
--

LOCK TABLES `auditoria` WRITE;
/*!40000 ALTER TABLE `auditoria` DISABLE KEYS */;
INSERT INTO `auditoria` (`id`, `usuario_id`, `tabla_afectada`, `registro_id`, `accion`, `valor_anterior`, `valor_nuevo`, `fecha_hora`) VALUES (1,26,'empleados',21,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(2,45,'empleados',39,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(3,56,'empleados',20,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(4,4,'empleados',70,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(5,34,'empleados',20,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(6,27,'empleados',26,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(7,57,'empleados',76,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(8,47,'empleados',74,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(9,54,'empleados',61,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(10,54,'empleados',68,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(11,23,'empleados',11,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(12,9,'empleados',90,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(13,31,'empleados',6,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(14,66,'empleados',15,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(15,36,'empleados',5,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(16,61,'empleados',10,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(17,64,'empleados',65,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(18,37,'empleados',39,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(19,30,'empleados',58,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(20,37,'empleados',81,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(21,57,'empleados',79,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(22,28,'empleados',22,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(23,50,'empleados',14,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(24,45,'empleados',34,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(25,19,'empleados',9,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(26,33,'empleados',49,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(27,35,'empleados',38,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(28,46,'empleados',50,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(29,1,'empleados',91,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(30,29,'empleados',87,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(31,34,'empleados',99,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(32,65,'empleados',90,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(33,27,'empleados',29,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(34,68,'empleados',49,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(35,23,'empleados',74,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(36,67,'empleados',21,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(37,10,'empleados',58,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(38,70,'empleados',94,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(39,13,'empleados',31,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(40,28,'empleados',30,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(41,9,'empleados',24,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(42,39,'empleados',15,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(43,32,'empleados',81,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(44,28,'empleados',80,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(45,71,'empleados',76,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(46,35,'empleados',9,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(47,56,'empleados',14,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(48,68,'empleados',2,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(49,34,'empleados',36,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(50,55,'empleados',12,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(51,36,'empleados',12,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(52,26,'empleados',65,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(53,62,'empleados',23,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(54,47,'empleados',66,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(55,13,'empleados',21,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(56,17,'empleados',95,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(57,70,'empleados',63,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(58,42,'empleados',46,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(59,1,'empleados',44,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(60,23,'empleados',67,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(61,65,'empleados',82,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(62,6,'empleados',78,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(63,58,'empleados',21,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(64,52,'empleados',25,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(65,70,'empleados',9,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(66,40,'empleados',94,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(67,19,'empleados',9,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(68,45,'empleados',63,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(69,55,'empleados',92,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(70,14,'empleados',93,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(71,6,'empleados',40,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(72,55,'empleados',15,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(73,64,'empleados',16,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(74,25,'empleados',80,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(75,33,'empleados',77,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(76,75,'empleados',84,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(77,13,'empleados',91,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(78,56,'empleados',1,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(79,27,'empleados',74,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(80,42,'empleados',54,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(81,41,'empleados',17,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(82,41,'empleados',37,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(83,3,'empleados',81,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(84,55,'empleados',79,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(85,34,'empleados',81,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(86,21,'empleados',87,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(87,3,'empleados',59,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(88,26,'empleados',31,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(89,53,'empleados',43,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(90,3,'empleados',12,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(91,22,'empleados',32,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(92,2,'empleados',26,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(93,13,'empleados',86,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(94,37,'empleados',33,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(95,9,'empleados',56,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(96,1,'empleados',17,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(97,26,'empleados',28,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(98,66,'empleados',41,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(99,39,'empleados',5,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(100,22,'empleados',84,'UPDATE','{\"salario\": 500000}','{\"salario\": 525000}','2026-02-06 23:43:09'),(101,23,'empleados',1,'UPDATE','{\"salario\": 2017237.2}','{\"salario\": 800000.0}','2026-02-07 01:28:15'),(102,NULL,'usuarios',82,'INSERT',NULL,'{\"rol\": \"Empleado\", \"estado\": 1, \"username\": \"usuario.prueba3\", \"password_hash\": \"bcrypt_hash_simulado\", \"pregunta_seguridad\": \"¿Color favorito?\", \"respuesta_seguridad\": \"Verde\"}','2026-03-21 00:21:57'),(103,NULL,'usuarios',96,'INSERT',NULL,'{\"rol\": \"Empleado\", \"estado\": 1, \"username\": \"usuario.prueba_auto\", \"empleado_id\": 106, \"password_hash\": \"hash123\", \"pregunta_seguridad\": \" Color favorito?\", \"respuesta_seguridad\": \"Verde\"}','2026-03-21 01:38:49'),(104,1,'usuarios',97,'INSERT',NULL,'{\"rol\": \"Empleado\", \"estado\": 1, \"username\": \"audit_test_user\", \"password_hash\": \"test\", \"usuario_accion_id\": 1}','2026-03-21 01:44:11'),(105,1,'usuarios',96,'UPDATE','{\"id\": 96, \"rol\": \"Empleado\", \"token\": null, \"estado\": 1, \"username\": \"usuario.prueba_auto\", \"empleado_id\": 106, \"ultimo_login\": null, \"password_hash\": \"hash123\", \"intentos_fallidos\": 0, \"pregunta_seguridad\": \" Color favorito?\", \"respuesta_seguridad\": \"Verde\"}','{\"rol\": \"Administrador\", \"estado\": 0, \"username\": \"audit_test_user_upd\", \"empleado_id\": 106, \"usuario_accion_id\": 1, \"pregunta_seguridad\": \" Color favorito?\", \"respuesta_seguridad\": \"Rojo\"}','2026-03-21 01:46:50'),(106,1,'conceptos',24,'INSERT',NULL,'{\"tipo\": \"Ingreso\", \"es_ley\": 1, \"nombre\": \"concepto_auditoria\", \"usuario_accion_id\": 1}','2026-03-21 01:52:16'),(107,1,'departamentos',22,'INSERT',NULL,'{\"nombre\": \"depto_auditoria\", \"usuario_accion_id\": 1}','2026-03-21 01:52:16'),(108,1,'empleados',108,'INSERT',NULL,'{\"dni\": \"00\", \"nombre\": \"Test\", \"apellido\": \"Aud\", \"puesto_id\": 1, \"salario_base\": 1, \"fecha_ingreso\": \"2026-03-20\", \"codigo_empleado\": \"EMP-AUD\", \"usuario_accion_id\": 1}','2026-03-21 01:52:16'),(109,1,'horarios',6,'INSERT',NULL,'{\"nombre\": \"horario_auditoria\", \"hora_salida\": \"01:00:00\", \"hora_entrada\": \"00:00:00\", \"dias_laborables\": \"L\", \"usuario_accion_id\": 1}','2026-03-21 01:52:16'),(110,1,'periodos_planilla',3,'INSERT',NULL,'{\"estado\": \"Abierto\", \"fecha_fin\": \"2026-01-05\", \"fecha_inicio\": \"2026-01-01\", \"nombre_periodo\": \"period_aud\", \"usuario_accion_id\": 1}','2026-03-21 01:52:17'),(111,1,'puestos',17,'INSERT',NULL,'{\"nombre\": \"puesto_auditoria\", \"departamento_id\": 1, \"usuario_accion_id\": 1, \"salario_base_sugerido\": 10}','2026-03-21 01:52:17'),(112,NULL,'usuarios',14,'UPDATE','{\"id\": 14, \"rol\": \"Empleado\", \"token\": null, \"estado\": 1, \"username\": \"andrés.blanco14\", \"empleado_id\": 14, \"ultimo_login\": \"2026-02-03T23:58:21.000Z\", \"password_hash\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"intentos_fallidos\": 0, \"pregunta_seguridad\": \"¿Cuál es el nombre de su primera mascota?\", \"respuesta_seguridad\": \"Fido\"}','{\"id\": 14, \"rol\": \"Empleado\", \"token\": null, \"estado\": 0, \"username\": \"andrés.blanco14\", \"empleado_id\": 14, \"ultimo_login\": \"2026-02-03T23:58:21.000Z\", \"password_hash\": \"\", \"intentos_fallidos\": 0, \"pregunta_seguridad\": \"¿Cuál es el nombre de su primera mascota?\", \"respuesta_seguridad\": \"Fido\"}','2026-04-11 01:13:55'),(113,NULL,'usuarios',14,'UPDATE','{\"id\": 14, \"rol\": \"Empleado\", \"token\": null, \"estado\": 0, \"username\": \"andrés.blanco14\", \"empleado_id\": 14, \"ultimo_login\": \"2026-02-03T23:58:21.000Z\", \"password_hash\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"intentos_fallidos\": 0, \"pregunta_seguridad\": \"¿Cuál es el nombre de su primera mascota?\", \"respuesta_seguridad\": \"Fido\"}','{\"id\": 14, \"rol\": \"Empleado\", \"token\": null, \"estado\": 1, \"username\": \"Andres Blanco\", \"empleado_id\": 14, \"ultimo_login\": \"2026-02-03T23:58:21.000Z\", \"password_hash\": \"\", \"intentos_fallidos\": 0, \"pregunta_seguridad\": \"¿Cuál es el nombre de su primera mascota?\", \"respuesta_seguridad\": \"Fido\"}','2026-04-11 01:15:36'),(114,NULL,'usuarios',98,'INSERT',NULL,'{\"rol\": \"Administrador\", \"estado\": 1, \"username\": \"Samantha\", \"password_hash\": \"1234\", \"pregunta_seguridad\": \"\", \"respuesta_seguridad\": \"\"}','2026-04-11 01:45:21'),(115,NULL,'usuarios',99,'INSERT',NULL,'{\"rol\": \"Contador\", \"estado\": 1, \"username\": \"Cristopher\", \"password_hash\": \"1234\", \"pregunta_seguridad\": \"Color Favorito?\", \"respuesta_seguridad\": \"Negro\"}','2026-04-11 01:46:20'),(116,NULL,'usuarios',99,'DELETE','{\"id\": 99, \"rol\": \"Contador\", \"token\": null, \"estado\": 1, \"username\": \"Cristopher\", \"empleado_id\": 114, \"ultimo_login\": null, \"password_hash\": \"1234\", \"intentos_fallidos\": 0, \"pregunta_seguridad\": \"Color Favorito?\", \"respuesta_seguridad\": \"Negro\"}',NULL,'2026-04-11 01:47:01'),(117,NULL,'usuarios',14,'UPDATE','{\"id\": 14, \"rol\": \"Empleado\", \"token\": null, \"estado\": 1, \"username\": \"Andres Blanco\", \"empleado_id\": 14, \"ultimo_login\": \"2026-02-03T23:58:21.000Z\", \"password_hash\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"intentos_fallidos\": 0, \"pregunta_seguridad\": \"¿Cuál es el nombre de su primera mascota?\", \"respuesta_seguridad\": \"Fido\"}','{\"id\": 14, \"rol\": \"Empleado\", \"token\": null, \"estado\": 0, \"username\": \"Andres Blanco\", \"empleado_id\": 14, \"ultimo_login\": \"2026-02-03T23:58:21.000Z\", \"password_hash\": \"\", \"intentos_fallidos\": 0, \"pregunta_seguridad\": \"¿Cuál es el nombre de su primera mascota?\", \"respuesta_seguridad\": \"Fido\"}','2026-04-21 02:06:21'),(118,NULL,'usuarios',14,'DELETE','{\"id\": 14, \"rol\": \"Empleado\", \"token\": null, \"estado\": 0, \"username\": \"Andres Blanco\", \"empleado_id\": 14, \"ultimo_login\": \"2026-02-03T23:58:21.000Z\", \"password_hash\": \"$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\", \"intentos_fallidos\": 0, \"pregunta_seguridad\": \"¿Cuál es el nombre de su primera mascota?\", \"respuesta_seguridad\": \"Fido\"}',NULL,'2026-04-21 02:06:29'),(119,NULL,'empleados',108,'UPDATE','{\"id\": 108, \"dni\": \"00\", \"banco\": \"BAC Credomatic\", \"nombre\": \"Test\", \"apellido\": \"Aud\", \"puesto_id\": 1, \"horario_id\": null, \"cuenta_iban\": \"CR7.588011173147718e17\", \"salario_base\": \"1.00\", \"fecha_ingreso\": \"2026-03-20T06:00:00.000Z\", \"codigo_empleado\": \"EMP-AUD\"}','{\"id\": 108, \"dni\": \"00\", \"banco\": \"BAC Credomatic\", \"nombre\": \"Test\", \"apellido\": \"Aud\", \"puesto_id\": 1, \"horario_id\": 1, \"cuenta_iban\": \"CR7.588011173147718e17\", \"salario_base\": \"1.00\", \"fecha_ingreso\": \"2026-03-20\", \"puesto_nombre\": \"Analista Principal\", \"horario_nombre\": null, \"codigo_empleado\": \"EMP-AUD\"}','2026-04-21 17:01:43'),(120,NULL,'empleados',107,'UPDATE','{\"id\": 107, \"dni\": \"000000000\", \"banco\": \"Banco Nacional de Costa Rica\", \"nombre\": \"audit_test_user\", \"apellido\": \"Autogenerado\", \"puesto_id\": null, \"horario_id\": null, \"cuenta_iban\": \"CR6.466134233834348e17\", \"salario_base\": \"0.00\", \"fecha_ingreso\": \"2026-03-21T06:00:00.000Z\", \"codigo_empleado\": \"USR-1774057451439\"}','{\"id\": 107, \"dni\": \"000000000\", \"banco\": \"Banco Nacional de Costa Rica\", \"nombre\": \"audit_test_user\", \"apellido\": \"Autogenerado\", \"puesto_id\": 4, \"horario_id\": 4, \"cuenta_iban\": \"CR6.466134233834348e17\", \"salario_base\": \"0.00\", \"fecha_ingreso\": \"2026-03-21\", \"puesto_nombre\": null, \"horario_nombre\": null, \"codigo_empleado\": \"USR-1774057451439\"}','2026-04-21 17:01:58'),(121,NULL,'empleados',115,'INSERT',NULL,'{\"dni\": \"2065548795\", \"nombre\": \"Maria \", \"apellido\": \"Solera\", \"puesto_id\": 2, \"horario_id\": 2, \"salario_base\": 100000, \"fecha_ingreso\": \"2026-04-21\", \"codigo_empleado\": \"Auto-generado por DB\"}','2026-04-21 18:00:51'),(122,NULL,'movimientos_planilla',102,'INSERT',NULL,'{\"periodo_id\": 1, \"concepto_id\": 12, \"empleado_id\": 46, \"monto_calculado\": 100000}','2026-04-21 18:11:11'),(123,NULL,'empleados',113,'UPDATE','{\"id\": 113, \"dni\": \"TMP-871921261\", \"banco\": \"Banco Nacional de Costa Rica\", \"nombre\": \"Samantha\", \"apellido\": \"Autogenerado\", \"puesto_id\": null, \"horario_id\": null, \"cuenta_iban\": \"CR8.541653471572001e17\", \"salario_base\": \"0.00\", \"fecha_ingreso\": \"2026-04-11T06:00:00.000Z\", \"codigo_empleado\": \"USR-1775871921261\"}','{\"id\": 113, \"dni\": \"TMP-871921261\", \"banco\": \"Banco Nacional de Costa Rica\", \"nombre\": \"Samantha\", \"apellido\": \"Autogenerado\", \"puesto_id\": 13, \"horario_id\": null, \"cuenta_iban\": \"CR8.541653471572001e17\", \"salario_base\": \"0.00\", \"fecha_ingreso\": \"2026-04-11\", \"puesto_nombre\": null, \"horario_nombre\": null, \"codigo_empleado\": \"USR-1775871921261\"}','2026-04-22 14:01:21'),(124,NULL,'usuarios',100,'INSERT',NULL,'{\"rol\": \"Recursos Humanos\", \"estado\": 1, \"username\": \"Josue Chavarria\", \"dni_empleado\": \"206500345\", \"password_hash\": \"123456\", \"crear_empleado\": true, \"pregunta_seguridad\": \"cafe favorito\", \"respuesta_seguridad\": \"vainilla\"}','2026-04-22 17:10:10'),(125,NULL,'usuarios',101,'INSERT',NULL,'{\"rol\": \"Empleado\", \"estado\": 1, \"username\": \"Juan Perez\", \"dni_empleado\": \"206500344\", \"password_hash\": \"123456\", \"crear_empleado\": true, \"pregunta_seguridad\": \"nombre del animal favorito\", \"respuesta_seguridad\": \"Molly\"}','2026-04-22 17:21:14'),(126,NULL,'usuarios',102,'INSERT',NULL,'{\"rol\": \"Empleado\", \"estado\": 1, \"username\": \"miguel.bose\", \"dni_empleado\": \"206500343\", \"password_hash\": \"123456\", \"crear_empleado\": true, \"nombre_empleado\": \"Miguel \", \"apellido_empleado\": \"Bose\", \"pregunta_seguridad\": \"nombre del animal favorito\", \"respuesta_seguridad\": \"perro\"}','2026-04-22 19:43:22'),(127,NULL,'usuarios',102,'UPDATE','{\"id\": 102, \"rol\": \"Empleado\", \"token\": null, \"estado\": 1, \"username\": \"miguel.bose\", \"empleado_id\": 129, \"ultimo_login\": null, \"password_hash\": \"123456\", \"intentos_fallidos\": 0, \"pregunta_seguridad\": \"nombre del animal favorito\", \"respuesta_seguridad\": \"perro\"}','{\"id\": 102, \"rol\": \"Empleado\", \"token\": null, \"estado\": 1, \"username\": \"miguel.bose\", \"empleado_id\": 129, \"dni_empleado\": \"\", \"ultimo_login\": null, \"password_hash\": \"\", \"crear_empleado\": false, \"empleado_nombre\": \"Miguel Bose\", \"nombre_empleado\": \"\", \"apellido_empleado\": \"\", \"intentos_fallidos\": 0, \"pregunta_seguridad\": \"nombre del animal favorito\", \"respuesta_seguridad\": \"perro\"}','2026-04-22 19:43:40'),(128,NULL,'usuarios',102,'UPDATE','{\"id\": 102, \"rol\": \"Empleado\", \"token\": null, \"estado\": 1, \"username\": \"miguel.bose\", \"empleado_id\": 129, \"ultimo_login\": null, \"password_hash\": \"123456\", \"intentos_fallidos\": 0, \"pregunta_seguridad\": \"nombre del animal favorito\", \"respuesta_seguridad\": \"perro\"}','{\"id\": 102, \"rol\": \"Empleado\", \"token\": null, \"estado\": 1, \"username\": \"miguel.bose\", \"empleado_id\": 129, \"dni_empleado\": \"\", \"ultimo_login\": null, \"password_hash\": \"\", \"crear_empleado\": false, \"empleado_nombre\": \"Miguel Bose\", \"nombre_empleado\": \"\", \"apellido_empleado\": \"\", \"intentos_fallidos\": 0, \"pregunta_seguridad\": \"nombre del animal favorito\", \"respuesta_seguridad\": \"perro\"}','2026-04-22 19:44:08'),(129,NULL,'usuarios',102,'UPDATE','{\"id\": 102, \"rol\": \"Empleado\", \"token\": null, \"estado\": 1, \"username\": \"miguel.bose\", \"empleado_id\": 129, \"ultimo_login\": null, \"password_hash\": \"123456\", \"intentos_fallidos\": 0, \"pregunta_seguridad\": \"nombre del animal favorito\", \"respuesta_seguridad\": \"perro\"}','{\"id\": 102, \"rol\": \"Empleado\", \"token\": null, \"estado\": 1, \"username\": \"miguel.bose\", \"empleado_id\": 129, \"dni_empleado\": \"\", \"ultimo_login\": null, \"password_hash\": \"\", \"crear_empleado\": false, \"empleado_nombre\": \"Miguel Bose\", \"nombre_empleado\": \"\", \"apellido_empleado\": \"\", \"intentos_fallidos\": 0, \"pregunta_seguridad\": \"nombre del animal favorito\", \"respuesta_seguridad\": \"perro\"}','2026-04-22 19:45:05'),(130,NULL,'empleados',128,'UPDATE','{\"salario\": 0.0}','{\"salario\": 100000.0}','2026-04-22 20:51:20'),(131,NULL,'empleados',128,'UPDATE','{\"id\": 128, \"dni\": \"206500344\", \"banco\": null, \"nombre\": \"Juan Perez\", \"apellido\": \"\", \"puesto_id\": null, \"horario_id\": null, \"cuenta_iban\": null, \"salario_base\": \"0.00\", \"fecha_ingreso\": \"2026-04-22T06:00:00.000Z\", \"codigo_empleado\": \"EMP-2026128\"}','{\"id\": 128, \"dni\": \"206500344\", \"banco\": \"Banco de Costa Rica\", \"nombre\": \"Juan \", \"apellido\": \"Perez\", \"puesto_id\": 11, \"horario_id\": 6, \"cuenta_iban\": \"953641849565548\", \"salario_base\": 100000, \"fecha_ingreso\": \"2026-04-22\", \"puesto_nombre\": null, \"horario_nombre\": null, \"codigo_empleado\": \"EMP-2026128\"}','2026-04-22 20:51:20'),(132,NULL,'empleados',127,'UPDATE','{\"salario\": 0.0}','{\"salario\": 2000000.0}','2026-04-22 20:52:09'),(133,NULL,'empleados',127,'UPDATE','{\"id\": 127, \"dni\": \"206500345\", \"banco\": null, \"nombre\": \"Josue Chavarria\", \"apellido\": \"Autogenerado\", \"puesto_id\": null, \"horario_id\": null, \"cuenta_iban\": null, \"salario_base\": \"0.00\", \"fecha_ingreso\": \"2026-04-22T06:00:00.000Z\", \"codigo_empleado\": \"EMP-2026116\"}','{\"id\": 127, \"dni\": \"206500345\", \"banco\": \"Bac San Jose\", \"nombre\": \"Josue \", \"apellido\": \"Chavarria\", \"puesto_id\": 11, \"horario_id\": 1, \"cuenta_iban\": \"96522311445654\", \"salario_base\": 2000000, \"fecha_ingreso\": \"2026-04-22\", \"puesto_nombre\": null, \"horario_nombre\": null, \"codigo_empleado\": \"EMP-2026116\"}','2026-04-22 20:52:09'),(134,NULL,'usuarios',104,'INSERT',NULL,'{\"rol\": \"Administrador\", \"estado\": 1, \"username\": \"Administrador\", \"dni_empleado\": \"\", \"password_hash\": \"123456\", \"crear_empleado\": false, \"nombre_empleado\": \"\", \"apellido_empleado\": \"\", \"pregunta_seguridad\": \"Color Favorito?\", \"respuesta_seguridad\": \"Negro\"}','2026-04-25 07:39:16'),(135,NULL,'usuarios',103,'UPDATE','{\"id\": 103, \"rol\": \"Administrador\", \"token\": \"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2wiOiJBZG1pbmlzdHJhZG9yIiwidXNlcm5hbWUiOiJzYW1pLmNoYXZhIiwiZW1wbGVhZG9faWQiOm51bGwsInVzdWFyaW9faWQiOjEwMywiaWF0IjoxNzc3MTAzMjQ3LCJleHAiOjE3NzcxMTc2NDd9.2bHQAe00foOzt5P-MMaGWYnZFEgUfATWwKWxccjQhec\", \"estado\": 1, \"rol_id\": 1, \"username\": \"sami.chava\", \"empleado_id\": null, \"ultimo_login\": null, \"password_hash\": \"$2b$10$EBQPcrQB5zG40WHWAVBYROFCSY07GwTAtNCMHBPDs75zPLRoNgCMa\", \"intentos_fallidos\": 0, \"pregunta_seguridad\": null, \"respuesta_seguridad\": null}','{\"id\": 103, \"rol\": \"Empleado\", \"token\": \"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2wiOiJBZG1pbmlzdHJhZG9yIiwidXNlcm5hbWUiOiJzYW1pLmNoYXZhIiwiZW1wbGVhZG9faWQiOm51bGwsInVzdWFyaW9faWQiOjEwMywiaWF0IjoxNzc3MTAzMjQ3LCJleHAiOjE3NzcxMTc2NDd9.2bHQAe00foOzt5P-MMaGWYnZFEgUfATWwKWxccjQhec\", \"estado\": 1, \"rol_id\": 1, \"username\": \"sami.chava\", \"rol_nombre\": \"Administrador\", \"empleado_id\": null, \"dni_empleado\": \"\", \"ultimo_login\": null, \"password_hash\": \"\", \"crear_empleado\": false, \"empleado_nombre\": null, \"nombre_empleado\": \"\", \"apellido_empleado\": \"\", \"intentos_fallidos\": 0, \"pregunta_seguridad\": null, \"respuesta_seguridad\": null}','2026-04-25 07:47:51');
/*!40000 ALTER TABLE `auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ausencias_incapacidades`
--

DROP TABLE IF EXISTS `ausencias_incapacidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ausencias_incapacidades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `empleado_id` int NOT NULL,
  `tipo` enum('Incapacidad CCSS','Incapacidad INS','Vacaciones','Permiso sin goce','Permiso con goce') NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `estado` enum('Pendiente','Aprobado','Rechazado') DEFAULT 'Pendiente',
  `observacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `empleado_id` (`empleado_id`),
  CONSTRAINT `fk_ausencias_empleado` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ausencias_incapacidades`
--

LOCK TABLES `ausencias_incapacidades` WRITE;
/*!40000 ALTER TABLE `ausencias_incapacidades` DISABLE KEYS */;
INSERT INTO `ausencias_incapacidades` (`id`, `empleado_id`, `tipo`, `fecha_inicio`, `fecha_fin`, `estado`, `observacion`) VALUES (1,2,'Incapacidad CCSS','2026-02-04','2026-02-06','Aprobado','Gripe Fuerte'),(2,5,'Vacaciones','2026-02-10','2026-02-15','Aprobado','Viaje familiar a Guanacaste'),(3,10,'Permiso sin goce','2026-02-05','2026-02-05','Pendiente','Trámite personal bancario');
/*!40000 ALTER TABLE `ausencias_incapacidades` ENABLE KEYS */;
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
  `porcentaje` decimal(5,2) DEFAULT '0.00',
  `monto_fijo` decimal(12,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conceptos`
--

LOCK TABLES `conceptos` WRITE;
/*!40000 ALTER TABLE `conceptos` DISABLE KEYS */;
INSERT INTO `conceptos` (`id`, `nombre`, `tipo`, `es_ley`, `porcentaje`, `monto_fijo`) VALUES (1,'C.C.S.S. (9.67%)','Deduccion',1,9.67,0.00),(2,'Impuesto sobre la Renta','Deduccion',1,0.00,0.00),(3,'Asociación Solidarista','Deduccion',0,0.00,0.00),(4,'Horas Extra Dobles','Ingreso',0,0.00,0.00),(5,'Anualidad','Ingreso',0,0.00,0.00),(6,'Bono por Conectividad','Ingreso',0,0.00,0.00),(7,'Comisiones sobre Ventas','Ingreso',0,0.00,0.00),(8,'Bono por Productividad','Ingreso',0,0.00,0.00),(9,'Auxilio de Transporte','Ingreso',0,0.00,0.00),(10,'Pago de Viáticos (Gravables)','Ingreso',0,0.00,0.00),(11,'Reconocimiento por Antigüedad','Ingreso',0,0.00,0.00),(12,'Incentivo por Idiomas','Ingreso',0,0.00,0.00),(13,'Ajuste Salarial Retroactivo','Ingreso',0,0.00,0.00),(14,'Embargo Judicial (Alimentario)','Deduccion',1,0.00,0.00),(15,'Embargo Judicial (Comercial)','Deduccion',1,0.00,0.00),(16,'Cuota Asociación Solidarista','Deduccion',0,0.00,0.00),(17,'Aporte a Cooperativa','Deduccion',0,0.00,0.00),(18,'Seguro de Vida Colectivo','Deduccion',0,0.00,0.00),(19,'Préstamo Asociación/Caja','Deduccion',0,0.00,0.00),(20,'Deducción por Llegada Tardía','Deduccion',0,0.00,0.00),(24,'concepto_auditoria','Ingreso',1,0.00,0.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` (`id`, `nombre`) VALUES (1,'Talento Humano Prueba'),(2,'TI'),(3,'Recursos Humanos'),(4,'Contabilidad'),(5,'Ventas'),(6,'Operaciones'),(7,'Logística'),(8,'Legal'),(9,'Mantenimiento'),(10,'Mercadeo'),(11,'Servicio al Cliente'),(12,'Calidad'),(13,'Seguridad'),(14,'Compras'),(15,'Salud Ocupacional'),(16,'I+D'),(17,'Proyectos'),(18,'Auditoría'),(19,'Tesorería'),(20,'Bodega'),(21,'Recursos Humanos Prueba'),(22,'depto_auditoria'),(50,'Administración'),(51,'Tecnología');
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
  `horario_id` int DEFAULT NULL,
  `cuenta_iban` varchar(50) DEFAULT NULL,
  `banco` varchar(100) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo_empleado` (`codigo_empleado`),
  UNIQUE KEY `dni` (`dni`),
  KEY `puesto_id` (`puesto_id`),
  KEY `fk_empleado_horario` (`horario_id`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`puesto_id`) REFERENCES `puestos` (`id`),
  CONSTRAINT `fk_empleado_horario` FOREIGN KEY (`horario_id`) REFERENCES `horarios` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=521 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` (`id`, `codigo_empleado`, `nombre`, `apellido`, `dni`, `fecha_ingreso`, `salario_base`, `puesto_id`, `horario_id`, `cuenta_iban`, `banco`, `estado`) VALUES (2,'EMP-2026002','Esteban','Ramírez','5-4973-0821','2018-07-22',934693.38,6,1,'CR8.701842807886976e17','BAC Credomatic',1),(3,'EMP-2026003','Julia','Pérez','2-6178-5547','2018-07-17',993740.55,6,1,'CR1.4811110603447174e1','Banco Nacional de Costa Rica',1),(4,'EMP-2026004','Julia','Pérez','8-3511-2379','2024-12-24',1596796.54,5,1,'CR1.3000271853991106e1','BAC Credomatic',1),(5,'EMP-2026005','Esteban','González','2-0694-9548','2021-06-14',746604.21,11,1,'CR2.0568030532978506e1','Banco Nacional de Costa Rica',1),(6,'EMP-2026006','Beatriz','Castro','7-0463-1908','2019-05-28',1000427.16,12,1,'CR06.38393401762837e17','BAC Credomatic',1),(7,'EMP-2026007','Andrés','Pérez','5-8658-9408','2025-03-23',1871169.72,3,1,'CR5.749261235584748e17','Banco Nacional de Costa Rica',1),(8,'EMP-2026008','Carlos','Mora','7-7414-4869','2024-05-17',709023.57,11,1,'CR9.594504432375082e17','BAC Credomatic',1),(9,'EMP-2026009','Diana','Pérez','1-4891-2127','2021-03-16',484321.32,8,1,'CR7.247387624576118e16','Banco Nacional de Costa Rica',1),(10,'EMP-2026010','Julia','Jiménez','6-2896-5005','2020-11-23',1866807.40,7,1,'CR4.8401808224992646e1','BAC Credomatic',1),(11,'EMP-2026011','Esteban','Sánchez','9-5842-1634','2025-07-28',2083261.69,4,1,'CR2.0266881324599386e1','Banco Nacional de Costa Rica',1),(12,'EMP-2026012','Julia','Rojas','6-7315-9772','2020-06-02',502761.15,13,1,'CR5.6128985021383494e1','BAC Credomatic',1),(13,'EMP-2026013','Fabiana','González','2-0696-9432','2021-12-06',2070953.61,4,1,'CR1.984428420648378e17','Banco Nacional de Costa Rica',1),(14,'EMP-2026014','Andrés','Blanco','1-2206-0080','2022-12-30',986725.05,6,1,'CR3.083446904163292e17','BAC Credomatic',1),(15,'EMP-2026015','Carlos','Ramírez','1-8261-8510','2019-09-21',1133066.54,9,1,'CR9.463949566207779e17','Banco Nacional de Costa Rica',1),(16,'EMP-2026016','Diana','Jiménez','9-9188-8362','2022-08-12',1011492.52,12,1,'CR8.069407425885468e17','BAC Credomatic',1),(17,'EMP-2026017','Iván','Sánchez','3-7813-2139','2020-02-22',1898577.63,3,1,'CR1.9551887381404534e1','Banco Nacional de Costa Rica',1),(18,'EMP-2026018','Hellen','Pérez','6-0531-5261','2022-03-25',527866.22,8,1,'CR5.567721720382312e17','BAC Credomatic',1),(19,'EMP-2026019','Esteban','Mora','8-6679-7959','2018-01-31',1549280.96,5,1,'CR1.9730426948266502e1','Banco Nacional de Costa Rica',1),(20,'EMP-2026020','Fabiana','Sánchez','3-9908-1714','2018-11-02',1890874.82,7,1,'CR3.162048620322764e17','BAC Credomatic',1),(21,'EMP-2026021','Iván','Castro','1-3090-3047','2021-03-14',856902.40,14,1,'CR9.891115324470322e17','Banco Nacional de Costa Rica',1),(22,'EMP-2026022','Fabiana','Vargas','4-8861-3251','2018-02-27',1186059.79,9,1,'CR9.969431068719766e17','BAC Credomatic',1),(23,'EMP-2026023','Esteban','Ramírez','4-0140-0549','2024-03-11',1199826.05,9,1,'CR1.738096775243149e16','Banco Nacional de Costa Rica',1),(24,'EMP-2026024','Carlos','Ramírez','9-6608-3550','2019-08-04',1789916.35,15,1,'CR9.607554887987259e16','BAC Credomatic',1),(25,'EMP-2026025','Beatriz','Pérez','8-4008-4636','2025-02-25',3518698.66,1,1,'CR4.282348718757135e17','Banco Nacional de Costa Rica',1),(26,'EMP-2026026','Fabiana','Rojas','1-2809-3560','2018-05-27',511958.83,13,1,'CR8.529477434725946e17','BAC Credomatic',1),(27,'EMP-2026027','Carlos','Vargas','3-8043-0597','2018-10-30',1824846.46,3,1,'CR9.800341324694772e17','Banco Nacional de Costa Rica',1),(28,'EMP-2026028','Fabiana','Sánchez','4-4027-8125','2019-01-30',3583619.27,1,1,'CR3.413274626632477e17','BAC Credomatic',1),(29,'EMP-2026029','Gabriel','Vargas','9-3388-7281','2020-12-21',3593796.73,1,1,'CR7.665349466414516e17','Banco Nacional de Costa Rica',1),(30,'EMP-2026030','Iván','González','7-2094-8869','2019-06-24',687151.82,11,1,'CR008.0869237595116e17','BAC Credomatic',1),(31,'EMP-2026031','Esteban','Mora','9-5658-0548','2021-05-14',1571825.39,5,1,'CR7.438570705650906e17','Banco Nacional de Costa Rica',1),(32,'EMP-2026032','Iván','Sánchez','9-9138-6557','2021-09-09',971885.79,6,1,'CR2.932082557056176e17','BAC Credomatic',1),(33,'EMP-2026033','Julia','Castro','3-0417-5056','2022-10-15',1749992.81,15,1,'CR2.3447009756646128e1','Banco Nacional de Costa Rica',1),(34,'EMP-2026034','Carlos','Blanco','2-4730-8865','2025-12-27',490896.39,13,1,'CR2.9272575144909856e1','BAC Credomatic',1),(35,'EMP-2026035','Andrés','Castro','9-1369-7726','2022-05-21',1894409.26,7,1,'CR07.60218495279754e17','Banco Nacional de Costa Rica',1),(36,'EMP-2026036','Diana','Blanco','8-7498-0880','2024-07-15',2268836.81,10,1,'CR9.229152527851195e17','BAC Credomatic',1),(37,'EMP-2026037','Iván','González','9-9394-8689','2021-10-11',2002546.33,4,1,'CR3.339208088199802e17','Banco Nacional de Costa Rica',1),(38,'EMP-2026038','Fabiana','Jiménez','9-4470-4528','2018-07-08',1725842.19,15,1,'CR9.008583164781875e17','BAC Credomatic',1),(39,'EMP-2026039','Fabiana','Pérez','7-1202-5033','2024-10-26',2227135.48,10,1,'CR05.02529186664642e17','Banco Nacional de Costa Rica',1),(40,'EMP-2026040','Iván','Jiménez','3-9640-9948','2025-06-04',992689.31,12,1,'CR8.100710146222925e17','BAC Credomatic',1),(41,'EMP-2026041','Iván','Sánchez','1-4914-3083','2025-07-20',491132.64,8,1,'CR5.4276754385118144e1','Banco Nacional de Costa Rica',1),(42,'EMP-2026042','Iván','Mora','2-7186-0466','2025-06-20',2524520.67,2,1,'CR2.8362470612267472e1','BAC Credomatic',1),(43,'EMP-2026043','Julia','González','2-2655-7645','2025-11-19',1883887.72,3,1,'CR7.898209297934742e17','Banco Nacional de Costa Rica',1),(44,'EMP-2026044','Beatriz','Mora','4-2429-0873','2020-04-15',877784.95,14,1,'CR9.823056133299187e16','BAC Credomatic',1),(45,'EMP-2026045','Carlos','Ramírez','7-3541-5003','2022-06-29',519689.57,13,1,'CR1.2169004801818174e1','Banco Nacional de Costa Rica',1),(46,'EMP-2026046','Beatriz','Castro','1-8129-8094','2021-02-07',1561387.26,5,1,'CR3.137585868255781e17','BAC Credomatic',1),(47,'EMP-2026047','Carlos','Rojas','7-6713-1862','2018-07-28',3502614.84,1,1,'CR2.037228208069902e17','Banco Nacional de Costa Rica',1),(48,'EMP-2026048','Diana','Pérez','6-4445-3690','2021-11-24',895178.37,14,1,'CR7.733837429186178e16','BAC Credomatic',1),(49,'EMP-2026049','Hellen','González','1-0807-3603','2021-07-03',971726.42,6,1,'CR7.755234397719832e17','Banco Nacional de Costa Rica',1),(50,'EMP-2026050','Julia','Rojas','1-8301-9893','2022-05-08',681538.54,11,1,'CR6.456021067179759e17','BAC Credomatic',1),(51,'EMP-2026051','Carlos','Mora','5-1432-1437','2023-09-23',901387.03,6,1,'CR9.014402450075748e17','Banco Nacional de Costa Rica',1),(52,'EMP-2026052','Carlos','Blanco','2-0143-4385','2024-11-14',1743420.38,15,1,'CR5.7039493561759123e1','BAC Credomatic',1),(53,'EMP-2026053','Hellen','Rojas','8-9751-2632','2022-11-23',1716304.32,15,1,'CR1.476539737988766e17','Banco Nacional de Costa Rica',1),(54,'EMP-2026054','Gabriel','Castro','3-9946-0164','2025-04-19',994062.86,12,1,'CR2.7085092875254428e1','BAC Credomatic',1),(55,'EMP-2026055','Julia','González','9-9055-7709','2024-12-19',487732.82,13,1,'CR6.924635737132873e17','Banco Nacional de Costa Rica',1),(56,'EMP-2026056','Esteban','González','5-3243-2283','2024-09-19',1115788.73,9,1,'CR3.810626206743183e17','BAC Credomatic',1),(57,'EMP-2026057','Carlos','Blanco','4-9069-4953','2019-11-22',1829436.37,3,1,'CR8.279224129653745e17','Banco Nacional de Costa Rica',1),(58,'EMP-2026058','Carlos','Sánchez','2-7317-1826','2020-03-16',954126.42,12,1,'CR9.964242335375624e17','BAC Credomatic',1),(59,'EMP-2026059','Andrés','Sánchez','9-5355-7735','2023-12-16',748551.25,11,1,'CR4.983539595253337e17','Banco Nacional de Costa Rica',1),(60,'EMP-2026060','Beatriz','Castro','4-5419-6133','2022-06-25',486406.51,13,1,'CR5.024971277476261e17','BAC Credomatic',1),(61,'EMP-2026061','Esteban','Rojas','1-1237-3029','2024-12-03',530865.89,8,1,'CR1.7423790895774764e1','Banco Nacional de Costa Rica',1),(62,'EMP-2026062','Gabriel','Jiménez','5-9671-2548','2023-01-15',909938.32,6,1,'CR5.796276019696403e17','BAC Credomatic',1),(63,'EMP-2026063','Diana','Vargas','1-1432-5441','2023-09-17',2282302.49,10,1,'CR8.458666678945224e17','Banco Nacional de Costa Rica',1),(64,'EMP-2026064','Carlos','Castro','4-5565-5457','2025-08-13',1865782.99,7,1,'CR4.9045056429733574e1','BAC Credomatic',1),(65,'EMP-2026065','Beatriz','Vargas','4-0231-0523','2024-07-09',2080502.93,4,1,'CR9.146528485367566e17','Banco Nacional de Costa Rica',1),(66,'EMP-2026066','Esteban','Pérez','6-5224-6873','2018-12-17',978584.87,12,1,'CR1.0191258052542115e1','BAC Credomatic',1),(67,'EMP-2026067','Iván','González','9-9489-9812','2025-08-11',1835478.88,3,1,'CR7.656043877504806e17','Banco Nacional de Costa Rica',1),(68,'EMP-2026068','Fabiana','Blanco','3-0286-4018','2018-07-08',2541132.87,2,1,'CR05.22284227909785e17','BAC Credomatic',1),(69,'EMP-2026069','Carlos','Sánchez','8-4143-5150','2023-05-17',961607.98,12,1,'CR3.146080070311278e17','Banco Nacional de Costa Rica',1),(70,'EMP-2026070','Fabiana','Vargas','5-3795-4974','2023-03-29',1125005.76,9,1,'CR6.187382159929147e15','BAC Credomatic',1),(71,'EMP-2026071','Carlos','González','3-7559-9013','2024-02-20',699214.67,11,1,'CR8.711292043990728e16','Banco Nacional de Costa Rica',1),(72,'EMP-2026072','Hellen','González','4-7983-7317','2023-12-08',1112443.75,9,1,'CR4.170024864533939e17','BAC Credomatic',1),(73,'EMP-2026073','Iván','Castro','2-5805-5070','2019-08-02',1844640.52,7,1,'CR8.236737016808928e17','Banco Nacional de Costa Rica',1),(74,'EMP-2026074','Iván','Blanco','8-0996-8635','2025-12-10',1850633.25,3,1,'CR8.673610797779272e17','BAC Credomatic',1),(75,'EMP-2026075','Esteban','Pérez','8-5653-4076','2023-04-17',698769.25,11,1,'CR8.657843245806026e17','Banco Nacional de Costa Rica',1),(76,'EMP-2026076','Esteban','Vargas','5-1322-0944','2025-06-25',2209356.47,10,1,'CR7.268384143028767e17','BAC Credomatic',1),(77,'EMP-2026077','Carlos','Blanco','4-6849-2021','2018-04-01',1817359.48,3,1,'CR3.683912850622006e16','Banco Nacional de Costa Rica',1),(78,'EMP-2026078','Julia','Ramírez','4-8735-2302','2021-09-30',2296052.54,10,1,'CR3.680430356115503e15','BAC Credomatic',1),(79,'EMP-2026079','Carlos','Sánchez','1-9634-8031','2025-01-25',1521907.13,5,1,'CR9.078847969955624e17','Banco Nacional de Costa Rica',1),(80,'EMP-2026080','Hellen','Blanco','9-3640-0204','2026-01-08',548856.40,8,1,'CR5.283827246431101e17','BAC Credomatic',1),(81,'EMP-2026081','Julia','Vargas','3-4691-4912','2025-09-13',727017.95,11,1,'CR9.182592629625083e17','Banco Nacional de Costa Rica',1),(82,'EMP-2026082','Hellen','González','9-4174-1116','2023-08-05',2519306.83,2,1,'CR6.148171616856169e15','BAC Credomatic',1),(83,'EMP-2026083','Andrés','Jiménez','9-4360-2991','2024-07-24',454037.28,13,1,'CR2.759630999304011e17','Banco Nacional de Costa Rica',1),(84,'EMP-2026084','Gabriel','Mora','9-0384-4291','2025-11-08',2586391.47,2,1,'CR3.613710155350818e17','BAC Credomatic',1),(85,'EMP-2026085','Carlos','Vargas','9-4605-4935','2025-05-23',3595088.46,1,1,'CR9.789658086178505e17','Banco Nacional de Costa Rica',1),(86,'EMP-2026086','Esteban','Jiménez','1-6734-2724','2023-04-18',989111.69,6,1,'CR8.107160272176527e17','BAC Credomatic',1),(87,'EMP-2026087','Esteban','Ramírez','4-0879-2597','2025-10-25',1139536.39,9,1,'CR1.1668274096835659e1','Banco Nacional de Costa Rica',1),(88,'EMP-2026088','Iván','Sánchez','2-4961-9219','2025-02-06',1784238.26,15,1,'CR1.5126565392246995e1','BAC Credomatic',1),(89,'EMP-2026089','Iván','Castro','2-7658-4817','2025-03-10',1811101.04,7,1,'CR4.0628007744092506e1','Banco Nacional de Costa Rica',1),(90,'EMP-2026090','Carlos','Castro','8-9614-1763','2017-11-28',2045773.04,4,1,'CR5.776034561708602e17','BAC Credomatic',1),(91,'EMP-2026091','Carlos','Sánchez','6-7198-8110','2018-09-30',454484.65,8,1,'CR6.691770792651708e17','Banco Nacional de Costa Rica',1),(92,'EMP-2026092','Fabiana','Vargas','4-3502-6017','2018-03-26',1898573.39,3,1,'CR6.130750585469184e17','BAC Credomatic',1),(93,'EMP-2026093','Andrés','Rojas','1-0792-0771','2024-11-19',2550918.39,2,1,'CR5.784408567272507e16','Banco Nacional de Costa Rica',1),(94,'EMP-2026094','Beatriz','Blanco','9-5183-6525','2020-04-15',2558144.99,2,1,'CR4.499952834565149e17','BAC Credomatic',1),(95,'EMP-2026095','Hellen','Sánchez','8-1009-9925','2020-09-05',1132234.77,9,1,'CR7.644419099804405e16','Banco Nacional de Costa Rica',1),(96,'EMP-2026096','Gabriel','Sánchez','1-9373-3919','2024-11-21',3556149.91,1,1,'CR3.223513535432065e16','BAC Credomatic',1),(97,'EMP-2026097','Diana','Sánchez','2-3163-9241','2020-07-31',958849.46,6,1,'CR9.318431345111162e17','Banco Nacional de Costa Rica',1),(98,'EMP-2026098','Julia','Pérez','6-8824-5566','2024-12-26',450924.56,8,1,'CR5.625102972262634e17','BAC Credomatic',1),(99,'EMP-2026099','Gabriel','Sánchez','7-8538-1593','2024-03-03',2569837.48,2,1,'CR1.7022113331614168e1','Banco Nacional de Costa Rica',1),(100,'EMP-2026100','Hellen','Pérez','4-7821-5997','2020-09-28',696274.95,11,1,'CR3.975797057129254e17','BAC Credomatic',1),(101,'EMP-2026101','Mario','Chaves','2-0123-0456','2026-02-06',750000.00,2,1,'CR9.368322193034292e17','Banco Nacional de Costa Rica',1),(106,'TEST-02','Maria','Prueba','1-TEST-5678','2026-03-20',500000.00,2,3,'CR4.9142201011201555e1','BAC Credomatic',1),(107,'USR-1774057451439','audit_test_user','Autogenerado','000000000','2026-03-21',0.00,4,4,'CR6.466134233834348e17','Banco Nacional de Costa Rica',1),(108,'EMP-AUD','Test','Aud','00','2026-03-20',1.00,1,1,'CR7.588011173147718e17','BAC Credomatic',1),(113,'USR-1775871921261','Samantha','Autogenerado','TMP-871921261','2026-04-11',0.00,13,NULL,'CR8.541653471572001e17','Banco Nacional de Costa Rica',1),(114,'USR-1775871980695','Cristopher','Autogenerado','TMP-871980695','2026-04-11',0.00,NULL,NULL,'CR9.944234145753303e17','BAC Credomatic',1),(115,'EMP-2026115','Maria ','Solera','2065548795','2026-04-21',100000.00,2,2,NULL,NULL,1),(127,'EMP-2026116','Josue ','Chavarria','206500345','2026-04-22',2000000.00,11,1,'96522311445654','Bac San Jose',1),(128,'EMP-2026128','Juan ','Perez','206500344','2026-04-22',100000.00,11,6,'953641849565548','Banco de Costa Rica',1),(129,'EMP-2026129','Miguel','Bose','206500343','2026-04-22',0.00,NULL,NULL,NULL,NULL,1),(501,'EMP-501','Andrés','García','1-0001-0501','2023-01-15',1250000.00,50,1,NULL,NULL,1),(502,'EMP-502','Beatriz','López','2-0002-0502','2023-02-20',850000.00,51,1,NULL,NULL,1),(503,'EMP-503','Carlos','Pérez','3-0003-0503','2023-03-10',950000.00,51,1,NULL,NULL,1),(504,'EMP-504','Daniela','Rodríguez','4-0004-0504','2023-04-05',650000.00,52,1,NULL,NULL,1),(505,'EMP-505','Eduardo','Sánchez','5-0005-0505','2023-05-12',700000.00,52,1,NULL,NULL,1),(506,'EMP-506','Fernanda','Ramírez','6-0006-0506','2023-06-18',1100000.00,50,1,NULL,NULL,1),(507,'EMP-507','Gabriel','Torres','7-0007-0507','2023-07-22',900000.00,51,1,NULL,NULL,1),(508,'EMP-508','Helena','Vargas','8-0008-0508','2023-08-30',600000.00,52,1,NULL,NULL,1),(509,'EMP-509','Iván','Castro','9-0009-0509','2023-09-14',1350000.00,50,1,NULL,NULL,1),(510,'EMP-510','Julia','Ortiz','1-0010-0510','2023-10-25',820000.00,51,1,NULL,NULL,1),(511,'EMP-511','Kevin','Mendoza','2-0011-0511','2024-01-05',680000.00,52,1,NULL,NULL,1),(512,'EMP-512','Lucía','Blanco','3-0012-0512','2024-02-12',1050000.00,50,1,NULL,NULL,1),(513,'EMP-513','Mario','Delgado','4-0013-0513','2024-03-20',880000.00,51,1,NULL,NULL,1),(514,'EMP-514','Natalia','Rojas','5-0014-0514','2024-04-15',620000.00,52,1,NULL,NULL,1),(515,'EMP-515','Oscar','Herrera','6-0015-0515','2024-05-10',1450000.00,50,1,NULL,NULL,1),(516,'EMP-516','Patricia','Jiménez','7-0016-0516','2024-06-05',780000.00,51,1,NULL,NULL,1),(517,'EMP-517','Ricardo','Solano','8-0017-0517','2024-07-01',920000.00,51,1,NULL,NULL,1),(518,'EMP-518','Sofía','Quesada','9-0018-0518','2024-08-15',640000.00,52,1,NULL,NULL,1),(519,'EMP-519','Tomás','Marín','1-0019-0519','2024-09-10',1150000.00,50,1,NULL,NULL,1),(520,'EMP-520','Valeria','Campos','2-0020-0520','2024-10-12',800000.00,51,1,NULL,NULL,1);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tg_empleado_codigo_auto` BEFORE INSERT ON `empleados` FOR EACH ROW BEGIN
    DECLARE next_id INT;
    
    -- Si el código viene vacío, nulo o con el texto temporal del frontend
    IF NEW.codigo_empleado IS NULL OR NEW.codigo_empleado = '' OR NEW.codigo_empleado = 'Generando...' THEN
        
        -- Buscamos cuál será el próximo ID automático de esta tabla
        SELECT AUTO_INCREMENT INTO next_id
        FROM information_schema.tables
        WHERE table_name = 'empleados' AND table_schema = DATABASE();
        
        -- Por seguridad, si no lo encuentra (tabla vacía), inicia en 1
        IF next_id IS NULL THEN
            SET next_id = 1;
        END IF;

        -- Armamos el código final: EMP- + AÑO + ID (con ceros a la izquierda)
        SET NEW.codigo_empleado = CONCAT('EMP-', YEAR(CURDATE()), LPAD(next_id, 3, '0'));
        
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
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
-- Table structure for table `horarios`
--

DROP TABLE IF EXISTS `horarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `hora_entrada` time NOT NULL,
  `hora_salida` time NOT NULL,
  `dias_laborables` varchar(50) DEFAULT 'L-V',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios`
--

LOCK TABLES `horarios` WRITE;
/*!40000 ALTER TABLE `horarios` DISABLE KEYS */;
INSERT INTO `horarios` (`id`, `nombre`, `hora_entrada`, `hora_salida`, `dias_laborables`) VALUES (1,'Diurno Ordinario','08:00:00','17:00:00','L-V'),(2,'Nocturno Fijo','22:00:00','06:00:00','L-V'),(3,'Jornada Continua / Call Center','06:00:00','14:00:00','L-S'),(4,'Medio Tiempo','08:00:00','12:00:00','L-S'),(5,'Jornada de Fin de Semana','08:00:00','17:00:00','S-D'),(6,'horario_auditoria','00:00:00','01:00:00','L');
/*!40000 ALTER TABLE `horarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liquidaciones`
--

DROP TABLE IF EXISTS `liquidaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `liquidaciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `empleado_id` int NOT NULL,
  `fecha_salida` date NOT NULL,
  `motivo` enum('Renuncia','Despido con responsabilidad','Despido sin responsabilidad') NOT NULL,
  `monto_aguinaldo` decimal(12,2) DEFAULT NULL,
  `monto_vacaciones` decimal(12,2) DEFAULT NULL,
  `monto_preaviso` decimal(12,2) DEFAULT NULL,
  `monto_cesantia` decimal(12,2) DEFAULT NULL,
  `total_liquidacion` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liquidaciones`
--

LOCK TABLES `liquidaciones` WRITE;
/*!40000 ALTER TABLE `liquidaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `liquidaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas_asistencia`
--

DROP TABLE IF EXISTS `marcas_asistencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcas_asistencia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `empleado_id` int NOT NULL,
  `fecha` date NOT NULL,
  `hora_entrada` time DEFAULT NULL,
  `hora_salida` time DEFAULT NULL,
  `estado` enum('Presente','Ausente','Llegada Tardía','Incapacidad','Vacaciones') DEFAULT 'Presente',
  PRIMARY KEY (`id`),
  KEY `empleado_id` (`empleado_id`),
  CONSTRAINT `fk_marcas_empleado` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas_asistencia`
--

LOCK TABLES `marcas_asistencia` WRITE;
/*!40000 ALTER TABLE `marcas_asistencia` DISABLE KEYS */;
INSERT INTO `marcas_asistencia` (`id`, `empleado_id`, `fecha`, `hora_entrada`, `hora_salida`, `estado`) VALUES (1,2,'2026-02-02','07:55:00','17:05:00','Presente'),(2,3,'2026-02-02','07:55:00','17:05:00','Presente'),(3,4,'2026-02-02','07:55:00','17:05:00','Presente'),(4,5,'2026-02-02','07:55:00','17:05:00','Presente'),(5,6,'2026-02-02','07:55:00','17:05:00','Presente'),(6,7,'2026-02-02','07:55:00','17:05:00','Presente'),(7,8,'2026-02-02','07:55:00','17:05:00','Presente'),(8,9,'2026-02-02','07:55:00','17:05:00','Presente'),(9,10,'2026-02-02','07:55:00','17:05:00','Presente'),(10,11,'2026-02-02','07:55:00','17:05:00','Presente'),(11,12,'2026-02-02','07:55:00','17:05:00','Presente'),(12,13,'2026-02-02','07:55:00','17:05:00','Presente'),(13,14,'2026-02-02','07:55:00','17:05:00','Presente'),(14,15,'2026-02-02','07:55:00','17:05:00','Presente'),(15,16,'2026-02-02','07:55:00','17:05:00','Presente'),(16,17,'2026-02-02','07:55:00','17:05:00','Presente'),(17,18,'2026-02-02','07:55:00','17:05:00','Presente'),(18,19,'2026-02-02','07:55:00','17:05:00','Presente'),(19,20,'2026-02-02','07:55:00','17:05:00','Presente'),(32,21,'2026-02-03','08:15:00','17:00:00','Llegada Tardía'),(33,22,'2026-02-03','08:15:00','17:00:00','Llegada Tardía'),(34,23,'2026-02-03','08:15:00','17:00:00','Llegada Tardía'),(35,24,'2026-02-03','08:15:00','17:00:00','Llegada Tardía'),(36,25,'2026-02-03','08:15:00','17:00:00','Llegada Tardía'),(37,26,'2026-02-03','08:15:00','17:00:00','Llegada Tardía'),(38,27,'2026-02-03','08:15:00','17:00:00','Llegada Tardía'),(39,28,'2026-02-03','08:15:00','17:00:00','Llegada Tardía'),(40,29,'2026-02-03','08:15:00','17:00:00','Llegada Tardía'),(41,30,'2026-02-03','08:15:00','17:00:00','Llegada Tardía');
/*!40000 ALTER TABLE `marcas_asistencia` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos_planilla`
--

LOCK TABLES `movimientos_planilla` WRITE;
/*!40000 ALTER TABLE `movimientos_planilla` DISABLE KEYS */;
INSERT INTO `movimientos_planilla` (`id`, `empleado_id`, `periodo_id`, `concepto_id`, `monto_calculado`) VALUES (2,2,1,1,90384.85),(3,3,1,1,96094.71),(4,4,1,1,154410.23),(5,5,1,1,72196.63),(6,6,1,1,96741.31),(7,7,1,1,180942.11),(8,8,1,1,68562.58),(9,9,1,1,46833.87),(10,10,1,1,180520.28),(11,11,1,1,201451.41),(12,12,1,1,48617.00),(13,13,1,1,200261.21),(14,14,1,1,95416.31),(15,15,1,1,109567.53),(16,16,1,1,97811.33),(17,17,1,1,183592.46),(18,18,1,1,51044.66),(19,19,1,1,149815.47),(20,20,1,1,182847.60),(21,21,1,1,82862.46),(22,22,1,1,114691.98),(23,23,1,1,116023.18),(24,24,1,1,173084.91),(25,25,1,1,340258.16),(26,26,1,1,49506.42),(27,27,1,1,176462.65),(28,28,1,1,346535.98),(29,29,1,1,347520.14),(30,30,1,1,66447.58),(31,31,1,1,151995.52),(32,32,1,1,93981.36),(33,33,1,1,169224.30),(34,34,1,1,47469.68),(35,35,1,1,183189.38),(36,36,1,1,219396.52),(37,37,1,1,193646.23),(38,38,1,1,166888.94),(39,39,1,1,215364.00),(40,40,1,1,95993.06),(41,41,1,1,47492.53),(42,42,1,1,244121.15),(43,43,1,1,182171.94),(44,44,1,1,84881.80),(45,45,1,1,50253.98),(46,46,1,1,150986.15),(47,47,1,1,338702.86),(48,48,1,1,86563.75),(49,49,1,1,93965.94),(50,50,1,1,65904.78),(51,51,1,1,87164.13),(52,52,1,1,168588.75),(53,53,1,1,165966.63),(54,54,1,1,96125.88),(55,55,1,1,47163.76),(56,56,1,1,107896.77),(57,57,1,1,176906.50),(58,58,1,1,92264.02),(59,59,1,1,72384.91),(60,60,1,1,47035.51),(61,61,1,4,22536.23),(62,62,1,4,25708.81),(63,63,1,4,15935.33),(64,64,1,4,17550.21),(65,65,1,4,24945.09),(66,66,1,4,27074.82),(67,67,1,4,15538.84),(68,68,1,4,41469.73),(69,69,1,4,25732.15),(70,70,1,4,19251.53),(71,71,1,4,34061.21),(72,72,1,4,37551.47),(73,73,1,4,40573.70),(74,74,1,4,15214.10),(75,75,1,4,29349.40),(76,76,1,4,26104.71),(77,77,1,4,27475.37),(78,78,1,4,44062.69),(79,79,1,4,32887.36),(80,80,1,4,17248.71),(81,81,1,4,63436.58),(82,82,1,5,48734.34),(83,83,1,4,35959.98),(84,84,1,4,60970.83),(85,85,1,4,56746.96),(86,86,1,5,43544.32),(87,87,1,5,51377.89),(88,88,1,5,34534.94),(89,89,1,5,25592.40),(90,90,1,5,64948.96),(91,91,1,5,54921.71),(92,92,1,5,40115.11),(93,93,1,5,26322.31),(94,94,1,5,72676.91),(95,95,1,4,53450.70),(96,96,1,5,63779.84),(97,97,1,4,59218.23),(98,98,1,4,65403.03),(99,99,1,5,33350.40),(100,100,1,5,52150.44),(102,46,1,12,100000.00),(103,501,502,1,120875.00),(104,502,502,1,82195.00),(105,503,502,1,91865.00),(106,504,502,1,62855.00),(107,505,502,1,67690.00),(108,506,502,1,106370.00),(109,507,502,1,87030.00),(110,508,502,1,58020.00),(111,509,502,1,130545.00),(112,510,502,1,79294.00),(113,511,502,1,65756.00),(114,512,502,1,101535.00),(115,513,502,1,85096.00),(116,514,502,1,59954.00),(117,515,502,1,140215.00),(118,516,502,1,75426.00),(119,517,502,1,88964.00),(120,518,502,1,61888.00),(121,519,502,1,111205.00),(122,520,502,1,77360.00),(134,501,502,8,150000.00),(135,509,502,8,200000.00),(136,503,502,4,45000.00),(137,512,502,19,60000.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=503 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodos_planilla`
--

LOCK TABLES `periodos_planilla` WRITE;
/*!40000 ALTER TABLE `periodos_planilla` DISABLE KEYS */;
INSERT INTO `periodos_planilla` (`id`, `nombre_periodo`, `fecha_inicio`, `fecha_fin`, `estado`) VALUES (1,'Enero 2026','2026-01-01','2026-01-30','Procesado'),(2,'Marzo 2026','2026-03-01','2026-03-31','Abierto'),(3,'period_aud','2026-01-01','2026-01-05','Procesado'),(502,'Planilla de Demostración Masiva','2026-03-01','2026-03-31','Abierto');
/*!40000 ALTER TABLE `periodos_planilla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planilla_calculada`
--

DROP TABLE IF EXISTS `planilla_calculada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planilla_calculada` (
  `id` int NOT NULL AUTO_INCREMENT,
  `empleado_id` int NOT NULL,
  `periodo_id` int NOT NULL,
  `salario_base_periodo` decimal(12,2) NOT NULL DEFAULT '0.00',
  `total_ingresos` decimal(12,2) NOT NULL DEFAULT '0.00',
  `total_deducciones` decimal(12,2) NOT NULL DEFAULT '0.00',
  `salario_neto` decimal(12,2) NOT NULL DEFAULT '0.00',
  `fecha_calculo` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_empleado_periodo` (`empleado_id`,`periodo_id`),
  KEY `periodo_id` (`periodo_id`),
  CONSTRAINT `fk_planilla_empleado` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_planilla_periodo` FOREIGN KEY (`periodo_id`) REFERENCES `periodos_planilla` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planilla_calculada`
--

LOCK TABLES `planilla_calculada` WRITE;
/*!40000 ALTER TABLE `planilla_calculada` DISABLE KEYS */;
INSERT INTO `planilla_calculada` (`id`, `empleado_id`, `periodo_id`, `salario_base_periodo`, `total_ingresos`, `total_deducciones`, `salario_neto`, `fecha_calculo`) VALUES (1,2,1,934693.38,934693.38,180769.70,753923.68,'2026-04-21 16:48:12'),(2,3,1,993740.55,993740.55,192189.42,801551.13,'2026-04-21 16:48:12'),(3,4,1,1596796.54,1596796.54,308820.46,1287976.08,'2026-04-21 16:48:12'),(4,5,1,746604.21,746604.21,144393.26,602210.95,'2026-04-21 16:48:12'),(5,6,1,1000427.16,1000427.16,193482.62,806944.54,'2026-04-21 16:48:12'),(6,7,1,1871169.72,1871169.72,361884.22,1509285.50,'2026-04-21 16:48:12'),(7,8,1,709023.57,709023.57,137125.16,571898.41,'2026-04-21 16:48:12'),(8,9,1,484321.32,484321.32,93667.74,390653.58,'2026-04-21 16:48:12'),(9,10,1,1866807.40,1866807.40,361040.56,1505766.84,'2026-04-21 16:48:12'),(19,11,1,2083261.69,2083261.69,402902.82,1680358.87,'2026-04-25 06:27:42'),(20,12,1,502761.15,502761.15,97234.00,405527.15,'2026-04-25 06:27:42'),(21,13,1,2070953.61,2070953.61,400522.42,1670431.19,'2026-04-25 06:27:42'),(22,14,1,986725.05,986725.05,190832.62,795892.43,'2026-04-25 06:27:42'),(23,15,1,1133066.54,1133066.54,219135.06,913931.48,'2026-04-25 06:27:42'),(24,16,1,1011492.52,1011492.52,195622.66,815869.86,'2026-04-25 06:27:42'),(25,17,1,1898577.63,1898577.63,367184.92,1531392.71,'2026-04-25 06:27:42'),(26,18,1,527866.22,527866.22,102089.32,425776.90,'2026-04-25 06:27:42'),(27,19,1,1549280.96,1549280.96,299630.94,1249650.02,'2026-04-25 06:27:42'),(28,20,1,1890874.82,1890874.82,365695.20,1525179.62,'2026-04-25 06:27:42'),(29,21,1,856902.40,856902.40,165724.92,691177.48,'2026-04-25 06:27:42'),(30,22,1,1186059.79,1186059.79,229383.96,956675.83,'2026-04-25 06:27:42'),(31,23,1,1199826.05,1199826.05,232046.36,967779.69,'2026-04-25 06:27:42'),(32,24,1,1789916.35,1789916.35,346169.82,1443746.53,'2026-04-25 06:27:42'),(33,25,1,3518698.66,3518698.66,680516.32,2838182.34,'2026-04-25 06:27:42'),(34,26,1,511958.83,511958.83,99012.84,412945.99,'2026-04-25 06:27:42'),(35,27,1,1824846.46,1824846.46,352925.30,1471921.16,'2026-04-25 06:27:42'),(36,28,1,3583619.27,3583619.27,693071.96,2890547.31,'2026-04-25 06:27:42'),(37,29,1,3593796.73,3593796.73,695040.28,2898756.45,'2026-04-25 06:27:42'),(38,30,1,687151.82,687151.82,132895.16,554256.66,'2026-04-25 06:27:42'),(39,31,1,1571825.39,1571825.39,303991.04,1267834.35,'2026-04-25 06:27:42'),(40,32,1,971885.79,971885.79,187962.72,783923.07,'2026-04-25 06:27:42'),(41,33,1,1749992.81,1749992.81,338448.60,1411544.21,'2026-04-25 06:27:42'),(42,34,1,490896.39,490896.39,94939.36,395957.03,'2026-04-25 06:27:42'),(43,35,1,1894409.26,1894409.26,366378.76,1528030.50,'2026-04-25 06:27:42'),(44,36,1,2268836.81,2268836.81,438793.04,1830043.77,'2026-04-25 06:27:42'),(45,37,1,2002546.33,2002546.33,387292.46,1615253.87,'2026-04-25 06:27:42'),(46,38,1,1725842.19,1725842.19,333777.88,1392064.31,'2026-04-25 06:27:42'),(47,39,1,2227135.48,2227135.48,430728.00,1796407.48,'2026-04-25 06:27:42'),(48,40,1,992689.31,992689.31,191986.12,800703.19,'2026-04-25 06:27:42'),(49,41,1,491132.64,491132.64,94985.06,396147.58,'2026-04-25 06:27:42'),(50,42,1,2524520.67,2524520.67,488242.30,2036278.37,'2026-04-25 06:27:42'),(51,43,1,1883887.72,1883887.72,364343.88,1519543.84,'2026-04-25 06:27:42'),(52,44,1,877784.95,877784.95,169763.60,708021.35,'2026-04-25 06:27:42'),(53,45,1,519689.57,519689.57,100507.96,419181.61,'2026-04-25 06:27:42'),(54,46,1,1561387.26,1661387.26,301972.30,1359414.96,'2026-04-25 06:27:42'),(55,47,1,3502614.84,3502614.84,677405.72,2825209.12,'2026-04-25 06:27:42'),(56,48,1,895178.37,895178.37,173127.50,722050.87,'2026-04-25 06:27:42'),(57,49,1,971726.42,971726.42,187931.88,783794.54,'2026-04-25 06:27:42'),(58,50,1,681538.54,681538.54,131809.56,549728.98,'2026-04-25 06:27:42'),(59,51,1,901387.03,901387.03,174328.26,727058.77,'2026-04-25 06:27:42'),(60,52,1,1743420.38,1743420.38,337177.50,1406242.88,'2026-04-25 06:27:42'),(61,53,1,1716304.32,1716304.32,331933.26,1384371.06,'2026-04-25 06:27:42'),(62,54,1,994062.86,994062.86,192251.76,801811.10,'2026-04-25 06:27:42'),(63,55,1,487732.82,487732.82,94327.52,393405.30,'2026-04-25 06:27:42'),(64,56,1,1115788.73,1115788.73,215793.54,899995.19,'2026-04-25 06:27:42'),(65,57,1,1829436.37,1829436.37,353813.00,1475623.37,'2026-04-25 06:27:42'),(66,58,1,954126.42,954126.42,184528.04,769598.38,'2026-04-25 06:27:42'),(67,59,1,748551.25,748551.25,144769.82,603781.43,'2026-04-25 06:27:42'),(68,60,1,486406.51,486406.51,94071.02,392335.49,'2026-04-25 06:27:42'),(69,61,1,530865.89,553402.12,51334.73,502067.39,'2026-04-25 06:27:42'),(70,62,1,909938.32,935647.13,87991.04,847656.09,'2026-04-25 06:27:42'),(71,63,1,2282302.49,2298237.82,220698.65,2077539.17,'2026-04-25 06:27:42'),(72,64,1,1865782.99,1883333.20,180421.22,1702911.98,'2026-04-25 06:27:42'),(73,65,1,2080502.93,2105448.02,201184.63,1904263.39,'2026-04-25 06:27:42'),(74,66,1,978584.87,1005659.69,94629.16,911030.53,'2026-04-25 06:27:42'),(75,67,1,1835478.88,1851017.72,177490.81,1673526.91,'2026-04-25 06:27:42'),(76,68,1,2541132.87,2582602.60,245727.55,2336875.05,'2026-04-25 06:27:42'),(77,69,1,961607.98,987340.13,92987.49,894352.64,'2026-04-25 06:27:42'),(78,70,1,1125005.76,1144257.29,108788.06,1035469.23,'2026-04-25 06:27:42'),(79,71,1,699214.67,733275.88,67614.06,665661.82,'2026-04-25 06:27:42'),(80,72,1,1112443.75,1149995.22,107573.31,1042421.91,'2026-04-25 06:27:42'),(81,73,1,1844640.52,1885214.22,178376.74,1706837.48,'2026-04-25 06:27:42'),(82,74,1,1850633.25,1865847.35,178956.24,1686891.11,'2026-04-25 06:27:42'),(83,75,1,698769.25,728118.65,67570.99,660547.66,'2026-04-25 06:27:42'),(84,76,1,2209356.47,2235461.18,213644.77,2021816.41,'2026-04-25 06:27:43'),(85,77,1,1817359.48,1844834.85,175738.66,1669096.19,'2026-04-25 06:27:43'),(86,78,1,2296052.54,2340115.23,222028.28,2118086.95,'2026-04-25 06:27:43'),(87,79,1,1521907.13,1554794.49,147168.42,1407626.07,'2026-04-25 06:27:43'),(88,80,1,548856.40,566105.11,53074.41,513030.70,'2026-04-25 06:27:43'),(89,81,1,727017.95,790454.53,70302.64,720151.89,'2026-04-25 06:27:43'),(90,82,1,2519306.83,2568041.17,243616.97,2324424.20,'2026-04-25 06:27:43'),(91,83,1,454037.28,489997.26,43905.40,446091.86,'2026-04-25 06:27:43'),(92,84,1,2586391.47,2647362.30,250104.06,2397258.24,'2026-04-25 06:27:43'),(93,85,1,3595088.46,3651835.42,347645.05,3304190.37,'2026-04-25 06:27:43'),(94,86,1,989111.69,1032656.01,95647.10,937008.91,'2026-04-25 06:27:43'),(95,87,1,1139536.39,1190914.28,110193.17,1080721.11,'2026-04-25 06:27:43'),(96,88,1,1784238.26,1818773.20,172535.84,1646237.36,'2026-04-25 06:27:43'),(97,89,1,1811101.04,1836693.44,175133.47,1661559.97,'2026-04-25 06:27:43'),(98,90,1,2045773.04,2110722.00,197826.25,1912895.75,'2026-04-25 06:27:43'),(99,91,1,454484.65,509406.36,43948.67,465457.69,'2026-04-25 06:27:43'),(100,92,1,1898573.39,1938688.50,183592.05,1755096.45,'2026-04-25 06:27:43'),(101,93,1,2550918.39,2577240.70,246673.81,2330566.89,'2026-04-25 06:27:43'),(102,94,1,2558144.99,2630821.90,247372.62,2383449.28,'2026-04-25 06:27:43'),(103,95,1,1132234.77,1185685.47,109487.10,1076198.37,'2026-04-25 06:27:43'),(104,96,1,3556149.91,3619929.75,343879.70,3276050.05,'2026-04-25 06:27:43'),(105,97,1,958849.46,1018067.69,92720.74,925346.95,'2026-04-25 06:27:43'),(106,98,1,450924.56,516327.59,43604.40,472723.19,'2026-04-25 06:27:43'),(107,99,1,2569837.48,2603187.88,248503.28,2354684.60,'2026-04-25 06:27:43'),(108,100,1,696274.95,748425.39,67329.79,681095.60,'2026-04-25 06:27:43'),(109,101,1,750000.00,750000.00,72525.00,677475.00,'2026-04-25 06:27:43'),(110,106,1,500000.00,500000.00,48350.00,451650.00,'2026-04-25 06:27:43'),(111,107,1,0.00,0.00,0.00,0.00,'2026-04-25 06:27:43'),(112,108,1,1.00,1.00,0.10,0.90,'2026-04-25 06:27:43'),(113,113,1,0.00,0.00,0.00,0.00,'2026-04-25 06:27:43'),(114,114,1,0.00,0.00,0.00,0.00,'2026-04-25 06:27:43'),(115,115,1,100000.00,100000.00,9670.00,90330.00,'2026-04-25 06:27:43'),(116,127,1,2000000.00,2000000.00,193400.00,1806600.00,'2026-04-25 06:27:43'),(117,128,1,100000.00,100000.00,9670.00,90330.00,'2026-04-25 06:27:43'),(118,129,1,0.00,0.00,0.00,0.00,'2026-04-25 06:27:43'),(119,2,3,934693.38,934693.38,90384.85,844308.53,'2026-04-25 06:38:15'),(120,3,3,993740.55,993740.55,96094.71,897645.84,'2026-04-25 06:38:15'),(121,4,3,1596796.54,1596796.54,154410.23,1442386.31,'2026-04-25 06:38:15'),(122,5,3,746604.21,746604.21,72196.63,674407.58,'2026-04-25 06:38:15'),(123,6,3,1000427.16,1000427.16,96741.31,903685.85,'2026-04-25 06:38:15'),(124,7,3,1871169.72,1871169.72,180942.11,1690227.61,'2026-04-25 06:38:15'),(125,8,3,709023.57,709023.57,68562.58,640460.99,'2026-04-25 06:38:15'),(126,9,3,484321.32,484321.32,46833.87,437487.45,'2026-04-25 06:38:15'),(127,10,3,1866807.40,1866807.40,180520.28,1686287.12,'2026-04-25 06:38:15'),(128,11,3,2083261.69,2083261.69,201451.41,1881810.28,'2026-04-25 06:38:15'),(129,12,3,502761.15,502761.15,48617.00,454144.15,'2026-04-25 06:38:15'),(130,13,3,2070953.61,2070953.61,200261.21,1870692.40,'2026-04-25 06:38:15'),(131,14,3,986725.05,986725.05,95416.31,891308.74,'2026-04-25 06:38:15'),(132,15,3,1133066.54,1133066.54,109567.53,1023499.01,'2026-04-25 06:38:15'),(133,16,3,1011492.52,1011492.52,97811.33,913681.19,'2026-04-25 06:38:15'),(134,17,3,1898577.63,1898577.63,183592.46,1714985.17,'2026-04-25 06:38:15'),(135,18,3,527866.22,527866.22,51044.66,476821.56,'2026-04-25 06:38:15'),(136,19,3,1549280.96,1549280.96,149815.47,1399465.49,'2026-04-25 06:38:15'),(137,20,3,1890874.82,1890874.82,182847.60,1708027.22,'2026-04-25 06:38:15'),(138,21,3,856902.40,856902.40,82862.46,774039.94,'2026-04-25 06:38:15'),(139,22,3,1186059.79,1186059.79,114691.98,1071367.81,'2026-04-25 06:38:15'),(140,23,3,1199826.05,1199826.05,116023.18,1083802.87,'2026-04-25 06:38:15'),(141,24,3,1789916.35,1789916.35,173084.91,1616831.44,'2026-04-25 06:38:15'),(142,25,3,3518698.66,3518698.66,340258.16,3178440.50,'2026-04-25 06:38:15'),(143,26,3,511958.83,511958.83,49506.42,462452.41,'2026-04-25 06:38:15'),(144,27,3,1824846.46,1824846.46,176462.65,1648383.81,'2026-04-25 06:38:15'),(145,28,3,3583619.27,3583619.27,346535.98,3237083.29,'2026-04-25 06:38:15'),(146,29,3,3593796.73,3593796.73,347520.14,3246276.59,'2026-04-25 06:38:15'),(147,30,3,687151.82,687151.82,66447.58,620704.24,'2026-04-25 06:38:15'),(148,31,3,1571825.39,1571825.39,151995.52,1419829.87,'2026-04-25 06:38:15'),(149,32,3,971885.79,971885.79,93981.36,877904.43,'2026-04-25 06:38:15'),(150,33,3,1749992.81,1749992.81,169224.30,1580768.51,'2026-04-25 06:38:15'),(151,34,3,490896.39,490896.39,47469.68,443426.71,'2026-04-25 06:38:16'),(152,35,3,1894409.26,1894409.26,183189.38,1711219.88,'2026-04-25 06:38:16'),(153,36,3,2268836.81,2268836.81,219396.52,2049440.29,'2026-04-25 06:38:16'),(154,37,3,2002546.33,2002546.33,193646.23,1808900.10,'2026-04-25 06:38:16'),(155,38,3,1725842.19,1725842.19,166888.94,1558953.25,'2026-04-25 06:38:16'),(156,39,3,2227135.48,2227135.48,215364.00,2011771.48,'2026-04-25 06:38:16'),(157,40,3,992689.31,992689.31,95993.06,896696.25,'2026-04-25 06:38:16'),(158,41,3,491132.64,491132.64,47492.53,443640.11,'2026-04-25 06:38:16'),(159,42,3,2524520.67,2524520.67,244121.15,2280399.52,'2026-04-25 06:38:16'),(160,43,3,1883887.72,1883887.72,182171.94,1701715.78,'2026-04-25 06:38:16'),(161,44,3,877784.95,877784.95,84881.80,792903.15,'2026-04-25 06:38:16'),(162,45,3,519689.57,519689.57,50253.98,469435.59,'2026-04-25 06:38:16'),(163,46,3,1561387.26,1561387.26,150986.15,1410401.11,'2026-04-25 06:38:16'),(164,47,3,3502614.84,3502614.84,338702.86,3163911.98,'2026-04-25 06:38:16'),(165,48,3,895178.37,895178.37,86563.75,808614.62,'2026-04-25 06:38:16'),(166,49,3,971726.42,971726.42,93965.94,877760.48,'2026-04-25 06:38:16'),(167,50,3,681538.54,681538.54,65904.78,615633.76,'2026-04-25 06:38:16'),(168,51,3,901387.03,901387.03,87164.13,814222.90,'2026-04-25 06:38:16'),(169,52,3,1743420.38,1743420.38,168588.75,1574831.63,'2026-04-25 06:38:16'),(170,53,3,1716304.32,1716304.32,165966.63,1550337.69,'2026-04-25 06:38:16'),(171,54,3,994062.86,994062.86,96125.88,897936.98,'2026-04-25 06:38:16'),(172,55,3,487732.82,487732.82,47163.76,440569.06,'2026-04-25 06:38:16'),(173,56,3,1115788.73,1115788.73,107896.77,1007891.96,'2026-04-25 06:38:16'),(174,57,3,1829436.37,1829436.37,176906.50,1652529.87,'2026-04-25 06:38:16'),(175,58,3,954126.42,954126.42,92264.02,861862.40,'2026-04-25 06:38:16'),(176,59,3,748551.25,748551.25,72384.91,676166.34,'2026-04-25 06:38:16'),(177,60,3,486406.51,486406.51,47035.51,439371.00,'2026-04-25 06:38:16'),(178,61,3,530865.89,530865.89,51334.73,479531.16,'2026-04-25 06:38:16'),(179,62,3,909938.32,909938.32,87991.04,821947.28,'2026-04-25 06:38:16'),(180,63,3,2282302.49,2282302.49,220698.65,2061603.84,'2026-04-25 06:38:16'),(181,64,3,1865782.99,1865782.99,180421.22,1685361.77,'2026-04-25 06:38:16'),(182,65,3,2080502.93,2080502.93,201184.63,1879318.30,'2026-04-25 06:38:16'),(183,66,3,978584.87,978584.87,94629.16,883955.71,'2026-04-25 06:38:16'),(184,67,3,1835478.88,1835478.88,177490.81,1657988.07,'2026-04-25 06:38:16'),(185,68,3,2541132.87,2541132.87,245727.55,2295405.32,'2026-04-25 06:38:16'),(186,69,3,961607.98,961607.98,92987.49,868620.49,'2026-04-25 06:38:16'),(187,70,3,1125005.76,1125005.76,108788.06,1016217.70,'2026-04-25 06:38:16'),(188,71,3,699214.67,699214.67,67614.06,631600.61,'2026-04-25 06:38:16'),(189,72,3,1112443.75,1112443.75,107573.31,1004870.44,'2026-04-25 06:38:16'),(190,73,3,1844640.52,1844640.52,178376.74,1666263.78,'2026-04-25 06:38:16'),(191,74,3,1850633.25,1850633.25,178956.24,1671677.01,'2026-04-25 06:38:16'),(192,75,3,698769.25,698769.25,67570.99,631198.26,'2026-04-25 06:38:16'),(193,76,3,2209356.47,2209356.47,213644.77,1995711.70,'2026-04-25 06:38:16'),(194,77,3,1817359.48,1817359.48,175738.66,1641620.82,'2026-04-25 06:38:16'),(195,78,3,2296052.54,2296052.54,222028.28,2074024.26,'2026-04-25 06:38:16'),(196,79,3,1521907.13,1521907.13,147168.42,1374738.71,'2026-04-25 06:38:16'),(197,80,3,548856.40,548856.40,53074.41,495781.99,'2026-04-25 06:38:16'),(198,81,3,727017.95,727017.95,70302.64,656715.31,'2026-04-25 06:38:16'),(199,82,3,2519306.83,2519306.83,243616.97,2275689.86,'2026-04-25 06:38:16'),(200,83,3,454037.28,454037.28,43905.40,410131.88,'2026-04-25 06:38:16'),(201,84,3,2586391.47,2586391.47,250104.06,2336287.41,'2026-04-25 06:38:16'),(202,85,3,3595088.46,3595088.46,347645.05,3247443.41,'2026-04-25 06:38:16'),(203,86,3,989111.69,989111.69,95647.10,893464.59,'2026-04-25 06:38:16'),(204,87,3,1139536.39,1139536.39,110193.17,1029343.22,'2026-04-25 06:38:16'),(205,88,3,1784238.26,1784238.26,172535.84,1611702.42,'2026-04-25 06:38:16'),(206,89,3,1811101.04,1811101.04,175133.47,1635967.57,'2026-04-25 06:38:16'),(207,90,3,2045773.04,2045773.04,197826.25,1847946.79,'2026-04-25 06:38:16'),(208,91,3,454484.65,454484.65,43948.67,410535.98,'2026-04-25 06:38:16'),(209,92,3,1898573.39,1898573.39,183592.05,1714981.34,'2026-04-25 06:38:16'),(210,93,3,2550918.39,2550918.39,246673.81,2304244.58,'2026-04-25 06:38:16'),(211,94,3,2558144.99,2558144.99,247372.62,2310772.37,'2026-04-25 06:38:16'),(212,95,3,1132234.77,1132234.77,109487.10,1022747.67,'2026-04-25 06:38:16'),(213,96,3,3556149.91,3556149.91,343879.70,3212270.21,'2026-04-25 06:38:16'),(214,97,3,958849.46,958849.46,92720.74,866128.72,'2026-04-25 06:38:16'),(215,98,3,450924.56,450924.56,43604.40,407320.16,'2026-04-25 06:38:16'),(216,99,3,2569837.48,2569837.48,248503.28,2321334.20,'2026-04-25 06:38:16'),(217,100,3,696274.95,696274.95,67329.79,628945.16,'2026-04-25 06:38:16'),(218,101,3,750000.00,750000.00,72525.00,677475.00,'2026-04-25 06:38:16'),(219,106,3,500000.00,500000.00,48350.00,451650.00,'2026-04-25 06:38:16'),(220,107,3,0.00,0.00,0.00,0.00,'2026-04-25 06:38:16'),(221,108,3,1.00,1.00,0.10,0.90,'2026-04-25 06:38:16'),(222,113,3,0.00,0.00,0.00,0.00,'2026-04-25 06:38:16'),(223,114,3,0.00,0.00,0.00,0.00,'2026-04-25 06:38:16'),(224,115,3,100000.00,100000.00,9670.00,90330.00,'2026-04-25 06:38:16'),(225,127,3,2000000.00,2000000.00,193400.00,1806600.00,'2026-04-25 06:38:16'),(226,128,3,100000.00,100000.00,9670.00,90330.00,'2026-04-25 06:38:16'),(227,129,3,0.00,0.00,0.00,0.00,'2026-04-25 06:38:16');
/*!40000 ALTER TABLE `planilla_calculada` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puestos`
--

LOCK TABLES `puestos` WRITE;
/*!40000 ALTER TABLE `puestos` DISABLE KEYS */;
INSERT INTO `puestos` (`id`, `nombre`, `salario_base_sugerido`, `departamento_id`) VALUES (1,'Analista Principal',1350000.00,1),(2,'Arquitecto IT',2500000.00,2),(3,'Desarrollador',1800000.00,2),(4,'Gerente RRHH',2000000.00,3),(5,'Contador General',1500000.00,4),(6,'Ejecutivo Comercial',900000.00,5),(7,'Jefe de Planta',1800000.00,6),(8,'Operario',450000.00,6),(9,'Encargado Logística',1100000.00,7),(10,'Abogado Senior',2200000.00,9),(11,'Técnico Junior',650000.00,10),(12,'Analista Calidad',950000.00,11),(13,'Oficial Seguridad',450000.00,12),(14,'Comprador',850000.00,13),(15,'Ingeniero Proyectos',1700000.00,17),(16,'Analista Senior',1250000.00,1),(17,'puesto_auditoria',10.00,1),(50,'Gerente Demo',1500000.00,50),(51,'Soporte Demo',850000.00,51),(52,'Vendedor Demo',650000.00,50);
/*!40000 ALTER TABLE `puestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `nombre`, `descripcion`) VALUES (1,'Administrador','Acceso total al sistema'),(2,'Recursos Humanos','Gestión de empleados y periodos'),(3,'Contador','Gestión de cálculos y reportes bancarios'),(4,'Empleado','Acceso limitado a su propia información');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
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
  `token` text,
  `rol` enum('Administrador','Recursos Humanos','Contador','Empleado') NOT NULL,
  `empleado_id` int DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '1',
  `pregunta_seguridad` varchar(255) DEFAULT NULL,
  `respuesta_seguridad` varchar(255) DEFAULT NULL,
  `ultimo_login` datetime DEFAULT NULL,
  `intentos_fallidos` int DEFAULT '0',
  `rol_id` int DEFAULT '4',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `empleado_id` (`empleado_id`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `username`, `password_hash`, `token`, `rol`, `empleado_id`, `estado`, `pregunta_seguridad`, `respuesta_seguridad`, `ultimo_login`, `intentos_fallidos`, `rol_id`) VALUES (1,'mario.chaves.admin','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Administrador',NULL,1,'¿Color favorito?','Azul','2026-02-02 17:58:21',0,4),(2,'esteban.ramírez2','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',2,1,'¿Cuál fue su primer número de teléfono?','88888888','2026-02-06 17:58:21',0,4),(3,'julia.pérez3','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',3,1,'¿Cuál es el nombre de su escuela primaria?','Escuela Central','2026-02-06 17:58:21',0,4),(4,'julia.pérez4','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',4,1,'¿Cuál es el nombre de su primera mascota?','Fido','2026-02-02 17:58:21',0,4),(5,'esteban.gonzález5','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',5,1,'¿En qué ciudad nació su madre?','San Jose','2026-01-29 17:58:21',0,4),(6,'beatriz.castro6','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',6,1,'¿Cuál es el nombre de su primera mascota?','Fido','2026-01-31 17:58:21',0,4),(7,'andrés.pérez7','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',7,1,'¿Cuál es el nombre de su escuela primaria?','Escuela Central','2026-01-29 17:58:21',0,4),(8,'carlos.mora8','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',8,1,'¿Cuál es el nombre de su primera mascota?','Fido','2026-02-03 17:58:21',0,4),(9,'diana.pérez9','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',9,1,'¿Cuál es el nombre de su escuela primaria?','Escuela Central','2026-02-05 17:58:21',0,4),(10,'julia.jiménez10','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',10,1,'¿Cuál es su color favorito?','Azul','2026-02-05 17:58:21',0,4),(11,'esteban.sánchez11','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Administrador',11,1,'¿Cuál es el nombre de su escuela primaria?','Escuela Central','2026-02-02 17:58:21',0,4),(12,'julia.rojas12','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',12,1,'¿Cuál es el nombre de su escuela primaria?','Escuela Central','2026-01-31 17:58:21',0,4),(13,'fabiana.gonzález13','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Administrador',13,1,'¿Cuál es el nombre de su primera mascota?','Fido','2026-02-03 17:58:21',0,4),(15,'carlos.ramírez15','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',15,1,'¿En qué ciudad nació su madre?','San Jose','2026-02-01 17:58:21',0,4),(16,'diana.jiménez16','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',16,1,'¿Cuál es el nombre de su primera mascota?','Fido','2026-01-29 17:58:21',0,4),(17,'iván.sánchez17','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',17,1,'¿Cuál es el nombre de su primera mascota?','Fido','2026-01-28 17:58:21',0,4),(18,'hellen.pérez18','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',18,1,'¿Cuál es el nombre de su escuela primaria?','Escuela Central','2026-02-01 17:58:21',0,4),(19,'esteban.mora19','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',19,1,'¿Cuál es su color favorito?','Azul','2026-01-29 17:58:21',0,4),(20,'fabiana.sánchez20','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',20,1,'¿Cuál es su color favorito?','Azul','2026-02-02 17:58:21',0,4),(21,'iván.castro21','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',21,1,'¿En qué ciudad nació su madre?','San Jose','2026-02-02 17:58:21',0,4),(22,'fabiana.vargas22','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',22,1,'¿Cuál es su color favorito?','Azul','2026-01-30 17:58:21',0,4),(23,'esteban.ramírez23','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',23,1,'¿Cuál es el nombre de su escuela primaria?','Escuela Central','2026-02-06 17:58:21',0,4),(24,'carlos.ramírez24','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',24,1,'¿Cuál es el nombre de su escuela primaria?','Escuela Central','2026-01-29 17:58:21',0,4),(25,'beatriz.pérez25','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Administrador',25,1,'¿Cuál es el nombre de su escuela primaria?','Escuela Central','2026-02-06 17:58:21',0,4),(26,'fabiana.rojas26','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',26,1,'¿Cuál es el nombre de su primera mascota?','Fido','2026-02-06 17:58:21',0,4),(27,'carlos.vargas27','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',27,1,'¿Cuál es el nombre de su primera mascota?','Fido','2026-01-28 17:58:21',0,4),(28,'fabiana.sánchez28','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Administrador',28,1,'¿En qué ciudad nació su madre?','San Jose','2026-01-31 17:58:21',0,4),(29,'gabriel.vargas29','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Administrador',29,1,'¿Cuál es el nombre de su primera mascota?','Fido','2026-01-29 17:58:21',0,4),(30,'iván.gonzález30','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',30,1,'¿Cuál es el nombre de su escuela primaria?','Escuela Central','2026-02-01 17:58:21',0,4),(31,'esteban.mora31','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',31,1,'¿Cuál es su color favorito?','Azul','2026-02-01 17:58:21',0,4),(32,'iván.sánchez32','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',32,1,'¿En qué ciudad nació su madre?','San Jose','2026-01-29 17:58:21',0,4),(33,'julia.castro33','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',33,1,'¿Cuál fue su primer número de teléfono?','88888888','2026-01-29 17:58:21',0,4),(34,'carlos.blanco34','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',34,1,'¿Cuál fue su primer número de teléfono?','88888888','2026-02-04 17:58:21',0,4),(35,'andrés.castro35','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',35,1,'¿Cuál es su color favorito?','Azul','2026-02-02 17:58:21',0,4),(36,'diana.blanco36','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Administrador',36,1,'¿En qué ciudad nació su madre?','San Jose','2026-02-06 17:58:21',0,4),(37,'iván.gonzález37','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Administrador',37,1,'¿Cuál fue su primer número de teléfono?','88888888','2026-01-28 17:58:21',0,4),(38,'fabiana.jiménez38','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',38,1,'¿Cuál es el nombre de su escuela primaria?','Escuela Central','2026-02-06 17:58:21',0,4),(39,'fabiana.pérez39','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Administrador',39,1,'¿Cuál es el nombre de su escuela primaria?','Escuela Central','2026-01-30 17:58:21',0,4),(40,'iván.jiménez40','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',40,1,'¿Cuál fue su primer número de teléfono?','88888888','2026-02-05 17:58:21',0,4),(41,'iván.sánchez41','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',41,1,'¿Cuál fue su primer número de teléfono?','88888888','2026-01-30 17:58:21',0,4),(42,'iván.mora42','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',42,1,'¿Cuál es el nombre de su escuela primaria?','Escuela Central','2026-01-29 17:58:21',0,4),(43,'julia.gonzález43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',43,1,'¿Cuál es su color favorito?','Azul','2026-01-30 17:58:21',0,4),(44,'beatriz.mora44','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',44,1,'¿En qué ciudad nació su madre?','San Jose','2026-02-02 17:58:21',0,4),(45,'carlos.ramírez45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',45,1,'¿En qué ciudad nació su madre?','San Jose','2026-02-06 17:58:21',0,4),(46,'beatriz.castro46','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',46,1,'¿Cuál fue su primer número de teléfono?','88888888','2026-01-28 17:58:21',0,4),(47,'carlos.rojas47','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Administrador',47,1,'¿En qué ciudad nació su madre?','San Jose','2026-01-30 17:58:21',0,4),(48,'diana.pérez48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',48,1,'¿Cuál fue su primer número de teléfono?','88888888','2026-02-06 17:58:21',0,4),(49,'hellen.gonzález49','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',49,1,'¿Cuál es el nombre de su primera mascota?','Fido','2026-01-28 17:58:21',0,4),(50,'julia.rojas50','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',50,1,'¿Cuál es su color favorito?','Azul','2026-01-30 17:58:21',0,4),(51,'carlos.mora51','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',51,1,'¿Cuál es su color favorito?','Azul','2026-02-02 17:58:21',0,4),(52,'carlos.blanco52','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',52,1,'¿Cuál fue su primer número de teléfono?','88888888','2026-02-02 17:58:21',0,4),(53,'hellen.rojas53','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',53,1,'¿Cuál fue su primer número de teléfono?','88888888','2026-01-29 17:58:21',0,4),(54,'gabriel.castro54','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',54,1,'¿Cuál es su color favorito?','Azul','2026-02-01 17:58:21',0,4),(55,'julia.gonzález55','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',55,1,'¿En qué ciudad nació su madre?','San Jose','2026-01-28 17:58:21',0,4),(56,'esteban.gonzález56','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',56,1,'¿En qué ciudad nació su madre?','San Jose','2026-02-05 17:58:21',0,4),(57,'carlos.blanco57','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',57,1,'¿Cuál es su color favorito?','Azul','2026-02-02 17:58:21',0,4),(58,'carlos.sánchez58','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',58,1,'¿Cuál fue su primer número de teléfono?','88888888','2026-02-06 17:58:21',0,4),(59,'andrés.sánchez59','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',59,1,'¿En qué ciudad nació su madre?','San Jose','2026-01-29 17:58:21',0,4),(60,'beatriz.castro60','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',60,1,'¿Cuál es el nombre de su primera mascota?','Fido','2026-01-30 17:58:21',0,4),(61,'esteban.rojas61','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',61,1,'¿En qué ciudad nació su madre?','San Jose','2026-01-30 17:58:21',0,4),(62,'gabriel.jiménez62','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',62,1,'¿Cuál es el nombre de su primera mascota?','Fido','2026-02-02 17:58:21',0,4),(63,'diana.vargas63','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Administrador',63,1,'¿Cuál es el nombre de su escuela primaria?','Escuela Central','2026-01-29 17:58:21',0,4),(64,'carlos.castro64','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',64,1,'¿Cuál fue su primer número de teléfono?','88888888','2026-02-04 17:58:21',0,4),(65,'beatriz.vargas65','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Administrador',65,1,'¿En qué ciudad nació su madre?','San Jose','2026-02-01 17:58:21',0,4),(66,'esteban.pérez66','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',66,1,'¿Cuál es el nombre de su primera mascota?','Fido','2026-01-31 17:58:21',0,4),(67,'iván.gonzález67','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',67,1,'¿Cuál es el nombre de su primera mascota?','Fido','2026-01-28 17:58:21',0,4),(68,'fabiana.blanco68','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',68,1,'¿Cuál es su color favorito?','Azul','2026-01-31 17:58:21',0,4),(69,'carlos.sánchez69','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',69,1,'¿Cuál es el nombre de su primera mascota?','Fido','2026-01-29 17:58:21',0,4),(70,'fabiana.vargas70','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',70,1,'¿Cuál es su color favorito?','Azul','2026-02-05 17:58:21',0,4),(71,'carlos.gonzález71','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',71,1,'¿Cuál es el nombre de su escuela primaria?','Escuela Central','2026-01-29 17:58:21',0,4),(72,'hellen.gonzález72','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',72,1,'¿Cuál es el nombre de su escuela primaria?','Escuela Central','2026-02-03 17:58:21',0,4),(73,'iván.castro73','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',73,1,'¿Cuál es el nombre de su escuela primaria?','Escuela Central','2026-01-30 17:58:21',0,4),(74,'iván.blanco74','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,'Empleado',74,1,'¿Cuál es su color favorito?','Azul','2026-02-01 17:58:21',0,4),(75,'esteban.perez75','pruebatoken','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImVzdGViYW4ucGVyZXo3NSIsImlhdCI6MTc3MjcwMTQ1NiwiZXhwIjoxNzcyNzAyMDU2fQ.IVobyidKR7kS239YwVPjiHy3moZxI857w964_2SSUbw','Empleado',75,1,'¿En qué ciudad nació su madre?','San Jose','2026-02-02 17:58:21',0,4),(76,'cristopher.chavarria','bcrypt_hash_simulado',NULL,'Empleado',100,1,'¿Color favorito?','Verde',NULL,0,4),(78,'samantha.chavarria','bcrypt_hash_simulado','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InNhbWFudGhhLmNoYXZhcnJpYSIsImlhdCI6MTc3Mjc4MDQyMywiZXhwIjoxNzcyNzgxMDIzfQ.jF9wtOB76Vec7iFXWwOhY_UOqjHF1-1q5ipdlYzAAAw','Empleado',100,1,'¿Color favorito?','Verde',NULL,0,4),(82,'usuario.prueba3','bcrypt_hash_simulado',NULL,'Empleado',NULL,1,'¿Color favorito?','Verde',NULL,0,4),(96,'audit_test_user_upd','hash123',NULL,'Administrador',106,0,' Color favorito?','Rojo',NULL,0,4),(97,'audit_test_user','test',NULL,'Empleado',107,1,NULL,NULL,NULL,0,4),(98,'Samantha','1234',NULL,'Administrador',113,1,'','',NULL,0,4),(100,'Josue Chavarria','123456',NULL,'Recursos Humanos',127,1,'cafe favorito','vainilla',NULL,0,4),(101,'Juan Perez','123456',NULL,'Empleado',128,1,'nombre del animal favorito','Molly',NULL,0,4),(102,'miguel.bose','123456',NULL,'Empleado',129,1,'nombre del animal favorito','perro',NULL,0,4),(103,'sami.chava','$2b$10$EBQPcrQB5zG40WHWAVBYROFCSY07GwTAtNCMHBPDs75zPLRoNgCMa',NULL,'Administrador',NULL,1,NULL,NULL,NULL,0,4),(104,'Administrador','$2b$10$qpB4b5/BEa5IkMeEnta/j.ZOMh8S0R6Ob7fZwV9ghC99y5tKhEZnW','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2wiOiJFbXBsZWFkbyIsInVzZXJuYW1lIjoiQWRtaW5pc3RyYWRvciIsImVtcGxlYWRvX2lkIjpudWxsLCJ1c3VhcmlvX2lkIjoxMDQsImlhdCI6MTc3NzEwNDM1MiwiZXhwIjoxNzc3MTE4NzUyfQ.PsTVt3sTZcQPqh7oTBbgXCK4Q0Bh8zbhg_VcIP5ItRw','Administrador',NULL,1,'Color Favorito?','Negro',NULL,0,4);
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

-- Dump completed on 2026-04-25  2:07:36
