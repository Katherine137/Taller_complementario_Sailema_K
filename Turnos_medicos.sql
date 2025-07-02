-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: turnos_medicos
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `auditoria_pacientes`
--

DROP TABLE IF EXISTS `auditoria_pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_pacientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `paciente_id` int DEFAULT NULL,
  `fecha_auditoria` datetime DEFAULT CURRENT_TIMESTAMP,
  `descripcion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_pacientes`
--

LOCK TABLES `auditoria_pacientes` WRITE;
/*!40000 ALTER TABLE `auditoria_pacientes` DISABLE KEYS */;
INSERT INTO `auditoria_pacientes` VALUES (1,5,'2025-07-02 11:27:18','Nuevo paciente registrado: Katherine'),(2,6,'2025-07-02 11:43:58','Nuevo paciente registrado: Aleksandry');
/*!40000 ALTER TABLE `auditoria_pacientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidades`
--

DROP TABLE IF EXISTS `especialidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidades`
--

LOCK TABLES `especialidades` WRITE;
/*!40000 ALTER TABLE `especialidades` DISABLE KEYS */;
INSERT INTO `especialidades` VALUES (1,'Pediatría'),(2,'Cardiología'),(3,'Dermatología'),(4,'Neurología');
/*!40000 ALTER TABLE `especialidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_turnos`
--

DROP TABLE IF EXISTS `log_turnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_turnos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `turno_id` int DEFAULT NULL,
  `accion` varchar(50) DEFAULT NULL,
  `fecha_log` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_turnos`
--

LOCK TABLES `log_turnos` WRITE;
/*!40000 ALTER TABLE `log_turnos` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_turnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicos`
--

DROP TABLE IF EXISTS `medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `especialidad_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `especialidad_id` (`especialidad_id`),
  CONSTRAINT `medicos_ibfk_1` FOREIGN KEY (`especialidad_id`) REFERENCES `especialidades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicos`
--

LOCK TABLES `medicos` WRITE;
/*!40000 ALTER TABLE `medicos` DISABLE KEYS */;
INSERT INTO `medicos` VALUES (1,'Dra. Ana Torres',1),(2,'Dr. Luis Pérez',2),(3,'Dra. Carla Gómez',3),(4,'Dr. Jorge Lima',4),(5,'Dr.Pablo Beltran',2),(6,'Ana Pérez',NULL),(7,'Dr.Veronica Lodge',2);
/*!40000 ALTER TABLE `medicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `cedula` varchar(20) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientes`
--

LOCK TABLES `pacientes` WRITE;
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
INSERT INTO `pacientes` VALUES (1,'María López','1102233445','1990-04-15'),(2,'Pedro González','1103344556','1985-06-20'),(3,'Lucía Martínez','1104455667','2002-09-10'),(4,'Carlos Herrera','1105566778','1978-12-05'),(5,'Katherine','1727280297','2004-07-25'),(6,'Aleksandry','1725164875','2004-05-16');
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turnos`
--

DROP TABLE IF EXISTS `turnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turnos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `paciente_id` int DEFAULT NULL,
  `medico_id` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `estado` varchar(20) DEFAULT 'pendiente',
  PRIMARY KEY (`id`),
  KEY `paciente_id` (`paciente_id`),
  KEY `medico_id` (`medico_id`),
  CONSTRAINT `turnos_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`),
  CONSTRAINT `turnos_ibfk_2` FOREIGN KEY (`medico_id`) REFERENCES `medicos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turnos`
--

LOCK TABLES `turnos` WRITE;
/*!40000 ALTER TABLE `turnos` DISABLE KEYS */;
INSERT INTO `turnos` VALUES (1,1,1,'2025-07-02','10:00:00','pendiente'),(2,2,2,'2025-07-02','11:00:00','pendiente'),(3,3,3,'2025-07-02','12:00:00','pendiente'),(4,4,4,'2025-07-03','09:30:00','pendiente');
/*!40000 ALTER TABLE `turnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_citas_por_especialidad`
--

DROP TABLE IF EXISTS `vista_citas_por_especialidad`;
/*!50001 DROP VIEW IF EXISTS `vista_citas_por_especialidad`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_citas_por_especialidad` AS SELECT 
 1 AS `especialidad`,
 1 AS `total_citas`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_detalle_paciente`
--

DROP TABLE IF EXISTS `vista_detalle_paciente`;
/*!50001 DROP VIEW IF EXISTS `vista_detalle_paciente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_detalle_paciente` AS SELECT 
 1 AS `id`,
 1 AS `nombre`,
 1 AS `edad`,
 1 AS `total_turnos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_disponibilidad_medicos`
--

DROP TABLE IF EXISTS `vista_disponibilidad_medicos`;
/*!50001 DROP VIEW IF EXISTS `vista_disponibilidad_medicos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_disponibilidad_medicos` AS SELECT 
 1 AS `id`,
 1 AS `nombre`,
 1 AS `especialidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_turnos_activos`
--

DROP TABLE IF EXISTS `vista_turnos_activos`;
/*!50001 DROP VIEW IF EXISTS `vista_turnos_activos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_turnos_activos` AS SELECT 
 1 AS `id`,
 1 AS `paciente`,
 1 AS `medico`,
 1 AS `fecha`,
 1 AS `hora`,
 1 AS `estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_citas_por_especialidad`
--

/*!50001 DROP VIEW IF EXISTS `vista_citas_por_especialidad`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_citas_por_especialidad` AS select `e`.`nombre` AS `especialidad`,count(0) AS `total_citas` from ((`turnos` `t` join `medicos` `m` on((`t`.`medico_id` = `m`.`id`))) join `especialidades` `e` on((`m`.`especialidad_id` = `e`.`id`))) group by `e`.`nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_detalle_paciente`
--

/*!50001 DROP VIEW IF EXISTS `vista_detalle_paciente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_detalle_paciente` AS select `p`.`id` AS `id`,`p`.`nombre` AS `nombre`,`obtener_edad`(`p`.`fecha_nacimiento`) AS `edad`,`total_turnos_paciente`(`p`.`id`) AS `total_turnos` from `pacientes` `p` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_disponibilidad_medicos`
--

/*!50001 DROP VIEW IF EXISTS `vista_disponibilidad_medicos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_disponibilidad_medicos` AS select `m`.`id` AS `id`,`m`.`nombre` AS `nombre`,`e`.`nombre` AS `especialidad` from (`medicos` `m` join `especialidades` `e` on((`m`.`especialidad_id` = `e`.`id`))) where `m`.`id` in (select `turnos`.`medico_id` from `turnos` where (`turnos`.`fecha` = curdate())) is false */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_turnos_activos`
--

/*!50001 DROP VIEW IF EXISTS `vista_turnos_activos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_turnos_activos` AS select `t`.`id` AS `id`,`p`.`nombre` AS `paciente`,`m`.`nombre` AS `medico`,`t`.`fecha` AS `fecha`,`t`.`hora` AS `hora`,`t`.`estado` AS `estado` from ((`turnos` `t` join `pacientes` `p` on((`t`.`paciente_id` = `p`.`id`))) join `medicos` `m` on((`t`.`medico_id` = `m`.`id`))) where (`t`.`estado` = 'pendiente') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-02 12:45:19
