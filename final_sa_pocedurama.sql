CREATE DATABASE  IF NOT EXISTS `autosalon` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `autosalon`;
-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: autosalon
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `automobili`
--

DROP TABLE IF EXISTS `automobili`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `automobili` (
  `broj_sasije` varchar(100) NOT NULL,
  `naziv_automobila` varchar(50) NOT NULL,
  `cijena` decimal(8,2) NOT NULL,
  `klase_automobila_klasa_id` int(11) NOT NULL,
  `brendovi_automobila_brend_id` int(11) NOT NULL,
  `opreme_oprema_id` int(11) NOT NULL,
  PRIMARY KEY (`broj_sasije`),
  KEY `fk_automobili_klase_automobila1_idx` (`klase_automobila_klasa_id`),
  KEY `fk_automobili_brendovi_automobila1_idx` (`brendovi_automobila_brend_id`),
  KEY `fk_automobili_opreme1_idx` (`opreme_oprema_id`),
  CONSTRAINT `fk_automobili_brendovi_automobila1` FOREIGN KEY (`brendovi_automobila_brend_id`) REFERENCES `brendovi_automobila` (`brend_id`),
  CONSTRAINT `fk_automobili_klase_automobila1` FOREIGN KEY (`klase_automobila_klasa_id`) REFERENCES `klase_automobila` (`klasa_id`),
  CONSTRAINT `fk_automobili_opreme1` FOREIGN KEY (`opreme_oprema_id`) REFERENCES `opreme` (`oprema_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automobili`
--

LOCK TABLES `automobili` WRITE;
/*!40000 ALTER TABLE `automobili` DISABLE KEYS */;
INSERT INTO `automobili` VALUES ('GHFTZ278','Audi TT',100000.00,5,3,2),('HJ6147JDF','VW Passat 7',40000.00,2,1,4),('MG6947JD','Renault Talisman',30000.00,5,6,3),('NHZT5678','Mercedes GLE 220',70500.00,1,2,1),('U65077DH','VW Golf 6 TDI',50000.00,5,1,2),('U6947JDH','Audi Q3',60360.00,1,3,1),('ZU6247JD','VW Tiguan',38000.00,1,1,2),('ZU673GHA','Renault Cupra',50000.00,3,6,1);
/*!40000 ALTER TABLE `automobili` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brendovi_automobila`
--

DROP TABLE IF EXISTS `brendovi_automobila`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `brendovi_automobila` (
  `brend_id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv_brenda` varchar(15) NOT NULL,
  PRIMARY KEY (`brend_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brendovi_automobila`
--

LOCK TABLES `brendovi_automobila` WRITE;
/*!40000 ALTER TABLE `brendovi_automobila` DISABLE KEYS */;
INSERT INTO `brendovi_automobila` VALUES (1,'VW'),(2,'Mercedes'),(3,'Audi'),(4,'Seat'),(5,'AlfaRomeo'),(6,'Renault'),(7,'Peugeot'),(8,'Dacia'),(9,'Citroen'),(10,'Lancia');
/*!40000 ALTER TABLE `brendovi_automobila` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fakture`
--

DROP TABLE IF EXISTS `fakture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fakture` (
  `datum` date NOT NULL,
  `nacin_placanja_nacin_placanja_id` int(11) NOT NULL,
  `prodaje_faktura_id` int(11) NOT NULL AUTO_INCREMENT,
  `uposlenici_uposlenik_id` int(11) NOT NULL,
  PRIMARY KEY (`prodaje_faktura_id`),
  KEY `fk_fakture_nacin_placanja1_idx` (`nacin_placanja_nacin_placanja_id`),
  KEY `fk_fakture_prodaje1_idx` (`prodaje_faktura_id`),
  KEY `fk_fakture_uposlenici1_idx` (`uposlenici_uposlenik_id`),
  CONSTRAINT `fk_fakture_nacin_placanja1` FOREIGN KEY (`nacin_placanja_nacin_placanja_id`) REFERENCES `nacin_placanja` (`nacin_placanja_id`),
  CONSTRAINT `fk_fakture_prodaje1` FOREIGN KEY (`prodaje_faktura_id`) REFERENCES `prodaje` (`faktura_id`),
  CONSTRAINT `fk_fakture_uposlenici1` FOREIGN KEY (`uposlenici_uposlenik_id`) REFERENCES `uposlenici` (`uposlenik_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fakture`
--

LOCK TABLES `fakture` WRITE;
/*!40000 ALTER TABLE `fakture` DISABLE KEYS */;
INSERT INTO `fakture` VALUES ('2020-03-01',2,1,3),('2020-02-05',2,2,4),('2020-02-01',1,3,3),('2020-02-11',3,4,4),('2020-04-12',4,5,3),('2020-04-15',3,6,4),('2020-06-12',2,7,3),('2020-06-15',4,8,4);
/*!40000 ALTER TABLE `fakture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klase_automobila`
--

DROP TABLE IF EXISTS `klase_automobila`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `klase_automobila` (
  `klasa_id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv_klase` varchar(10) NOT NULL,
  PRIMARY KEY (`klasa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klase_automobila`
--

LOCK TABLES `klase_automobila` WRITE;
/*!40000 ALTER TABLE `klase_automobila` DISABLE KEYS */;
INSERT INTO `klase_automobila` VALUES (1,'SUV'),(2,'Karavan'),(3,'Limuzina'),(4,'Roadster'),(5,'Coupe');
/*!40000 ALTER TABLE `klase_automobila` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kupci`
--

DROP TABLE IF EXISTS `kupci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `kupci` (
  `kupac_id` int(11) NOT NULL AUTO_INCREMENT,
  `prezime` varchar(20) NOT NULL,
  `ime` varchar(10) NOT NULL,
  `telefon` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `uposlenici_uposlenik_id` int(11) NOT NULL,
  PRIMARY KEY (`kupac_id`),
  KEY `fk_kupci_uposlenici1_idx` (`uposlenici_uposlenik_id`),
  CONSTRAINT `fk_kupci_uposlenici1` FOREIGN KEY (`uposlenici_uposlenik_id`) REFERENCES `uposlenici` (`uposlenik_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kupci`
--

LOCK TABLES `kupci` WRITE;
/*!40000 ALTER TABLE `kupci` DISABLE KEYS */;
INSERT INTO `kupci` VALUES (1,'Ahmetovic','Mersudin','062 567845','m.ahmetovic@gmail.com',3),(2,'Nanic','Hamza','062 567845','h.nanic@gmail.com',4),(3,'Bojicic','Mirnes','062 654321','m.bojicic@gmail.com',3),(4,'Dupovac','Amer','062 435645','a.dupovac@gmail.com',4),(5,'Tatar','Benjamin','062 43245','b.tatar@gmail.com',3),(6,'Rahmanovic','Amar','062 127445','a.rahmanovic@gmail.com',4),(7,'Milicevic','Hrvoje','062 357845','h.milicevic@gmail.com',4),(8,'Alaim','Muhamed','061 246845','a.alaim@gmail.com',3);
/*!40000 ALTER TABLE `kupci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nacin_placanja`
--

DROP TABLE IF EXISTS `nacin_placanja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `nacin_placanja` (
  `nacin_placanja_id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv_nacin_placanja` varchar(12) NOT NULL,
  PRIMARY KEY (`nacin_placanja_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nacin_placanja`
--

LOCK TABLES `nacin_placanja` WRITE;
/*!40000 ALTER TABLE `nacin_placanja` DISABLE KEYS */;
INSERT INTO `nacin_placanja` VALUES (1,'na_rate'),(2,'gotovina'),(3,'lizing'),(4,'karticno');
/*!40000 ALTER TABLE `nacin_placanja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opreme`
--

DROP TABLE IF EXISTS `opreme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `opreme` (
  `oprema_id` int(11) NOT NULL AUTO_INCREMENT,
  `tip_opreme` varchar(10) NOT NULL,
  PRIMARY KEY (`oprema_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opreme`
--

LOCK TABLES `opreme` WRITE;
/*!40000 ALTER TABLE `opreme` DISABLE KEYS */;
INSERT INTO `opreme` VALUES (1,'Sport'),(2,'R-Line'),(3,'Style'),(4,'Advanced');
/*!40000 ALTER TABLE `opreme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poslovnice`
--

DROP TABLE IF EXISTS `poslovnice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `poslovnice` (
  `poslovnica_id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv_poslovnice` varchar(30) NOT NULL,
  `grad` varchar(15) NOT NULL,
  `adresa` varchar(30) NOT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `profit` decimal(8,2) NOT NULL,
  `uposlenik_id` int(11) NOT NULL,
  `radno_vrijeme` varchar(20) DEFAULT NULL,
  `automobili_broj_sasije` varchar(15) NOT NULL,
  PRIMARY KEY (`poslovnica_id`),
  KEY `fk_poslovnice_automobili1_idx` (`automobili_broj_sasije`),
  CONSTRAINT `fk_poslovnice_automobili1` FOREIGN KEY (`automobili_broj_sasije`) REFERENCES `automobili` (`broj_sasije`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poslovnice`
--

LOCK TABLES `poslovnice` WRITE;
/*!40000 ALTER TABLE `poslovnice` DISABLE KEYS */;
INSERT INTO `poslovnice` VALUES (1,'SarajevoExpertStup','Sarajevo','Hifzi Bjelavca 11','033 456768',140000.00,1,'08:00-16:00','GHFTZ278'),(2,'SarajevoExpertOtes','Sarajevo','Prijedorska 27','033 654768',120000.00,3,'08:00-16:00','HJ6147JDF'),(4,'MostarExpert','Mostar','Maršala Tita 2','033 456832',90000.00,2,'08:00-16:00','MG6947JD');
/*!40000 ALTER TABLE `poslovnice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prodaje`
--

DROP TABLE IF EXISTS `prodaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `prodaje` (
  `faktura_id` int(11) NOT NULL,
  `komentar` varchar(200) DEFAULT NULL,
  `poslovnice_poslovnica_id` int(11) NOT NULL,
  `automobili_broj_sasije` varchar(15) NOT NULL,
  `kupci_kupac_id` int(11) NOT NULL,
  `uposlenici_uposlenik_id1` int(11) NOT NULL,
  PRIMARY KEY (`faktura_id`),
  KEY `fk_prodaje_poslovnice1_idx` (`poslovnice_poslovnica_id`),
  KEY `fk_prodaje_automobili1_idx` (`automobili_broj_sasije`),
  KEY `fk_prodaje_kupci1_idx` (`kupci_kupac_id`),
  KEY `fk_prodaje_uposlenici2_idx` (`uposlenici_uposlenik_id1`),
  CONSTRAINT `fk_prodaje_automobili1` FOREIGN KEY (`automobili_broj_sasije`) REFERENCES `automobili` (`broj_sasije`),
  CONSTRAINT `fk_prodaje_kupci1` FOREIGN KEY (`kupci_kupac_id`) REFERENCES `kupci` (`kupac_id`),
  CONSTRAINT `fk_prodaje_poslovnice1` FOREIGN KEY (`poslovnice_poslovnica_id`) REFERENCES `poslovnice` (`poslovnica_id`),
  CONSTRAINT `fk_prodaje_uposlenici2` FOREIGN KEY (`uposlenici_uposlenik_id1`) REFERENCES `uposlenici` (`uposlenik_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodaje`
--

LOCK TABLES `prodaje` WRITE;
/*!40000 ALTER TABLE `prodaje` DISABLE KEYS */;
INSERT INTO `prodaje` VALUES (1,'/',1,'GHFTZ278',1,3),(2,'/',2,'HJ6147JDF',2,4),(3,'/',4,'MG6947JD',3,4),(4,'/',1,'NHZT5678',4,3),(5,'/',2,'U65077DH',5,3),(6,'/',1,'U6947JDH',6,4),(7,'/',4,'ZU6247JD',7,3),(8,'/',1,'ZU673GHA',8,3);
/*!40000 ALTER TABLE `prodaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uposlenici`
--

DROP TABLE IF EXISTS `uposlenici`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `uposlenici` (
  `uposlenik_id` int(11) NOT NULL AUTO_INCREMENT,
  `prezime` varchar(20) NOT NULL,
  `ime` varchar(10) NOT NULL,
  `telefon` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `titula` varchar(15) NOT NULL,
  `plata` decimal(6,2) NOT NULL,
  `datum_zaposljenja` date NOT NULL,
  `uposlenici_uposlenik_id` int(11) NOT NULL,
  `poslovnice_poslovnica_id` int(11) NOT NULL,
  PRIMARY KEY (`uposlenik_id`),
  KEY `fk_uposlenici_uposlenici1_idx` (`uposlenici_uposlenik_id`),
  KEY `fk_uposlenici_poslovnice1_idx` (`poslovnice_poslovnica_id`),
  CONSTRAINT `fk_uposlenici_poslovnice1` FOREIGN KEY (`poslovnice_poslovnica_id`) REFERENCES `poslovnice` (`poslovnica_id`),
  CONSTRAINT `fk_uposlenici_uposlenici1` FOREIGN KEY (`uposlenici_uposlenik_id`) REFERENCES `uposlenici` (`uposlenik_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uposlenici`
--

LOCK TABLES `uposlenici` WRITE;
/*!40000 ALTER TABLE `uposlenici` DISABLE KEYS */;
INSERT INTO `uposlenici` VALUES (1,'Smith','Cowin','062 111111','smith.cowin@gmail.com','direktor',5000.00,'2020-01-01',1,1),(2,'Stanly','Keydwin','062 222222','stanly.keydwin@gmail.com','sef poslovnice',2000.00,'2020-05-03',1,2),(3,'Mathias','Fanimo','061 345141','mathias.fanimo@gmail.com','prodavac',1000.00,'2020-03-10',2,2),(4,'Joakim','Adukor','061 346171','joakim.adukor@gmail.com','prodavac',1000.00,'2020-04-10',1,1),(6,'Felix','Brandao','061 234156','felix.brandao@gmail.com','sef poslovnice',2000.00,'2020-05-10',1,4),(9,'Wagner','Dani','062 454156','dani.wagner@gmail.com','prodavac',1000.00,'2020-03-10',6,4);
/*!40000 ALTER TABLE `uposlenici` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'autosalon'
--
/*!50003 DROP PROCEDURE IF EXISTS `daj_klasu_automobila` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `daj_klasu_automobila`(in p_klasa char(30))
begin
	select a.broj_sasije as "Sasija", 
		a.naziv_automobila as "Automobil", 
		a.cijena as "Cijena", 
		k.naziv_klase as "Klasa", 
		o.tip_opreme as "Oprema"
		from automobili a
	inner join klase_automobila k on a.klase_automobila_klasa_id = k.klasa_id
	inner join opreme o on a.opreme_oprema_id = o.oprema_id
	where k.naziv_klase = p_klasa;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `izlistaj_poslovnice_iz_grada` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `izlistaj_poslovnice_iz_grada`(in p_grad CHAR(20))
begin
select poslovnica_id, 
	naziv_poslovnice as "Naziv poslovnice", 
    grad, 
    adresa, 
    telefon, 
    radno_vrijeme as "Radno vrijeme" 
    from poslovnice where grad = p_grad; 
end ;;
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

-- Dump completed on 2020-12-23  4:18:26
