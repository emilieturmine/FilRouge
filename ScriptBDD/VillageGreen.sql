-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 27 sep. 2021 à 08:35
-- Version du serveur :  5.7.31-log
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `villagegreen`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `cat_id` int(11) NOT NULL,
  `cat_nom` varchar(50) NOT NULL,
  `cat_photo` varchar(255) NOT NULL,
  `cat_parent` int(11) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`cat_id`, `cat_nom`, `cat_photo`, `cat_parent`) VALUES
(1, 'batterie', 'c1.png', 10),
(2, 'cable', 'c2.png', 9),
(3, 'case', 'c3.png', 11),
(4, 'guitare', 'c4.png', 12),
(5, 'piano', 'c5.png', 14),
(6, 'micro', 'c6.png', 13),
(7, 'saxo', 'c7.png', 15),
(8, 'sono', 'c8.png', 16),
(9, 'accessoires', 'c9.png', NULL),
(10, 'batteries', 'c10.png', NULL),
(11, 'cases', 'c11.png', NULL),
(12, 'guitares', 'c12.png', NULL),
(13, 'studio', 'c13.png', NULL),
(14, 'claviers', 'c14.png', NULL),
(15, 'instruments à vents', 'c15.png', NULL),
(16, 'sonos', 'c16.png', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `com_id` varchar(50) NOT NULL,
  `com_adresse_livraison` varchar(50) NOT NULL,
  `com_date` date DEFAULT NULL,
  `com_bon` text NOT NULL,
  `com_statut` varchar(50) DEFAULT NULL,
  `fac_id` int(11) NOT NULL,
  PRIMARY KEY (`com_id`),
  KEY `fac_id` (`fac_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`com_id`, `com_adresse_livraison`, `com_date`, `com_bon`, `com_statut`, `fac_id`) VALUES
('1', '59 rue tyugkhgk 80560 khkhkkhgs', '2021-04-20', 'com.html', 'livree', 1),
('2', '59 rue tyugkhgk 80560 khkhkkhgs', '2021-04-20', 'com.html', 'en cours', 2),
('3', '59 rue tyugkhgk 80560 khkhkkhgs', '2021-04-20', 'com.html', 'en cours', 3),
('4', '59 rue tyugkhgk 80560 khkhkkhgs', '2021-04-20', 'com.html', 'en cours', 4),
('5', '59 rue tyugkhgk 80560 khkhkkhgs', '2021-04-20', 'com.html', 'en cours', 5),
('6', '59 rue tyugkhgk 80560 khkhkkhgs', '2021-04-20', 'com.html', 'en cours', 6);

-- --------------------------------------------------------

--
-- Structure de la table `facturation`
--

DROP TABLE IF EXISTS `facturation`;
CREATE TABLE IF NOT EXISTS `facturation` (
  `fac_id` int(11) NOT NULL,
  `fac_date` datetime DEFAULT NULL,
  `fac_doc` varchar(255) DEFAULT NULL,
  `uti_id` int(11) NOT NULL,
  PRIMARY KEY (`fac_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `facturation`
--

INSERT INTO `facturation` (`fac_id`, `fac_date`, `fac_doc`, `uti_id`) VALUES
(1, '2021-09-27 00:00:00', 'ggihooge.doc', 4);

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
CREATE TABLE IF NOT EXISTS `fournisseur` (
  `fou_id` int(11) NOT NULL,
  `fou_nom` varchar(50) NOT NULL,
  `fou_adresse` varchar(50) DEFAULT NULL,
  `uti_id` int(11) NOT NULL,
  PRIMARY KEY (`fou_id`),
  KEY `uti_id` (`uti_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`fou_id`, `fou_nom`, `fou_adresse`, `uti_id`) VALUES
(1, 'roland', '324 rue de la zic 79000 saxa', 1),
(2, 'sennheiser', '48 boulebvard des airs 87000 cantigny', 5),
(3, 'yamaha', '789 route de paris 90000 versaille', 9),
(4, 'berhinger', '78 rue du cafe gourmand 59000 lille', 13);

-- --------------------------------------------------------

--
-- Structure de la table `gestion`
--

DROP TABLE IF EXISTS `gestion`;
CREATE TABLE IF NOT EXISTS `gestion` (
  `cat_id` int(11) NOT NULL,
  `uti_id` int(11) NOT NULL,
  `date_modif` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cat_id`,`uti_id`),
  KEY `uti_id` (`uti_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `gestion`
--

INSERT INTO `gestion` (`cat_id`, `uti_id`, `date_modif`) VALUES
(3, 1, '2021-09-27'),
(8, 3, '2021-09-27'),
(11, 5, '2021-09-27');

-- --------------------------------------------------------

--
-- Structure de la table `ligne_de_commande`
--

DROP TABLE IF EXISTS `ligne_de_commande`;
CREATE TABLE IF NOT EXISTS `ligne_de_commande` (
  `pro_id` int(11) NOT NULL,
  `uti_id` int(11) NOT NULL,
  `com_id` varchar(50) NOT NULL,
  `pro_quantité` int(11) NOT NULL,
  PRIMARY KEY (`pro_id`,`uti_id`,`com_id`),
  KEY `uti_id` (`uti_id`),
  KEY `com_id` (`com_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ligne_de_commande`
--

INSERT INTO `ligne_de_commande` (`pro_id`, `uti_id`, `com_id`, `pro_quantité`) VALUES
(25, 4, '1', 2),
(12, 4, '1', 1),
(5, 6, '2', 1),
(8, 6, '2', 1),
(16, 6, '2', 1),
(28, 8, '3', 1),
(29, 8, '3', 1),
(1, 8, '3', 2),
(8, 11, '4', 1),
(4, 11, '4', 1),
(15, 11, '4', 1),
(20, 11, '4', 1),
(23, 11, '4', 1),
(22, 11, '4', 1),
(9, 11, '4', 1);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `pro_id` int(11) NOT NULL,
  `pro_ref` varchar(50) NOT NULL,
  `pro_libelle` varchar(50) NOT NULL,
  `pro_description` varchar(255) NOT NULL,
  `pro_prix_achat` decimal(5,2) NOT NULL,
  `pro_photo` varchar(255) NOT NULL,
  `pro_stock` int(11) NOT NULL,
  `fou_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  PRIMARY KEY (`pro_id`),
  UNIQUE KEY `pro_ref` (`pro_ref`),
  UNIQUE KEY `pro_libelle` (`pro_libelle`),
  UNIQUE KEY `pro_description` (`pro_description`),
  KEY `fou_id` (`fou_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`pro_id`, `pro_ref`, `pro_libelle`, `pro_description`, `pro_prix_achat`, `pro_photo`, `pro_stock`, `fou_id`, `cat_id`) VALUES
(1, '0633816503009', 'Pearl - Export Rock 22', 'Après plusieurs années d\'absence,la batterie la plus vendue de l\'histoire fait son grand retour.', '759.99', 'i1.webp', 2, 1, 1),
(2, '0019239393050', 'Gretsch - Catalina Club CLUB 4 Futs', 'Grosse caisse 18\'x14\'Tom 12\'x08\'Stand tom 14\'x14\'Caisse claire 14\'x5,5\'Fûts  - 7 plisChanfreins 30°Système de suspension... ', '669.99', 'i2.webp', 2, 2, 1),
(3, '0694318023808', 'Alesis - Nitro Mesh Kit 5 Futs - 3 Cymbales', 'Vous cherchez un kit électronique débutant ? L\'Alesis Nitro Mesh est le premier kit à enfin rendre les pads maillés accessibles à tous. ', '350.00', 'i3.webp', 3, 4, 1),
(4, '2001000237623', 'Yamaha - Batterie électronique DTX532K', 'DTX532K ce le kit de batterie électronique de la série 502 équipé d\'un DTX-PAD XP-80 pour la caisse claire et d\'un vrai pied de charley. ', '990.00', 'i4.webp', 1, 3, 1),
(5, '3700408373542', 'Shiver - Câble jack 6,35mm longueur 3m', 'Ce produit permet de relier toutes sources audio équipées d\'une sortie mono 6,35mm vers un amplificateur ou une table de mixage.', '6.00', 'i5.webp', 15, 1, 2),
(6, '3700166300088', 'Yellow cable - HP03- Câble haut parleur jack - 3 m', 'Câble haut-parleur jack-jack d\'une longueur de 3 mètres, suffisant pour connecter un baffle à une tête d\'ampli.', '10.00', 'i6.png', 20, 2, 2),
(7, '3700408430672', 'Shiver - Câble plat Jack 6.35 / Jack 6.35 6 m', 'Câble Shiver jack 6,35 6 mètres de type plat anti emmêlement.', '20.00', 'i7.webp', 50, 3, 2),
(8, '0694318010266', 'Guitarlink-Plus Cable Usb Jack 6.35Mm Alesis', 'Avec le câble GuitarLink-Plus, branchez directement votre basse, votre guitare ou une source audio de niveau ligne pour enregistrement direct via le port USB de votre ordinateur.', '35.00', 'i8.jpg', 18, 4, 2),
(9, '0716408502526', 'Gator Cases EPS ', 'Étui pour clavier électronique (88 touches) - robuste - nylon, polyéthylène - Noir', '200.00', 'i9.jpg', 5, 1, 3),
(10, '370040838756', 'Fender G&G Deluxe Hardshell Cases', 'Transportez et rangez votre guitare avec style grâce à cet étui conçu spécialement pour votre instrument.', '300.00', 'i10.jpg', 2, 2, 3),
(11, '3700408361686', 'Shiver - Housse guitare électrique standard', 'Solide et économique, elle permettra de protéger votre guitare électrique avec sobriété et efficacité.', '20.00', 'i11.webp', 35, 3, 3),
(12, '0642388318003', 'Zildjian - ZCB20 - Housse pour cymbales en nylon', 'Avec la housse en nylon ZCB20 de Zildjian, vous pourrez transporter en toute sécurité et protéger vos baguettes et vos cymbales.', '39.00', 'i12.jpg', 15, 4, 3),
(13, '4515110508767', 'Ibanez - Pack guitare Folk V50NJP-NT Naturel', 'Le pack V series 50NJP-NT Ibanez', '129.00', 'i13.webp', 2, 1, 4),
(14, '0885978901340', 'Fender - Malibu Player Artic Gold ', 'Une guitare électro-acoustique à un prix abordable avec de nombreux atouts pour un musicien', '325.00', 'i14.jpg', 2, 2, 4),
(15, '4957812589017', 'Yamaha - GSLG200S - Guitare cordes acier naturel', 'La guitare silencieuse Yamaha SLG200S délivre une performance presque inaudible avec un son acoustique incroyablement naturel.', '700.00', 'i15.webp', 2, 3, 4),
(16, '3700166306646', 'Guitare Classique - Estudio 3/4 - Sant Y M', 'Développées à partir des recommandations de guitaristes classiques, en collaboration avec des luthiers ', '58.00', 'i16.jpg', 5, 4, 4),
(17, '0694318024874', 'Akai Professional MPK Mini mk3 - Clavier maître', 'Un contrôleur remis au goût du jour.Le MPK Mini, qui fait partie des claviers de contrôle les plus vendus au monde', '101.00', 'i17.webp', 15, 1, 5),
(18, '3700408361969', 'Shiver - DPS200B Piano numérique Noir', 'Le Shiver DPS200 est un piano numérique accessible sans concession.', '699.00', 'i18.webp', 1, 2, 5),
(19, '4957812638401', 'Yamaha - Arius YDP-144 noir', 'Le YDP-144 noir vous offre une expérience pianistique proche de celle d\'un authentique piano à queue ', '929.00', 'i19.webp', 1, 3, 5),
(20, ' 4971850315087', 'Casio CT-S1 - Clavier -', 'Clavier arrangeur', '260.00', 'i20.webp', 1, 4, 5),
(21, '0042406071826', 'Shure - SM58-LCE Microphone', 'Les micro Shure SM57 et SM58…', '109.00', 'i21webp', 50, 1, 6),
(22, '3760010252413', 'Prodipe - Micro ST-1 Ludovic Lanen', 'Le ST1, conçu sur la base du STC-3D et offrant la même sonorité et les mêmes qualités', '120.00', 'i22.jpg', 5, 2, 6),
(23, '0042406391436', 'Micro serre-tête, émetteur ceinture', 'Micro serre-tête, émetteur ceinture et récepteur - BLX14E-PGA31-M17 ', '269.00', 'i23.webp', 70, 3, 6),
(24, '3700408388782', 'Shiver - Pack Micro Dynamique Chant MDS-10', 'Le micro dynamique chant MDS-10 Shiver est spécifiquement conçu pour la voix.', '59.99', 'i24.jpg', 2, 4, 6),
(25, '3700166361065', 'Saxophone d\'étude Alto vernis - A300', 'Parce qu\'il est plus facile d\'aborder la musique avec un bon instrument', '379.00', 'i25.web', 6, 1, 7),
(26, '8053251170147', 'Alysée - A-808L - Saxophone Alto verni', 'Caractéristiques :- Pavillon gravé- clés vernies', '250.00', 'i26.jpg', 2, 2, 7),
(27, '3700166346154', 'SML Paris - A420-II - Saxophone Alto', 'Le saxophone A420-II de SML Paris est un instrument idéal pour les saxophonistes débutants', '580.00', 'i27.jpg', 3, 3, 7),
(28, '3700166346963', 'Saxophone - T620-II - Sml Paris', 'Avec son poids maîtrisé et son ergonomie étudiée', '880.00', 'i28.jpg', 1, 4, 7),
(29, '5420047136626', 'Madison - MAD-HP400 - Enceinte amplifiée autonome', 'Système autonome avec batterie rechargeable intégrée, équipé du Bluetooth, d\'entrées micro et guitare. ', '150.00', 'i29.jpg', 2, 1, 8),
(30, '5420047116192', 'IBIZA - PORT15VHF - Enceinte portable 15', 'En plus de sa qualité sonore exceptionnelle pour sa catégorie', '299.00', 'i31.jpg', 5, 2, 8),
(31, '4957812559690', 'Yamaha - DBR10 Enceinte active 10', 'La DBR10 est un modèle compact.', '399.00', 'i30.webp', 2, 3, 8),
(32, '4515260018086', 'L-12 LIVETRACK Console de mixage', 'L-12 LIVETRACK Console de mixage 12 voies', '559.00', 'i32.webp', 2, 4, 8);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `rol_id` varchar(50) NOT NULL,
  `rol_profil` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`rol_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`rol_id`, `rol_profil`) VALUES
('1', 'visiteur'),
('2', 'client particulier'),
('3', 'client professionnel'),
('4', 'gestion'),
('5', 'admistration'),
('6', 'maintenance');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `uti_id` int(11) NOT NULL,
  `uti_pseudo` varchar(255) DEFAULT NULL,
  `uti_email` varchar(100) NOT NULL,
  `uti_mdp` varchar(255) NOT NULL,
  `uti_nom` varchar(50) NOT NULL,
  `uti_prenom` varchar(255) NOT NULL,
  `uti_adresse` varchar(255) DEFAULT NULL,
  `uti_coef` decimal(5,2) NOT NULL,
  `rol_id` varchar(50) NOT NULL,
  PRIMARY KEY (`uti_id`),
  UNIQUE KEY `uti_mdp` (`uti_mdp`),
  UNIQUE KEY `uti_email` (`uti_email`),
  KEY `rol_id` (`rol_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`uti_id`, `uti_pseudo`, `uti_email`, `uti_mdp`, `uti_nom`, `uti_prenom`, `uti_adresse`, `uti_coef`, `rol_id`) VALUES
(1, 'In', 'ultrices.a.auctor@accumsan.co.uk', 'XJN42SCO8YL', 'Santiago', 'Dexter', 'Ap #725-9575 Odio. Street', '24.00', '4'),
(2, 'Maecenas', 'iaculis.quis@orci.ca', 'EGY57MUM3UN', 'Vasquez', 'Carol', 'P.O. Box 283, 2057 Curabitur Road', '4.00', '1'),
(3, 'euismod', 'a@sodalesmauris.co.uk', 'LYD05OPA7DQ', 'Cortez', 'Troy', '287-6448 Tincidunt Ave', '15.00', '3'),
(4, 'eu', 'elementum.purus.accumsan@ametante.ca', 'RRQ30XMM5HO', 'Vaughn', 'Irene', 'P.O. Box 537, 4241 Sit Street', '8.00', '2'),
(5, 'quam', 'auctor.velit@commodohendreritdonec.edu', 'EFM91EHV2EV', 'Morton', 'Zephania', '272-1433 Ut Ave', '8.00', '4'),
(6, 'Nulla', 'ac.urna@penatibus.org', 'BPW23CEN4FO', 'Cameron', 'Colorado', '575-7114 Massa. Avenue', '2.00', '2'),
(7, 'nunc', 'curabitur@crasvulputate.net', 'WYE24VSG9NL', 'Gray', 'Zeus', '342-9745 Ac Street', '10.00', '2'),
(8, 'Etiam', 'semper.et@vel.ca', 'NWT47UWG7ER', 'Obrien', 'Keane', 'P.O. Box 853, 5058 Odio St.', '18.00', '2'),
(9, 'aliquet', 'sollicitudin.adipiscing@ridiculusmusaenean.co.uk', 'MVC42SVE2CS', 'Koch', 'Quinn', '154-3422 Curabitur Avenue', '13.00', '5'),
(10, 'ante,', 'in@etcommodoat.ca', 'KGQ13FIC0CS', 'Keith', 'Hilel', '4205 Nam Rd.', '12.00', '6'),
(11, 'Phasellus', 'augue.malesuada@loremipsumsodales.net', 'FJN85EEC9RA', 'Avila', 'Ima', 'P.O. Box 881, 887 Morbi Ave', '15.00', '2'),
(12, 'non,', 'consectetuer.rhoncus@consectetuermaurisid.co.uk', 'VFC25YAO5RQ', 'Barrera', 'Hadassah', '515-5459 Turpis Rd.', '20.00', '3'),
(13, 'tortor', 'ut@sagittisduis.edu', 'BNW22GZM5TK', 'Kline', 'Zelenia', 'P.O. Box 232, 3200 Vitae Av.', '17.00', '5'),
(14, 'dolor', 'id.mollis@et.ca', 'AME92SSY1OG', 'Reid', 'Octavius', '9425 Neque Street', '12.00', '1'),
(15, 'vitae', 'nascetur.ridiculus@sociis.edu', 'JCF01SLE0MK', 'Page', 'Barry', '919-3309 Euismod St.', '10.00', '2');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
