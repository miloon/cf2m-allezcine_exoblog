-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 22 Février 2016 à 10:49
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Contenu de la table `acteur`
--

INSERT INTO `acteur` (`id`, `lenom`, `leprenom`, `lurlimg`) VALUES
(1, 'Hanks', 'Tom', 'http://fr.web.img2.acsta.net/cx_160_213/b_1_d6d6d6/pictures/16/01/13/14/22/026598.jpg'),
(2, 'Sinise', 'Gary', 'http://fr.web.img4.acsta.net/cx_160_213/b_1_d6d6d6/medias/nmedia/18/35/26/53/20215084.jpg'),
(3, 'Wright', 'Robin', 'http://fr.web.img3.acsta.net/cx_160_213/b_1_d6d6d6/pictures/15/12/23/11/44/440152.jpg'),
(4, 'Reynolds', 'Ryan', NULL),
(5, 'Baccarin', 'Morena', NULL),
(6, 'J. Fox', 'Michael ', NULL),
(7, 'Lloyd', 'Christopher', NULL),
(8, 'Neill', 'Sam', NULL),
(9, 'Dern', 'Laura', NULL),
(10, 'Goldblum', 'Jeff', NULL),
(11, 'Favino', 'Pierfrancesco', NULL),
(12, 'Germano', 'Elio', NULL),
(13, 'Amendola', 'Claudio', NULL),
(14, 'Untaru', 'Catinca', NULL),
(15, 'Pace', 'Lee', NULL),
(16, 'Stiller', 'Ben', NULL),
(17, 'Wilson', 'Owen', NULL),
(18, 'Ferrell', 'Will', NULL),
(19, 'Wiig', 'Kristen', NULL),
(20, 'Mouglalis', 'Anna', NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

--
-- Contenu de la table `film`
--

INSERT INTO `film` (`id`, `letitre`, `ladesc`, `lannee`, `realisateur_id`) VALUES
(1, 'Forrest Gump', 'Quelques décennies d''histoire américaine, des années 1940 à la fin du XXème siècle, à travers le regard et l''étrange odyssée d''un homme simple et pur, Forrest Gump.\r\n\r\nLe film débute par la scène où une plume d''oiseau, volant dans les airs, atterrit aux pieds de Forrest Gump, un homme « autiste avec déficience mentale », assis sur un banc dans la ville de Savannah, en Géorgie, attendant le bus. Au fil des différents interlocuteurs qui viennent s’asseoir tour à tour à côté de lui sur le banc, Forrest Gump va raconter la fabuleuse histoire de sa vie. Sa vie est à l''image de la plume (que l''on aperçoit au début et à la fin du film) qui se laisse porter par le vent, tout comme Forrest se laisse porter par les événements qu''il traverse dans l''Amérique de la seconde moitié du XXe siècle.\r\n\r\nDe son enfance, mis à l''écart par les enfants de son âge à cause de ses handicaps mentaux et physiques, jusqu''au moment où, devenu milliardaire, il raconte son histoire, Forrest Gump sera tour à tour champion de football américain, diplômé d''une université, soldat durant la guerre du Viêt Nam (recevant la Médaille d''Honneur du Congrès), champion de ping-pong dans l''équipe militaire américaine, marathonien exceptionnel (courant sans s''arrêter pendant plus de trois ans), capitaine de crevettier et fera la couverture du magazine Fortune.\r\n\r\nSe trouvant au cœur des principaux événements de l''histoire des États-Unis entre les années 1950 et 1980, il en devient un des acteurs décisifs de cette époque, bien qu''involontairement, inspirant notamment à Elvis Presley sa façon de se déhancher, à John Lennon les paroles d''Imagine, étant reçu à la Maison-Blanche par trois présidents successifs, participant à la reprise des relations diplomatiques entre la Chine et les États-Unis, révélant le scandale du Watergate et initiant quelques-unes des principales tendances socio-culturelles des années 1980.', 1994, 1),
(2, 'Deadpool', 'Deadpool, est l''anti-héros le plus atypique de l''univers Marvel. A l''origine, il s''appelle Wade Wilson : un ancien militaire des Forces Spéciales devenu mercenaire. Après avoir subi une expérimentation hors norme qui va accélérer ses pouvoirs de guérison, il va devenir Deadpool. Armé de ses nouvelles capacités et d''un humour noir survolté, Deadpool va traquer l''homme qui a bien failli anéantir sa vie. ', 2016, 1),
(3, 'Back to the Future', '1985. Le jeune Marty McFly mène une existence anonyme auprès de sa petite amie Jennifer, seulement troublée par sa famille en crise et un proviseur qui serait ravi de l''expulser du lycée. Ami de l''excentrique professeur Emmett Brown, il l''accompagne un soir tester sa nouvelle expérience : le voyage dans le temps via une DeLorean modifiée. La démonstration tourne mal : des trafiquants d''armes débarquent et assassinent le scientifique. Marty se réfugie dans la voiture et se retrouve transporté en 1955. Là, il empêche malgré lui la rencontre de ses parents, et doit tout faire pour les remettre ensemble, sous peine de ne pouvoir exister... ', 1985, 1),
(4, 'Cast Away', 'Chuck Noland, un cadre de Fedex, sillonne le monde pour améliorer les performances de son entreprise et la productivité de ses équipes. Il ne trouve la tranquillité qu''auprès de sa compagne Kelly. Mais à la veille de Noël, il reçoit un appel lui annonçant qu''il doit contrôler la livraison d''un colis urgent pour la Malaisie. Il n''en a que pour quatre jours et reviendra pour fêter le Nouvel An avec sa dulcinée. Chuck quitte Los Angeles à bord d''un petit avion. Mais au-dessus de l''Océan Pacifique, un orage éclate et prend par surprise l''équipage. Le crash est inévitable. Agrippé à un radeau de sauvetage, Chuck s''échoue sur une île déserte. Les jours passent et aucun secours en vue. Pendant quatre ans, le naufragé va tenter de s''adapter à cet environnement sauvage en surmontant l''épreuve terrible de la solitude. ', 2001, 1),
(20, 'Back to the Future 2', 'Lors de son premier voyage en 1985, Marty a commis quelques erreurs. L&#039;avenir qu&#039;il s&#039;était tracé n&#039;est pas si rose, et son rejeton est tombé sous la coupe du voyou Griff Tannen, qui veut régner sur la ville. En compagnie de son ami Emmett &quot;Doc&quot; Brown et de sa fiancée Jennifer, Marty va devoir entreprendre un voyage vers le futur, pour tenter de donner un peu plus de moralité à son héritier. Un voyage aux conséquences dramatiques...', 1989, 1),
(21, 'Jurassic Park', 'Ne pas réveiller le chat qui dort... C&#039;est ce que le milliardaire John Hammond aurait dû se rappeler avant de se lancer dans le &quot;clonage&quot; de dinosaures. C&#039;est à partir d&#039;une goutte de sang absorbée par un moustique fossilisé que John Hammond et son équipe ont réussi à faire renaître une dizaine d&#039;espèces de dinosaures. Il s&#039;apprête maintenant avec la complicité du docteur Alan Grant, paléontologue de renom, et de son amie Ellie, à ouvrir le plus grand parc à thème du monde. Mais c&#039;était sans compter la cupidité et la malveillance de l&#039;informaticien Dennis Nedry, et éventuellement des dinosaures, seuls maîtres sur l&#039;île...', 1993, 1),
(22, 'Suburra', 'La Suburra, quartier malfamé de Rome, est le théâtre d’un ambitieux projet immobilier. L’État, le Vatican et la Mafia sont impliqués. En sept jours, la mécanique va s’enrayer : la Suburra va sombrer, et renaître.', 2015, 1),
(23, 'The Fall', 'Los Angeles, années 1920. Alexandria, cinq ans, est hospitalisée à la suite d&#039;une chute. Elle se lie d&#039;amitié avec Roy, cascadeur à Hollywood, lui aussi victime d&#039;un accident. Le jeune homme se lance dans le récit d&#039;une histoire épique avec le gouverneur Odieux et les 5 fantastiques déterminés à le combattre. Très vite, la frontière entre la réalité et ce monde éblouissant de magie et de mythes commence à disparaître quand la petite Alexandra réalise qu&#039;il existe un véritable enjeu...', 2006, 1),
(24, 'Zoolander', 'Derek Zoolander, un célèbre mannequin, est à l''apogée de sa carrière. Couronné trois fois de suite Top model de l''année, il est sur le point de recevoir son quatrième trophée lorsque ce titre lui est ravi par un jeune et ambitieux challenger : Hansel.Effondrée, l''idole des podiums décide d''abandonner l''univers futile de la mode pour se ressourcer au sein de sa famille en Pennsylvanie. C''est alors que Maury Ballstein, son agent, et Jacobim Mugatu, un styliste déjanté, proposent à Zoolander de devenir la star de la nouvelle ligne de vêtements Derelicte. Zoolander accepte, mais il est loin de s''imaginer que le diabolique Mugatu, secondé de la troublante Katinka, s''apprête à lui effectuer un lavage de cerveau. Ainsi lobotomisé, Derek pourrait exécuter plus facilement ses ordres, à savoir assassiner le président de la Malaisie. ', 2001, 6),
(35, 'The Secret Life of Walter Mitty', 'Walter Mitty est un homme ordinaire, enfermé dans son quotidien, qui n’ose s’évader qu’à travers des rêves à la fois drôles et extravagants. Mais confronté à une difficulté dans sa vie professionnelle, Walter doit trouver le courage de passer à l&#039;action dans le monde réel. Il embarque alors dans un périple incroyable, pour vivre une aventure bien plus riche que tout ce qu&#039;il aurait pu imaginer jusqu’ici. Et qui devrait changer sa vie à jamais.', 2014, 6),
(36, 'Zoolander 2', 'Blue Steel. Le Tigre. Magnum… Des regards si puissants qu’ils arrêtent des shuriken en plein vol et déjouent les plans de domination mondiale les plus diaboliques. Un seul top model est capable de conjurer autant de puissance et de beauté dans une duck-face : Derek Zoolander ! Quinze ans après avoir envoyé Mugatu derrière les barreaux, Derek et son rival/meilleur ami Hansel, évincés de l’industrie de la mode suite à une terrible catastrophe, mènent des vies de reclus aux deux extrémités du globe. Mais lorsqu’un mystérieux assassin cible des popstars célèbres, les deux has-been des podiums se rendent à Rome pour reconquérir leur couronne de super mannequins et aider la belle Valentina, de la Fashion Police d’Interpol, à sauver le monde. Et la mode !', 2016, 6),
(37, 'Anchorman', 'Dans les années 70, Ron Burgundy est présentateur vedette à la télévision locale de San Diego. Quand le féminisme entre à la rédaction sous la forme de la présentatrice ambitieuse Veronica Corningstone, Ron se montre tolérant tant que cette dernière reste à sa place. Mais quand celle-ci se campe derrière le bureau des actualités, une véritable guerre se déclenche entre les deux journalistes...', 2005, 7),
(38, 'Polarbearman', 'A man trying to live a normal life, while the water levels around him rise. Representing the polar bears situation and the melting ice caps.', 2008, 8),
(39, 'Romanzo criminale', '1975. Le Libanais a un rêve : conquérir Rome. Pour réaliser cette entreprise sans précédent, il met en place une organisation criminelle sans pitié.\r\n\r\nPendant 25 ans elle se développera et son histoire sera indubitablement liée à la période la plus noire que l&#039;Italie ait connue ces années-là : terrorisme, enlèvements et corruption au plus haut niveau politique. \r\n\r\nL&#039;inspecteur Scialoia ne cessera de traquer cette organisation, tout en conquérant le coeur de Patricia, la femme de l&#039;un d&#039;entre eux.', 2006, 9);

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
(4, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(3, 6),
(20, 6),
(3, 7),
(20, 7),
(21, 8),
(21, 9),
(21, 10),
(22, 11),
(39, 11),
(22, 12),
(23, 14),
(23, 15),
(38, 15),
(24, 16),
(35, 16),
(36, 16),
(24, 17),
(36, 17),
(24, 18),
(36, 18),
(37, 18),
(35, 19),
(39, 20);

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

CREATE TABLE IF NOT EXISTS `genre` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lintitule` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lintitule_UNIQUE` (`lintitule`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

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
(11, 'Fantastique'),
(7, 'Policier'),
(8, 'Romance'),
(10, 'Science fiction'),
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
(3, 2),
(3, 3),
(10, 3),
(2, 4),
(6, 4),
(2, 20),
(10, 20),
(2, 21),
(10, 21),
(6, 22),
(7, 22),
(9, 22),
(2, 23),
(6, 23),
(11, 23),
(3, 24),
(2, 35),
(4, 35),
(3, 36),
(3, 37),
(6, 38),
(6, 39),
(7, 39);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Contenu de la table `images`
--

INSERT INTO `images` (`id`, `lurl`, `lalt`, `film_id`) VALUES
(1, 'http://fr.web.img4.acsta.net/pictures/15/10/13/15/12/514297.jpg', 'Forest Gump', 1),
(2, 'http://fr.web.img4.acsta.net/pictures/15/12/14/18/05/178689.jpg', 'deadpool', 2),
(3, 'http://fr.web.img2.acsta.net/medias/nmedia/18/35/91/26/18686482.jpg', 'Back to the Future', 3),
(4, 'http://fr.web.img4.acsta.net/medias/05/12/12/051212_af.jpg', 'Cast Away', 4),
(5, 'http://fr.web.img6.acsta.net/pictures/15/10/20/15/48/474464.jpg', 'Retour vers le futur', 20),
(6, 'http://www.jurassic-park.fr/fckeditor_upload/image/logos/concepts/jurassic_park_34.jpg', 'Jurassic Park', 21),
(7, 'http://fr.web.img6.acsta.net/pictures/15/11/12/09/53/059860.jpg', 'Suburra', 22),
(8, 'http://fr.web.img2.acsta.net/pictures/14/10/14/10/14/165443.jpg', 'The Fall', 23),
(9, 'http://fr.web.img4.acsta.net/medias/nmedia/00/02/33/45/affzoolander.jpg', 'Zoolander', 24),
(11, 'http://fr.web.img6.acsta.net/pictures/210/381/21038196_20130909144813955.jpg', 'The Secret Life of Walter Mitty', 35),
(12, 'http://fr.web.img6.acsta.net/pictures/15/11/11/10/08/021481.png', 'Zoolander 2', 36),
(13, 'http://fr.web.img2.acsta.net/medias/nmedia/18/35/57/58/18425994.jpg', 'Anchorman', 37),
(14, 'http://41.media.tumblr.com/dea398449cae27eaf38fbbf81fb6bbff/tumblr_mtuja8IADd1shaglso1_500.jpg', 'Polarbearman', 38),
(15, 'http://fr.web.img2.acsta.net/medias/nmedia/18/36/29/38/18469226.jpg', 'Romanzo criminale', 39);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `realisateur`
--

INSERT INTO `realisateur` (`id`, `lenom`, `leprenom`, `lurlimg`, `ladesc`) VALUES
(1, 'Zemeckis', 'Robert ', 'http://fr.web.img3.acsta.net/cx_160_213/b_1_d6d6d6/pictures/15/07/29/14/46/263242.jpg', 'Robert Zemeckis étudie à l''Université de l''Illinois, puis obtient en 1973 une licence de cinéma à l''USC. Au cours de ses études, ce natif de Chicago écrit, produit et réalise Field of honor, court métrage qui obtient l''Oscar du Meilleur film d''étudiant et décroche une quinzaine de récompenses un peu partout dans le monde.'),
(2, 'Miller', 'Tim', '', 'Tim Miller'),
(3, 'Spielberg ', 'Steven', NULL, NULL),
(4, 'Sollima', 'Stefano', NULL, NULL),
(5, 'Singh', 'Tarsem', NULL, NULL),
(6, 'Stiller', 'Ben', NULL, NULL),
(7, 'McKay', 'Adam', NULL, NULL),
(8, 'Whitebloom', 'Monty', NULL, NULL),
(9, 'Placido', 'Michele', NULL, NULL);

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
