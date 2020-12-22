-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema autosalon
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema autosalon
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `autosalon` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `autosalon` ;

-- -----------------------------------------------------
-- Table `autosalon`.`brendovi_automobila`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `autosalon`.`brendovi_automobila` (
  `brend_id` INT NOT NULL AUTO_INCREMENT,
  `naziv_brenda` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`brend_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `autosalon`.`klase_automobila`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `autosalon`.`klase_automobila` (
  `klasa_id` INT NOT NULL AUTO_INCREMENT,
  `naziv_klase` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`klasa_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `autosalon`.`opreme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `autosalon`.`opreme` (
  `oprema_id` INT NOT NULL AUTO_INCREMENT,
  `tip_opreme` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`oprema_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `autosalon`.`automobili`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `autosalon`.`automobili` (
  `broj_sasije` VARCHAR(15) NOT NULL,
  `cijena` DECIMAL(8,2) NOT NULL,
  `klasa_id` INT NOT NULL,
  `brend_id` INT NOT NULL,
  `oprema_id` INT NOT NULL,
  PRIMARY KEY (`broj_sasije`),
  INDEX `fk_automobili_klase_automobila1_idx` (`klasa_id` ASC) VISIBLE,
  INDEX `fk_automobili_brendovi_automobila1_idx` (`brend_id` ASC) VISIBLE,
  INDEX `fk_automobili_opreme1_idx` (`oprema_id` ASC) VISIBLE,
  CONSTRAINT `fk_automobili_brendovi_automobila1`
    FOREIGN KEY (`brend_id`)
    REFERENCES `autosalon`.`brendovi_automobila` (`brend_id`),
  CONSTRAINT `fk_automobili_klase_automobila1`
    FOREIGN KEY (`klasa_id`)
    REFERENCES `autosalon`.`klase_automobila` (`klasa_id`),
  CONSTRAINT `fk_automobili_opreme1`
    FOREIGN KEY (`oprema_id`)
    REFERENCES `autosalon`.`opreme` (`oprema_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `autosalon`.`nacin_placanja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `autosalon`.`nacin_placanja` (
  `nacin_placanja_id` INT NOT NULL AUTO_INCREMENT,
  `naziv_nacin_placanja` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`nacin_placanja_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `autosalon`.`poslovnice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `autosalon`.`poslovnice` (
  `poslovnica_id` INT NOT NULL AUTO_INCREMENT,
  `naziv_poslovnice` VARCHAR(30) NOT NULL,
  `grad` VARCHAR(15) NOT NULL,
  `adresa` VARCHAR(30) NOT NULL,
  `telefon` VARCHAR(10) NOT NULL,
  `profit` DECIMAL(8,2) NOT NULL,
  `faktura_id` INT NOT NULL,
  `uposlenik_id` INT NOT NULL,
  `radno_vrijeme` VARCHAR(10) NOT NULL,
  `broj_sasije` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`poslovnica_id`),
  INDEX `fk_poslovnice_automobili1_idx` (`broj_sasije` ASC) VISIBLE,
  CONSTRAINT `fk_poslovnice_automobili1`
    FOREIGN KEY (`broj_sasije`)
    REFERENCES `autosalon`.`automobili` (`broj_sasije`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `autosalon`.`uposlenici`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `autosalon`.`uposlenici` (
  `uposlenik_id` INT NOT NULL AUTO_INCREMENT,
  `prezime` VARCHAR(20) NOT NULL,
  `ime` VARCHAR(10) NOT NULL,
  `telefon` VARCHAR(10) NOT NULL,
  `email` VARCHAR(30) NOT NULL,
  `titula` VARCHAR(15) NOT NULL,
  `plata` DECIMAL(6,2) NOT NULL,
  `datum_zaposljenja` DATE NOT NULL,
  `nadredjeni` INT NOT NULL,
  `poslovnica_id` INT NOT NULL,
  PRIMARY KEY (`uposlenik_id`),
  INDEX `fk_uposlenici_uposlenici1_idx` (`nadredjeni` ASC) VISIBLE,
  INDEX `fk_uposlenici_poslovnice1_idx` (`poslovnica_id` ASC) VISIBLE,
  CONSTRAINT `fk_uposlenici_poslovnice1`
    FOREIGN KEY (`poslovnica_id`)
    REFERENCES `autosalon`.`poslovnice` (`poslovnica_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_uposlenici_uposlenici1`
    FOREIGN KEY (`nadredjeni`)
    REFERENCES `autosalon`.`uposlenici` (`uposlenik_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `autosalon`.`fakture`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `autosalon`.`fakture` (
  `datum` DATE NOT NULL,
  `nacin_placanja_id` INT NOT NULL,
  `izdao` INT NOT NULL,
  `faktura_id` INT NOT NULL,
  PRIMARY KEY (`faktura_id`),
  INDEX `fk_fakture_nacin_placanja1_idx` (`nacin_placanja_id` ASC) VISIBLE,
  INDEX `fk_fakture_uposlenici1_idx` (`izdao` ASC) VISIBLE,
  CONSTRAINT `fk_fakture_nacin_placanja1`
    FOREIGN KEY (`nacin_placanja_id`)
    REFERENCES `autosalon`.`nacin_placanja` (`nacin_placanja_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_fakture_uposlenici1`
    FOREIGN KEY (`izdao`)
    REFERENCES `autosalon`.`uposlenici` (`uposlenik_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `autosalon`.`kupci`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `autosalon`.`kupci` (
  `kupac_id` INT NOT NULL AUTO_INCREMENT,
  `prezime` VARCHAR(20) NOT NULL,
  `ime` VARCHAR(10) NOT NULL,
  `telefon` VARCHAR(10) NOT NULL,
  `email` VARCHAR(30) NOT NULL,
  `uposlenik_id` INT NOT NULL,
  PRIMARY KEY (`kupac_id`),
  INDEX `fk_kupci_uposlenici1_idx` (`uposlenik_id` ASC) VISIBLE,
  CONSTRAINT `fk_kupci_uposlenici1`
    FOREIGN KEY (`uposlenik_id`)
    REFERENCES `autosalon`.`uposlenici` (`uposlenik_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `autosalon`.`prodaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `autosalon`.`prodaje` (
  `komentar` VARCHAR(200) NULL DEFAULT NULL,
  `poslovnica_id` INT NOT NULL,
  `broj_sasije` VARCHAR(15) NOT NULL,
  `kupac_id` INT NOT NULL,
  `uposlenik_id` INT NOT NULL,
  `faktura_id` INT NOT NULL,
  PRIMARY KEY (`faktura_id`),
  INDEX `fk_prodaje_poslovnice1_idx` (`poslovnica_id` ASC) VISIBLE,
  INDEX `fk_prodaje_automobili1_idx` (`broj_sasije` ASC) VISIBLE,
  INDEX `fk_prodaje_kupci1_idx` (`kupac_id` ASC) VISIBLE,
  INDEX `fk_prodaje_uposlenici2_idx` (`uposlenik_id` ASC) VISIBLE,
  INDEX `fk_prodaje_fakture1_idx` (`faktura_id` ASC) VISIBLE,
  CONSTRAINT `fk_prodaje_automobili1`
    FOREIGN KEY (`broj_sasije`)
    REFERENCES `autosalon`.`automobili` (`broj_sasije`),
  CONSTRAINT `fk_prodaje_fakture1`
    FOREIGN KEY (`faktura_id`)
    REFERENCES `autosalon`.`fakture` (`faktura_id`),
  CONSTRAINT `fk_prodaje_kupci1`
    FOREIGN KEY (`kupac_id`)
    REFERENCES `autosalon`.`kupci` (`kupac_id`),
  CONSTRAINT `fk_prodaje_poslovnice1`
    FOREIGN KEY (`poslovnica_id`)
    REFERENCES `autosalon`.`poslovnice` (`poslovnica_id`),
  CONSTRAINT `fk_prodaje_uposlenici2`
    FOREIGN KEY (`uposlenik_id`)
    REFERENCES `autosalon`.`uposlenici` (`uposlenik_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `autosalon`.`brendovi_automobila`
-- -----------------------------------------------------
START TRANSACTION;
USE `autosalon`;
INSERT INTO `autosalon`.`brendovi_automobila` (`brend_id`, `naziv_brenda`) VALUES (0, 'VW');
INSERT INTO `autosalon`.`brendovi_automobila` (`brend_id`, `naziv_brenda`) VALUES (0, 'Mercedes');
INSERT INTO `autosalon`.`brendovi_automobila` (`brend_id`, `naziv_brenda`) VALUES (0, 'Audi');
INSERT INTO `autosalon`.`brendovi_automobila` (`brend_id`, `naziv_brenda`) VALUES (0, 'Seat');
INSERT INTO `autosalon`.`brendovi_automobila` (`brend_id`, `naziv_brenda`) VALUES (0, 'AlfaRomeo');
INSERT INTO `autosalon`.`brendovi_automobila` (`brend_id`, `naziv_brenda`) VALUES (0, 'Renault');
INSERT INTO `autosalon`.`brendovi_automobila` (`brend_id`, `naziv_brenda`) VALUES (0, 'Peugeot');
INSERT INTO `autosalon`.`brendovi_automobila` (`brend_id`, `naziv_brenda`) VALUES (0, 'Dacia');
INSERT INTO `autosalon`.`brendovi_automobila` (`brend_id`, `naziv_brenda`) VALUES (0, 'Citroen');
INSERT INTO `autosalon`.`brendovi_automobila` (`brend_id`, `naziv_brenda`) VALUES (0, 'Lancia');

COMMIT;


-- -----------------------------------------------------
-- Data for table `autosalon`.`nacin_placanja`
-- -----------------------------------------------------
START TRANSACTION;
USE `autosalon`;
INSERT INTO `autosalon`.`nacin_placanja` (`nacin_placanja_id`, `naziv_nacin_placanja`) VALUES (0, 'gotovina');
INSERT INTO `autosalon`.`nacin_placanja` (`nacin_placanja_id`, `naziv_nacin_placanja`) VALUES (0, 'na_rate');
INSERT INTO `autosalon`.`nacin_placanja` (`nacin_placanja_id`, `naziv_nacin_placanja`) VALUES (0, 'lizing');
INSERT INTO `autosalon`.`nacin_placanja` (`nacin_placanja_id`, `naziv_nacin_placanja`) VALUES (0, 'karticno');

COMMIT;


-- -----------------------------------------------------
-- Data for table `autosalon`.`fakture`
-- -----------------------------------------------------
START TRANSACTION;
USE `autosalon`;
INSERT INTO `autosalon`.`fakture` (`datum`, `nacin_placanja_id`, `izdao`, `faktura_id`) VALUES ('2017.11.23', 1, 1, 0);
INSERT INTO `autosalon`.`fakture` (`datum`, `nacin_placanja_id`, `izdao`, `faktura_id`) VALUES ('2018.02.11', 3, 4, 0);
INSERT INTO `autosalon`.`fakture` (`datum`, `nacin_placanja_id`, `izdao`, `faktura_id`) VALUES ('2018.12.20', 1, 5, 0);
INSERT INTO `autosalon`.`fakture` (`datum`, `nacin_placanja_id`, `izdao`, `faktura_id`) VALUES ('2016.03.13', 4, 6, 0);
INSERT INTO `autosalon`.`fakture` (`datum`, `nacin_placanja_id`, `izdao`, `faktura_id`) VALUES ('2018.05.15', 4, 7, 0);
INSERT INTO `autosalon`.`fakture` (`datum`, `nacin_placanja_id`, `izdao`, `faktura_id`) VALUES ('2018.10.28', 2, 10, 0);

COMMIT;

