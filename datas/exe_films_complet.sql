-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 12 Février 2016 à 12:11
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `exe_films`
--
DROP DATABASE `exe_films`;
CREATE DATABASE IF NOT EXISTS `exe_films` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `exe_films`;

-- --------------------------------------------------------

--
-- Structure de la table `acteur`
--

CREATE TABLE IF NOT EXISTS `acteur` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lenom` varchar(100) DEFAULT NULL,
  `leprenom` varchar(100) DEFAULT NULL,
  `lurlimg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `acteur`
--

INSERT INTO `acteur` (`id`, `lenom`, `leprenom`, `lurlimg`) VALUES
(1, 'Hanks', 'Tom', 'http://fr.web.img2.acsta.net/cx_160_213/b_1_d6d6d6/pictures/16/01/13/14/22/026598.jpg'),
(2, 'Sinise', 'Gary', 'http://fr.web.img4.acsta.net/cx_160_213/b_1_d6d6d6/medias/nmedia/18/35/26/53/20215084.jpg'),
(3, 'Wright', 'Robin', 'http://fr.web.img3.acsta.net/cx_160_213/b_1_d6d6d6/pictures/15/12/23/11/44/440152.jpg'),
(4, 'Reynolds', 'Ryan', 'http://fr.web.img6.acsta.net/cx_160_213/b_1_d6d6d6/pictures/16/02/09/12/32/028964.jpg'),
(5, 'Baccarin', 'Morena', 'http://fr.web.img2.acsta.net/cx_160_213/b_1_d6d6d6/pictures/15/08/07/10/29/000174.jpg'),
(6, 'Skrein', 'Ed', 'http://fr.web.img6.acsta.net/cx_160_213/b_1_d6d6d6/pictures/15/07/09/16/09/433580.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

CREATE TABLE IF NOT EXISTS `film` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `letitre` varchar(150) DEFAULT NULL,
  `ladesc` text,
  `lannee` year(4) DEFAULT NULL,
  `realisateur_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_film_realisateur1_idx` (`realisateur_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `film`
--

INSERT INTO `film` (`id`, `letitre`, `ladesc`, `lannee`, `realisateur_id`) VALUES
(1, 'Forrest Gump', 'Quelques décennies d''histoire américaine, des années 1940 à la fin du XXème siècle, à travers le regard et l''étrange odyssée d''un homme simple et pur, Forrest Gump.', 1994, 1),
(2, 'test', 'test', 2005, 1),
(3, 'Deadpool', 'Deadpool, est l''anti-héros le plus atypique de l''univers Marvel. A l''origine, il s''appelle Wade Wilson : un ancien militaire des Forces Spéciales devenu mercenaire. Après avoir subi une expérimentation hors norme qui va accélérer ses pouvoirs de guérison, il va devenir Deadpool. Armé de ses nouvelles capacités et d''un humour noir survolté, Deadpool va traquer l''homme qui a bien failli anéantir sa vie.', 2016, 2);

-- --------------------------------------------------------

--
-- Structure de la table `film_has_acteur`
--

CREATE TABLE IF NOT EXISTS `film_has_acteur` (
  `film_id` int(10) unsigned NOT NULL,
  `acteur_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`film_id`,`acteur_id`),
  KEY `fk_film_has_acteur_acteur1_idx` (`acteur_id`),
  KEY `fk_film_has_acteur_film1_idx` (`film_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `film_has_acteur`
--

INSERT INTO `film_has_acteur` (`film_id`, `acteur_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 3),
(3, 4),
(3, 5),
(3, 6);

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

CREATE TABLE IF NOT EXISTS `genre` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lintitule` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lintitule_UNIQUE` (`lintitule`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `genre`
--

INSERT INTO `genre` (`id`, `lintitule`) VALUES
(1, 'Action'),
(2, 'Aventure'),
(3, 'Comédie'),
(4, 'Comédie dramatique'),
(5, 'Documentaire'),
(6, 'Drame'),
(7, 'Policier'),
(8, 'Romance'),
(9, 'Thriller');

-- --------------------------------------------------------

--
-- Structure de la table `genre_has_film`
--

CREATE TABLE IF NOT EXISTS `genre_has_film` (
  `genre_id` int(10) unsigned NOT NULL,
  `film_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`genre_id`,`film_id`),
  KEY `fk_genre_has_film_film1_idx` (`film_id`),
  KEY `fk_genre_has_film_genre1_idx` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `genre_has_film`
--

INSERT INTO `genre_has_film` (`genre_id`, `film_id`) VALUES
(4, 1),
(8, 1),
(1, 2),
(2, 2),
(3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lurl` varchar(255) DEFAULT NULL,
  `lalt` varchar(255) DEFAULT NULL,
  `film_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_images_film_idx` (`film_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `images`
--

INSERT INTO `images` (`id`, `lurl`, `lalt`, `film_id`) VALUES
(1, 'http://fr.web.img4.acsta.net/pictures/15/10/13/15/12/514297.jpg', 'Forest Gump', 1),
(2, 'https://s3.amazonaws.com/rapgenius/1322157918_ForrestGump2.jpg', 'Tom Hanks', 1),
(3, 'http://fr.web.img4.acsta.net/pictures/16/01/19/16/49/249124.jpg', 'Deadpool ', 3);

-- --------------------------------------------------------

--
-- Structure de la table `realisateur`
--

CREATE TABLE IF NOT EXISTS `realisateur` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lenom` varchar(100) DEFAULT NULL,
  `leprenom` varchar(100) DEFAULT NULL,
  `lurlimg` varchar(255) DEFAULT NULL,
  `ladesc` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `realisateur`
--

INSERT INTO `realisateur` (`id`, `lenom`, `leprenom`, `lurlimg`, `ladesc`) VALUES
(1, 'Zemeckis', 'Robert ', 'http://fr.web.img3.acsta.net/cx_160_213/b_1_d6d6d6/pictures/15/07/29/14/46/263242.jpg', 'Robert Zemeckis étudie à l''Université de l''Illinois, puis obtient en 1973 une licence de cinéma à l''USC. Au cours de ses études, ce natif de Chicago écrit, produit et réalise Field of honor, court métrage qui obtient l''Oscar du Meilleur film d''étudiant et décroche une quinzaine de récompenses un peu partout dans le monde.'),
(2, 'Miller', 'Tim', 'http://fr.web.img5.acsta.net/cx_160_213/b_1_d6d6d6/pictures/16/02/09/12/48/382413.jpg', 'Tim Miller, Réalisateur, Superviseur des effets spéciaux. Découvrez sa biographie, sa carrière en détail et toute son actualité.');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `film`
--
ALTER TABLE `film`
  ADD CONSTRAINT `fk_film_realisateur1` FOREIGN KEY (`realisateur_id`) REFERENCES `realisateur` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Contraintes pour la table `film_has_acteur`
--
ALTER TABLE `film_has_acteur`
  ADD CONSTRAINT `fk_film_has_acteur_acteur1` FOREIGN KEY (`acteur_id`) REFERENCES `acteur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_film_has_acteur_film1` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `genre_has_film`
--
ALTER TABLE `genre_has_film`
  ADD CONSTRAINT `fk_genre_has_film_film1` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_genre_has_film_genre1` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `fk_images_film` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
