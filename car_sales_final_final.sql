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
  `broj_sasije` VARCHAR(100) NOT NULL,
  `naziv_automobila` VARCHAR(50) NOT NULL,
  `cijena` DECIMAL(8,2) NOT NULL,
  `klase_automobila_klasa_id` INT NOT NULL,
  `brendovi_automobila_brend_id` INT NOT NULL,
  `opreme_oprema_id` INT NOT NULL,
  PRIMARY KEY (`broj_sasije`),
  INDEX `fk_automobili_klase_automobila1_idx` (`klase_automobila_klasa_id` ASC) VISIBLE,
  INDEX `fk_automobili_brendovi_automobila1_idx` (`brendovi_automobila_brend_id` ASC) VISIBLE,
  INDEX `fk_automobili_opreme1_idx` (`opreme_oprema_id` ASC) VISIBLE,
  CONSTRAINT `fk_automobili_brendovi_automobila1`
    FOREIGN KEY (`brendovi_automobila_brend_id`)
    REFERENCES `autosalon`.`brendovi_automobila` (`brend_id`),
  CONSTRAINT `fk_automobili_klase_automobila1`
    FOREIGN KEY (`klase_automobila_klasa_id`)
    REFERENCES `autosalon`.`klase_automobila` (`klasa_id`),
  CONSTRAINT `fk_automobili_opreme1`
    FOREIGN KEY (`opreme_oprema_id`)
    REFERENCES `autosalon`.`opreme` (`oprema_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  `automobili_broj_sasije` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`poslovnica_id`),
  INDEX `fk_poslovnice_automobili1_idx` (`automobili_broj_sasije` ASC) VISIBLE,
  CONSTRAINT `fk_poslovnice_automobili1`
    FOREIGN KEY (`automobili_broj_sasije`)
    REFERENCES `autosalon`.`automobili` (`broj_sasije`))
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
  `uposlenici_uposlenik_id` INT NOT NULL,
  `poslovnice_poslovnica_id` INT NOT NULL,
  PRIMARY KEY (`uposlenik_id`),
  INDEX `fk_uposlenici_uposlenici1_idx` (`uposlenici_uposlenik_id` ASC) VISIBLE,
  INDEX `fk_uposlenici_poslovnice1_idx` (`poslovnice_poslovnica_id` ASC) VISIBLE,
  CONSTRAINT `fk_uposlenici_poslovnice1`
    FOREIGN KEY (`poslovnice_poslovnica_id`)
    REFERENCES `autosalon`.`poslovnice` (`poslovnica_id`),
  CONSTRAINT `fk_uposlenici_uposlenici1`
    FOREIGN KEY (`uposlenici_uposlenik_id`)
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
  `uposlenici_uposlenik_id` INT NOT NULL,
  PRIMARY KEY (`kupac_id`),
  INDEX `fk_kupci_uposlenici1_idx` (`uposlenici_uposlenik_id` ASC) VISIBLE,
  CONSTRAINT `fk_kupci_uposlenici1`
    FOREIGN KEY (`uposlenici_uposlenik_id`)
    REFERENCES `autosalon`.`uposlenici` (`uposlenik_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `autosalon`.`prodaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `autosalon`.`prodaje` (
  `faktura_id` INT NOT NULL,
  `komentar` VARCHAR(200) NULL DEFAULT NULL,
  `poslovnice_poslovnica_id` INT NOT NULL,
  `automobili_broj_sasije` VARCHAR(15) NOT NULL,
  `kupci_kupac_id` INT NOT NULL,
  `uposlenici_uposlenik_id1` INT NOT NULL,
  PRIMARY KEY (`faktura_id`),
  INDEX `fk_prodaje_poslovnice1_idx` (`poslovnice_poslovnica_id` ASC) VISIBLE,
  INDEX `fk_prodaje_automobili1_idx` (`automobili_broj_sasije` ASC) VISIBLE,
  INDEX `fk_prodaje_kupci1_idx` (`kupci_kupac_id` ASC) VISIBLE,
  INDEX `fk_prodaje_uposlenici2_idx` (`uposlenici_uposlenik_id1` ASC) VISIBLE,
  CONSTRAINT `fk_prodaje_automobili1`
    FOREIGN KEY (`automobili_broj_sasije`)
    REFERENCES `autosalon`.`automobili` (`broj_sasije`),
  CONSTRAINT `fk_prodaje_kupci1`
    FOREIGN KEY (`kupci_kupac_id`)
    REFERENCES `autosalon`.`kupci` (`kupac_id`),
  CONSTRAINT `fk_prodaje_poslovnice1`
    FOREIGN KEY (`poslovnice_poslovnica_id`)
    REFERENCES `autosalon`.`poslovnice` (`poslovnica_id`),
  CONSTRAINT `fk_prodaje_uposlenici2`
    FOREIGN KEY (`uposlenici_uposlenik_id1`)
    REFERENCES `autosalon`.`uposlenici` (`uposlenik_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `autosalon`.`fakture`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `autosalon`.`fakture` (
  `datum` DATE NOT NULL,
  `nacin_placanja_nacin_placanja_id` INT NOT NULL,
  `prodaje_faktura_id` INT NOT NULL AUTO_INCREMENT,
  `uposlenici_uposlenik_id` INT NOT NULL,
  PRIMARY KEY (`prodaje_faktura_id`),
  INDEX `fk_fakture_nacin_placanja1_idx` (`nacin_placanja_nacin_placanja_id` ASC) VISIBLE,
  INDEX `fk_fakture_prodaje1_idx` (`prodaje_faktura_id` ASC) VISIBLE,
  INDEX `fk_fakture_uposlenici1_idx` (`uposlenici_uposlenik_id` ASC) VISIBLE,
  CONSTRAINT `fk_fakture_nacin_placanja1`
    FOREIGN KEY (`nacin_placanja_nacin_placanja_id`)
    REFERENCES `autosalon`.`nacin_placanja` (`nacin_placanja_id`),
  CONSTRAINT `fk_fakture_prodaje1`
    FOREIGN KEY (`prodaje_faktura_id`)
    REFERENCES `autosalon`.`prodaje` (`faktura_id`),
  CONSTRAINT `fk_fakture_uposlenici1`
    FOREIGN KEY (`uposlenici_uposlenik_id`)
    REFERENCES `autosalon`.`uposlenici` (`uposlenik_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Data for table `autosalon`.`brendovi_automobila`
-- -----------------------------------------------------
START TRANSACTION;
USE `autosalon`;
INSERT INTO `autosalon`.`brendovi_automobila` (`brend_id`, `naziv_brenda`) VALUES (DEFAULT, 'VW');
INSERT INTO `autosalon`.`brendovi_automobila` (`brend_id`, `naziv_brenda`) VALUES (DEFAULT, 'Mercedes');
INSERT INTO `autosalon`.`brendovi_automobila` (`brend_id`, `naziv_brenda`) VALUES (DEFAULT, 'Audi');
INSERT INTO `autosalon`.`brendovi_automobila` (`brend_id`, `naziv_brenda`) VALUES (DEFAULT, 'Seat');
INSERT INTO `autosalon`.`brendovi_automobila` (`brend_id`, `naziv_brenda`) VALUES (DEFAULT, 'AlfaRomeo');
INSERT INTO `autosalon`.`brendovi_automobila` (`brend_id`, `naziv_brenda`) VALUES (DEFAULT, 'Renault');
INSERT INTO `autosalon`.`brendovi_automobila` (`brend_id`, `naziv_brenda`) VALUES (DEFAULT, 'Peugeot');
INSERT INTO `autosalon`.`brendovi_automobila` (`brend_id`, `naziv_brenda`) VALUES (DEFAULT, 'Dacia');
INSERT INTO `autosalon`.`brendovi_automobila` (`brend_id`, `naziv_brenda`) VALUES (DEFAULT, 'Citroen');
INSERT INTO `autosalon`.`brendovi_automobila` (`brend_id`, `naziv_brenda`) VALUES (DEFAULT, 'Lancia');

COMMIT;


-- -----------------------------------------------------
-- Data for table `autosalon`.`klase_automobila`
-- -----------------------------------------------------
START TRANSACTION;
USE `autosalon`;
INSERT INTO `autosalon`.`klase_automobila` (`klasa_id`, `naziv_klase`) VALUES (DEFAULT, 'SUV');
INSERT INTO `autosalon`.`klase_automobila` (`klasa_id`, `naziv_klase`) VALUES (DEFAULT, 'Karavan');
INSERT INTO `autosalon`.`klase_automobila` (`klasa_id`, `naziv_klase`) VALUES (DEFAULT, 'Limuzina');
INSERT INTO `autosalon`.`klase_automobila` (`klasa_id`, `naziv_klase`) VALUES (DEFAULT, 'Roadster');
INSERT INTO `autosalon`.`klase_automobila` (`klasa_id`, `naziv_klase`) VALUES (DEFAULT, 'Coupe');

COMMIT;


-- -----------------------------------------------------
-- Data for table `autosalon`.`opreme`
-- -----------------------------------------------------
START TRANSACTION;
USE `autosalon`;
INSERT INTO `autosalon`.`opreme` (`oprema_id`, `tip_opreme`) VALUES (DEFAULT, 'Sport');
INSERT INTO `autosalon`.`opreme` (`oprema_id`, `tip_opreme`) VALUES (DEFAULT, 'R-Line');
INSERT INTO `autosalon`.`opreme` (`oprema_id`, `tip_opreme`) VALUES (DEFAULT, 'Style');
INSERT INTO `autosalon`.`opreme` (`oprema_id`, `tip_opreme`) VALUES (DEFAULT, 'Advanced');

COMMIT;


-- -----------------------------------------------------
-- Data for table `autosalon`.`automobili`
-- -----------------------------------------------------
START TRANSACTION;
USE `autosalon`;
INSERT INTO `autosalon`.`automobili` (`broj_sasije`, `naziv_automobila`, `cijena`, `klase_automobila_klasa_id`, `brendovi_automobila_brend_id`, `opreme_oprema_id`) VALUES ('NHZT5678','Mercedes GLE 220', 70500.00, 1, 2, 1);
INSERT INTO `autosalon`.`automobili` (`broj_sasije`, `naziv_automobila`,`cijena`, `klase_automobila_klasa_id`, `brendovi_automobila_brend_id`, `opreme_oprema_id`) VALUES ('U6947JDH','Audi Q3',60360.00, 1, 3, 1);
INSERT INTO `autosalon`.`automobili` (`broj_sasije`, `naziv_automobila`,`cijena`, `klase_automobila_klasa_id`, `brendovi_automobila_brend_id`, `opreme_oprema_id`) VALUES ('U65077DH','VW Golf 6 TDI',50000.00, 5, 1, 2);
INSERT INTO `autosalon`.`automobili` (`broj_sasije`, `naziv_automobila`,`cijena`, `klase_automobila_klasa_id`, `brendovi_automobila_brend_id`, `opreme_oprema_id`) VALUES ('MG6947JD','Renault Talisman',30000.00, 5, 6, 3);
INSERT INTO `autosalon`.`automobili` (`broj_sasije`, `naziv_automobila`,`cijena`, `klase_automobila_klasa_id`, `brendovi_automobila_brend_id`, `opreme_oprema_id`) VALUES ('HJ6147JDF','VW Passat 7' ,40000.00, 2, 1, 4);
INSERT INTO `autosalon`.`automobili` (`broj_sasije`, `naziv_automobila`,`cijena`, `klase_automobila_klasa_id`, `brendovi_automobila_brend_id`, `opreme_oprema_id`) VALUES ('ZU6247JD','VW Tiguan' ,38000.00, 1, 1, 2);
INSERT INTO `autosalon`.`automobili` (`broj_sasije`, `naziv_automobila`,`cijena`, `klase_automobila_klasa_id`, `brendovi_automobila_brend_id`, `opreme_oprema_id`) VALUES ('ZU673GHA','Renault Cupra',50000.00, 3, 6, 1);
INSERT INTO `autosalon`.`automobili` (`broj_sasije`, `naziv_automobila`,`cijena`, `klase_automobila_klasa_id`, `brendovi_automobila_brend_id`, `opreme_oprema_id`) VALUES ('GHFTZ278','Audi TT',100000.00, 5, 3, 2);

COMMIT;

/*novi unos*/
-- -----------------------------------------------------
-- Data for table `autosalon`.`poslovnice`
-- -----------------------------------------------------

/*
START TRANSACTION; 
USE `autosalon`;
INSERT INTO `autosalon`.`poslovnice` (`poslovnica_id`,`naziv_poslovnice`,`grad`,`adresa`,`telefon`,`profit`,,`uposlenik_id`,`radno_vrijeme`,`automobili_broj_sasije`)
VALUES (DEFAULT,'SarajevoExpertStup','Sarajevo','Hifzi Bjelavca 11','033 456-768',140000' ') */

insert into poslovnice values (DEFAULT,'SarajevoExpertStup','Sarajevo','Hifzi Bjelavca 11','033 456768',140000,1,'08:00-16:00','GHFTZ278'); 
insert into poslovnice values (DEFAULT,'SarajevoExpertOtes','Sarajevo','Prijedorska 27','033 654768',120000,3,'08:00-16:00','HJ6147JDF');
insert into poslovnice values (DEFAULT,'MostarExpert','Mostar','Maršala Tita 2','033 456832',90000,2,'08:00-16:00','MG6947JD');

insert into uposlenici values (DEFAULT,'Smith','Cowin','062 111111','smith.cowin@gmail.com','direktor',5000.00,'2020-01-01',1,1); 
insert into uposlenici values (DEFAULT,'Stanly','Keydwin','062 222222','stanly.keydwin@gmail.com','sef poslovnice',2000.00,'2020-05-03',1,2); 
insert into uposlenici values (DEFAULT,'Mathias','Fanimo','061 345141','mathias.fanimo@gmail.com','prodavac',1000.00,'2020-03-10',2,2); 
insert into uposlenici values (DEFAULT,'Joakim','Adukor','061 346171','joakim.adukor@gmail.com','prodavac',1000.00,'2020-04-10',1,1); 
insert into uposlenici values (DEFAULT,'Felix','Brandao','061 234156','felix.brandao@gmail.com','sef poslovnice',2000.00,'2020-05-10',1,4); 
insert into uposlenici values (DEFAULT,'Wagner','Dani','062 454156','dani.wagner@gmail.com','prodavac',1000.00,'2020-03-10',6,4); 
/*ALTER TABLE uposlenici MODIFY uposlenik_id INT AUTO_INCREMENT ; */
insert into nacin_placanja values (DEFAULT,'na_rate');
insert into nacin_placanja values (DEFAULT,'gotovina');
insert into nacin_placanja values (DEFAULT,'lizing');
insert into nacin_placanja values (DEFAULT,'karticno');

insert into kupci values (DEFAULT,'Ahmetovic','Mersudin','062 567845','m.ahmetovic@gmail.com',3);
insert into kupci values (DEFAULT,'Nanic','Hamza','062 567845','h.nanic@gmail.com',4);
insert into kupci values (DEFAULT,'Bojicic','Mirnes','062 654321','m.bojicic@gmail.com',3);
insert into kupci values (DEFAULT,'Dupovac','Amer','062 435645','a.dupovac@gmail.com',4);
insert into kupci values (DEFAULT,'Tatar','Benjamin','062 43245','b.tatar@gmail.com',3);
insert into kupci values (DEFAULT,'Rahmanovic','Amar','062 127445','a.rahmanovic@gmail.com',4);
insert into kupci values (DEFAULT,'Milicevic','Hrvoje','062 357845','h.milicevic@gmail.com',4);
insert into kupci values (DEFAULT,'Alaim','Muhamed','061 246845','a.alaim@gmail.com',3);
insert into kupci values (DEFAULT,'Marinovic','Vinko','061 547889','v.marinovic@gmail.com',3);
select * from kupci;

insert into prodaje values (1,'/',1,'GHFTZ278',1,3);
insert into prodaje values (2,'/',2,'HJ6147JDF',2,4);
insert into prodaje values (3,'/',4,'MG6947JD',3,4);
insert into prodaje values (4,'/',1,'NHZT5678',4,3);
insert into prodaje values (5,'/',2,'U65077DH',5,3);
insert into prodaje values (6,'/',1,'U6947JDH',6,4);
insert into prodaje values (7,'/',4,'ZU6247JD',7,3);
insert into prodaje values (8,'/',1,'ZU673GHA',8,3);

insert into fakture values ('2020-02-01',1,3,3);
insert into fakture values ('2020-02-05',2,2,4);
insert into fakture values ('2020-03-01',2,1,3);
insert into fakture values ('2020-02-11',3,4,4);
insert into fakture values ('2020-04-12',4,5,3);
insert into fakture values ('2020-04-15',3,6,4);
insert into fakture values ('2020-06-12',2,7,3);
insert into fakture values ('2020-06-15',4,8,4);

select * from kupci;

DELETE FROM kupci WHERE kupac_id = 9;
























SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

