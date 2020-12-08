-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: projekt
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
-- Table structure for table `fakture`
--

DROP TABLE IF EXISTS `fakture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fakture` (
  `brojFakture` int NOT NULL AUTO_INCREMENT,
  `kupac` char(25) DEFAULT NULL,
  `datumIsporuke` char(10) DEFAULT NULL,
  `pdv` decimal(3,2) DEFAULT NULL,
  `rabat` char(10) DEFAULT NULL,
  `kolicina` int DEFAULT NULL,
  `cijena` int DEFAULT NULL,
  `total` int DEFAULT NULL,
  `automobili_id` char(10) DEFAULT NULL,
  PRIMARY KEY (`brojFakture`)
) ENGINE=InnoDB AUTO_INCREMENT=10351 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fakture`
--

LOCK TABLES `fakture` WRITE;
/*!40000 ALTER TABLE `fakture` DISABLE KEYS */;
INSERT INTO `fakture` VALUES (1,'Danijel Briški','2020-10-20',0.17,'0.00',2,35000,40950,'/'),(2,'Sandin Vrpčić','2020-09-15',0.17,'0.00',2,56000,65520,'/'),(3,'Mirza Šabotić','2020-09-15',0.17,'0.00',1,32000,37440,'/'),(4,'Mujo Mujić','2020-01-02',0.17,'0.00',2,20500,23985,'/'),(10345,'Danijel Briški','2020-10-20',-9.99,'0.00',1,35000,40950,'/'),(10346,'','2020-8-11',0.17,'/',1,56000,65520,'/'),(10347,'','2019-1-26',0.17,'/',1,20500,23985,'/'),(10348,'','2018-11-2',0.17,'/',2,32000,37440,'/'),(10349,'','2018-9-1',0.17,'/',1,15000,17550,'/'),(10350,'','2020-8-10',0.17,'/',1,12000,14040,'/');
/*!40000 ALTER TABLE `fakture` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-09  0:38:54
