CREATE DATABASE  IF NOT EXISTS `auto_salon` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `auto_salon`;
-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: auto_salon
-- ------------------------------------------------------
-- Server version	8.0.22-0ubuntu0.20.04.3

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
-- Table structure for table `poslovnice`
--

DROP TABLE IF EXISTS `poslovnice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poslovnice` (
  `id_poslovnice` int NOT NULL AUTO_INCREMENT,
  `ime_poslovnice` varchar(50) NOT NULL,
  `glavna_poslovnica` tinyint(1) DEFAULT '0',
  `broj_zaposlenih` int DEFAULT NULL,
  `broj_menadera` int DEFAULT NULL,
  `grad_poslovnice` varchar(50) NOT NULL,
  `drzava_poslovnice` varchar(50) NOT NULL,
  `obrt_poslovnice` int DEFAULT NULL,
  `profit_poslovnice` int DEFAULT NULL,
  `broj_prodanih_automobila` int DEFAULT NULL,
  `Zadovoljena_kvota` tinyint(1) DEFAULT NULL,
  `broj_prodanih_automobila_za_kes` int DEFAULT NULL,
  `broj_prodanih_automobila_na_rate` int DEFAULT NULL,
  `broj_automobila_na_lageru` int DEFAULT NULL,
  `broj_faktura` int DEFAULT NULL,
  `broj_narudbi` int DEFAULT NULL,
  PRIMARY KEY (`id_poslovnice`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poslovnice`
--

LOCK TABLES `poslovnice` WRITE;
/*!40000 ALTER TABLE `poslovnice` DISABLE KEYS */;
INSERT INTO `poslovnice` VALUES (1,'Sarajevska',1,10,3,'Sarajevo','Bih',150000,30000,20,1,15,5,10,20,25);
/*!40000 ALTER TABLE `poslovnice` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-15 19:48:33
