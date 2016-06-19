-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema exe_films
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `exe_films` ;

-- -----------------------------------------------------
-- Schema exe_films
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `exe_films` DEFAULT CHARACTER SET utf8 ;
USE `exe_films` ;

-- -----------------------------------------------------
-- Table `exe_films`.`realisateur`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exe_films`.`realisateur` ;

CREATE TABLE IF NOT EXISTS `exe_films`.`realisateur` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `lenom` VARCHAR(100) NULL,
  `leprenom` VARCHAR(100) NULL,
  `lurlimg` VARCHAR(255) NULL,
  `ladesc` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exe_films`.`film`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exe_films`.`film` ;

CREATE TABLE IF NOT EXISTS `exe_films`.`film` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `letitre` VARCHAR(150) NULL,
  `ladesc` TEXT NULL,
  `lannee` YEAR NULL,
  `realisateur_id` INT UNSIGNED NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_film_realisateur1`
    FOREIGN KEY (`realisateur_id`)
    REFERENCES `exe_films`.`realisateur` (`id`)
    ON DELETE SET NULL
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_film_realisateur1_idx` ON `exe_films`.`film` (`realisateur_id` ASC);


-- -----------------------------------------------------
-- Table `exe_films`.`images`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exe_films`.`images` ;

CREATE TABLE IF NOT EXISTS `exe_films`.`images` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `lurl` VARCHAR(255) NULL,
  `lalt` VARCHAR(255) NULL,
  `film_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_images_film`
    FOREIGN KEY (`film_id`)
    REFERENCES `exe_films`.`film` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_images_film_idx` ON `exe_films`.`images` (`film_id` ASC);


-- -----------------------------------------------------
-- Table `exe_films`.`acteur`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exe_films`.`acteur` ;

CREATE TABLE IF NOT EXISTS `exe_films`.`acteur` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `lenom` VARCHAR(100) NULL,
  `leprenom` VARCHAR(100) NULL,
  `lurlimg` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exe_films`.`film_has_acteur`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exe_films`.`film_has_acteur` ;

CREATE TABLE IF NOT EXISTS `exe_films`.`film_has_acteur` (
  `film_id` INT UNSIGNED NOT NULL,
  `acteur_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`film_id`, `acteur_id`),
  CONSTRAINT `fk_film_has_acteur_film1`
    FOREIGN KEY (`film_id`)
    REFERENCES `exe_films`.`film` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_film_has_acteur_acteur1`
    FOREIGN KEY (`acteur_id`)
    REFERENCES `exe_films`.`acteur` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_film_has_acteur_acteur1_idx` ON `exe_films`.`film_has_acteur` (`acteur_id` ASC);

CREATE INDEX `fk_film_has_acteur_film1_idx` ON `exe_films`.`film_has_acteur` (`film_id` ASC);


-- -----------------------------------------------------
-- Table `exe_films`.`genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exe_films`.`genre` ;

CREATE TABLE IF NOT EXISTS `exe_films`.`genre` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `lintitule` VARCHAR(150) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `lintitule_UNIQUE` ON `exe_films`.`genre` (`lintitule` ASC);


-- -----------------------------------------------------
-- Table `exe_films`.`genre_has_film`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exe_films`.`genre_has_film` ;

CREATE TABLE IF NOT EXISTS `exe_films`.`genre_has_film` (
  `genre_id` INT UNSIGNED NOT NULL,
  `film_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`genre_id`, `film_id`),
  CONSTRAINT `fk_genre_has_film_genre1`
    FOREIGN KEY (`genre_id`)
    REFERENCES `exe_films`.`genre` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_genre_has_film_film1`
    FOREIGN KEY (`film_id`)
    REFERENCES `exe_films`.`film` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_genre_has_film_film1_idx` ON `exe_films`.`genre_has_film` (`film_id` ASC);

CREATE INDEX `fk_genre_has_film_genre1_idx` ON `exe_films`.`genre_has_film` (`genre_id` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `exe_films`.`realisateur`
-- -----------------------------------------------------
START TRANSACTION;
USE `exe_films`;
INSERT INTO `exe_films`.`realisateur` (`id`, `lenom`, `leprenom`, `lurlimg`, `ladesc`) VALUES (DEFAULT, 'Zemeckis', 'Robert ', 'http://fr.web.img3.acsta.net/cx_160_213/b_1_d6d6d6/pictures/15/07/29/14/46/263242.jpg', 'Robert Zemeckis étudie à l\'Université de l\'Illinois, puis obtient en 1973 une licence de cinéma à l\'USC. Au cours de ses études, ce natif de Chicago écrit, produit et réalise Field of honor, court métrage qui obtient l\'Oscar du Meilleur film d\'étudiant et décroche une quinzaine de récompenses un peu partout dans le monde.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `exe_films`.`film`
-- -----------------------------------------------------
START TRANSACTION;
USE `exe_films`;
INSERT INTO `exe_films`.`film` (`id`, `letitre`, `ladesc`, `lannee`, `realisateur_id`) VALUES (DEFAULT, 'Forrest Gump', 'Quelques décennies d\'histoire américaine, des années 1940 à la fin du XXème siècle, à travers le regard et l\'étrange odyssée d\'un homme simple et pur, Forrest Gump.', 1994, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `exe_films`.`images`
-- -----------------------------------------------------
START TRANSACTION;
USE `exe_films`;
INSERT INTO `exe_films`.`images` (`id`, `lurl`, `lalt`, `film_id`) VALUES (DEFAULT, 'http://fr.web.img4.acsta.net/pictures/15/10/13/15/12/514297.jpg', 'Forest Gump', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `exe_films`.`acteur`
-- -----------------------------------------------------
START TRANSACTION;
USE `exe_films`;
INSERT INTO `exe_films`.`acteur` (`id`, `lenom`, `leprenom`, `lurlimg`) VALUES (DEFAULT, 'Hanks', 'Tom', 'http://fr.web.img2.acsta.net/cx_160_213/b_1_d6d6d6/pictures/16/01/13/14/22/026598.jpg');
INSERT INTO `exe_films`.`acteur` (`id`, `lenom`, `leprenom`, `lurlimg`) VALUES (DEFAULT, 'Sinise', 'Gary', 'http://fr.web.img4.acsta.net/cx_160_213/b_1_d6d6d6/medias/nmedia/18/35/26/53/20215084.jpg');
INSERT INTO `exe_films`.`acteur` (`id`, `lenom`, `leprenom`, `lurlimg`) VALUES (DEFAULT, 'Wright', 'Robin', 'http://fr.web.img3.acsta.net/cx_160_213/b_1_d6d6d6/pictures/15/12/23/11/44/440152.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `exe_films`.`film_has_acteur`
-- -----------------------------------------------------
START TRANSACTION;
USE `exe_films`;
INSERT INTO `exe_films`.`film_has_acteur` (`film_id`, `acteur_id`) VALUES (1, 1);
INSERT INTO `exe_films`.`film_has_acteur` (`film_id`, `acteur_id`) VALUES (1, 2);
INSERT INTO `exe_films`.`film_has_acteur` (`film_id`, `acteur_id`) VALUES (1, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `exe_films`.`genre`
-- -----------------------------------------------------
START TRANSACTION;
USE `exe_films`;
INSERT INTO `exe_films`.`genre` (`id`, `lintitule`) VALUES (DEFAULT, 'Action');
INSERT INTO `exe_films`.`genre` (`id`, `lintitule`) VALUES (DEFAULT, 'Aventure');
INSERT INTO `exe_films`.`genre` (`id`, `lintitule`) VALUES (DEFAULT, 'Comédie');
INSERT INTO `exe_films`.`genre` (`id`, `lintitule`) VALUES (DEFAULT, 'Comédie dramatique');
INSERT INTO `exe_films`.`genre` (`id`, `lintitule`) VALUES (DEFAULT, 'Documentaire');
INSERT INTO `exe_films`.`genre` (`id`, `lintitule`) VALUES (DEFAULT, 'Drame');
INSERT INTO `exe_films`.`genre` (`id`, `lintitule`) VALUES (DEFAULT, 'Policier');
INSERT INTO `exe_films`.`genre` (`id`, `lintitule`) VALUES (DEFAULT, 'Romance');
INSERT INTO `exe_films`.`genre` (`id`, `lintitule`) VALUES (DEFAULT, 'Thriller');

COMMIT;


-- -----------------------------------------------------
-- Data for table `exe_films`.`genre_has_film`
-- -----------------------------------------------------
START TRANSACTION;
USE `exe_films`;
INSERT INTO `exe_films`.`genre_has_film` (`genre_id`, `film_id`) VALUES (4, 1);
INSERT INTO `exe_films`.`genre_has_film` (`genre_id`, `film_id`) VALUES (8, 1);

COMMIT;

