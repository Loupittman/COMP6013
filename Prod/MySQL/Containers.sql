CREATE DATABASE  IF NOT EXISTS `container_identification` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `container_identification`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: container_identification
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `component`
--

DROP TABLE IF EXISTS `component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `component` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `fk_container_id` int unsigned NOT NULL,
  `quantity` int unsigned NOT NULL,
  `level` int unsigned NOT NULL,
  `load_unit_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_container_id_idx` (`fk_container_id`),
  KEY `load_unit_id_idx` (`load_unit_id`),
  CONSTRAINT `fk_container_id` FOREIGN KEY (`fk_container_id`) REFERENCES `container` (`id`),
  CONSTRAINT `load_unit_id` FOREIGN KEY (`load_unit_id`) REFERENCES `load_unit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1674 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `container`
--

DROP TABLE IF EXISTS `container`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `container` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `container_id` varchar(12) NOT NULL,
  `type` varchar(30) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `vle` varchar(16) DEFAULT NULL,
  `model_mix` varchar(45) DEFAULT NULL,
  `empties_storage` varchar(45) DEFAULT NULL,
  `empties_lane` varchar(30) DEFAULT NULL,
  `jis_route` varchar(8) DEFAULT NULL,
  `length` decimal(10,1) DEFAULT NULL,
  `width` decimal(10,1) DEFAULT NULL,
  `height` decimal(10,1) DEFAULT NULL,
  `weight` decimal(10,1) DEFAULT NULL,
  `haulier_id` int unsigned DEFAULT NULL,
  `load_unit_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `container_id_UNIQUE` (`container_id`),
  KEY `haulier_id_idx` (`haulier_id`),
  CONSTRAINT `haulier_id` FOREIGN KEY (`haulier_id`) REFERENCES `haulier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1006 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `container_supplier`
--

DROP TABLE IF EXISTS `container_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `container_supplier` (
  `container_supplier_id` int unsigned NOT NULL AUTO_INCREMENT,
  `container_id` int unsigned NOT NULL,
  `supplier_id` int unsigned NOT NULL,
  PRIMARY KEY (`container_supplier_id`),
  KEY `container_id_idx` (`container_id`),
  KEY `supplier_id_idx` (`supplier_id`),
  CONSTRAINT `container_id` FOREIGN KEY (`container_id`) REFERENCES `container` (`id`),
  CONSTRAINT `supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `haulier`
--

DROP TABLE IF EXISTS `haulier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `haulier` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `haulier` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `load_unit`
--

DROP TABLE IF EXISTS `load_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `load_unit` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `length` decimal(10,1) DEFAULT NULL,
  `width` decimal(10,1) DEFAULT NULL,
  `height` decimal(10,1) DEFAULT NULL,
  `weight` decimal(10,1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=644 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(12) DEFAULT NULL,
  `name` varchar(120) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `contact` varchar(112) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'container_identification'
--

--
-- Dumping routines for database 'container_identification'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-19 11:15:10
