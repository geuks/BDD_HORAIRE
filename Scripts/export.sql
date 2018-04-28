-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  sam. 28 avr. 2018 à 14:43
-- Version du serveur :  5.7.19
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gestionhoraire`
--

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

DROP TABLE IF EXISTS `cours`;
CREATE TABLE IF NOT EXISTS `cours` (
  `ID_TRANCHE_HORAIRE` int(11) NOT NULL,
  `ID_GROUPE` int(11) NOT NULL,
  `NOM_JOUR` char(10) NOT NULL,
  `NOM_MATIERE` char(20) NOT NULL,
  `NOM_SALLE` char(20) NOT NULL,
  `TYPE` char(2) NOT NULL,
  PRIMARY KEY (`ID_TRANCHE_HORAIRE`,`ID_GROUPE`,`NOM_JOUR`,`NOM_MATIERE`,`NOM_SALLE`,`TYPE`),
  KEY `NOM_JOUR` (`NOM_JOUR`),
  KEY `NOM_MATIERE` (`NOM_MATIERE`),
  KEY `NOM_SALLE` (`NOM_SALLE`),
  KEY `TYPE` (`TYPE`),
  KEY `ID_TRANCHE_HORAIRE` (`ID_TRANCHE_HORAIRE`,`ID_GROUPE`,`NOM_JOUR`,`NOM_MATIERE`,`NOM_SALLE`,`TYPE`)
) ENGINE=MyISAM DEFAULT CHARSET=hp8;

--
-- Déchargement des données de la table `cours`
--

INSERT INTO `cours` (`ID_TRANCHE_HORAIRE`, `ID_GROUPE`, `NOM_JOUR`, `NOM_MATIERE`, `NOM_SALLE`, `TYPE`) VALUES
(1, 5, 'JEUDI', 'C', 'SONIC', ''),
(1, 5, 'VENDREDI', 'ALGO2', 'SONIC', 'CM'),
(1, 11, 'LUNDI', 'ALGO1', 'KIRBY', ''),
(3, 5, 'JEUDI', 'ALGO1', 'SONIC', ''),
(4, 5, 'JEUDI', 'GAME DESIGN', 'SONIC', ''),
(4, 5, 'VENDREDI', 'ANGLAIS', 'LARA CROFT', ''),
(4, 6, 'VENDREDI', 'ANGLAIS', 'SONIC', '');

-- --------------------------------------------------------

--
-- Structure de la table `eleve`
--

DROP TABLE IF EXISTS `eleve`;
CREATE TABLE IF NOT EXISTS `eleve` (
  `ID_ELEVE` int(11) NOT NULL,
  `NOM_ELEVE` char(20) DEFAULT NULL,
  `PRENOM_ELEVE` char(20) DEFAULT NULL,
  `ID_GROUPE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_ELEVE`)
) ENGINE=MyISAM DEFAULT CHARSET=hp8;

--
-- Déchargement des données de la table `eleve`
--

INSERT INTO `eleve` (`ID_ELEVE`, `NOM_ELEVE`, `PRENOM_ELEVE`, `ID_GROUPE`) VALUES
(1, 'ACKER', 'ARNAUD', 1),
(2, 'ANDRIAMIANDRARIVO', 'HUBERT BRAYAN', 2),
(3, 'ANDRIOLO', 'CAROLINE', 1),
(4, 'AULEN', 'LUCAS', 2),
(5, 'AYDIN', 'KADIR', 1),
(6, 'BALSON', 'YANN', 1),
(7, 'BITON', 'JOCELYN', 1),
(8, 'BORGONDO', 'DAVID', 4),
(9, 'BOULAAJOUL', 'BADR', 3),
(10, 'BUTTANI', 'JUSTINE', 2),
(11, 'CLAUDE', 'LEO', 4),
(12, 'CRAGNOLINI', 'JULIEN', 1),
(13, 'DE CHENERILLES', 'PABLO', 4),
(14, 'DEVEZE', 'KILLIAN', 2),
(15, 'DIETSCHIN', 'VALENTIN', 2),
(16, 'ESCHKE', 'THOMAS', 1),
(17, 'FACHE', 'BRUNO', 4),
(18, 'FERNANDES', 'YOANN', 1),
(19, 'FREYMANN', 'LUDWIG', 1),
(20, 'FUCHS', 'EMILIEN', 3),
(21, 'GALATI', 'GAETAN', 3),
(22, 'GAU', 'PIERRE-ALAIN', 4),
(23, 'GAWLIK', 'ALEXIS', 4),
(24, 'GERGES', 'CELINE', 2),
(25, 'GOETZ', 'THIBAUD', 4),
(26, 'GRIMAZ', 'JEREMIE', 2),
(27, 'HAAS', 'MATHIEU', 2),
(28, 'HAJNAL', 'FLORIAN', 3),
(29, 'HELFER', 'ANTOINE', 4),
(30, 'HOEL', 'JULIEN', 1),
(31, 'HOSSANN', 'VINCENT', 4),
(32, 'ISS', 'FIONA', 3),
(33, 'KAYSER', 'MATTHIEU', 3),
(34, 'LAMARRE', 'BENOIT', 4),
(35, 'LASKOWSKI', 'AXEL', 1),
(36, 'LORANGE', 'PAULINE', 2),
(37, 'MADER', 'MAXIME', 2),
(38, 'MAGGAY', 'CEDRIC', 3),
(39, 'MATHIEU', 'TRISTAN', 2),
(40, 'MOCK', 'ROMAIN', 2),
(41, 'NOIRET-LEMAIRE', 'LENNY', 2),
(42, 'NOYON', 'NATHAN', 1),
(43, 'PROB', 'BASTIEN', 1),
(44, 'QUENET', 'RAPHAEL', 4),
(45, 'ROCHAS', 'VALENTIN', 3),
(46, 'ROUX', 'ANTHONY', 2),
(47, 'SAINT JULIEN', 'JOFFREY', 2),
(48, 'SCHEER-ALM', 'BENJAMIN CLAUDE', 3),
(49, 'SCHNEE', 'LOUIS', 4),
(50, 'SIMON', 'PIERRE-ANDRE', 3),
(51, 'UBRIG', 'JORIC', 1),
(52, 'VELTZ', 'QUENTIN', 4),
(53, 'VIE', 'LOIC', 3),
(54, 'VINDIGNI', 'FABIO', 4),
(55, 'VIRION', 'LOUIS', 1),
(56, 'WALLISCH', 'ALEXIS', 3),
(57, 'WERLY', 'TOMELINE', 3),
(58, 'WILHELM', 'STEPHANE', 4),
(59, 'ZIMMER', 'NOE', 3),
(60, 'ALVES', 'GUILLAUME', 2),
(61, 'BARTHLEN', 'ARTHUR', 2),
(62, 'BAZIN', 'MAXIME', 1),
(63, 'DENNY', 'THIBAUT', 2),
(64, 'ELBERTSE', 'ALEXY', 2),
(65, 'GIOVINAZZO', 'ALEXIS', 1),
(66, 'GUERRERO', 'MAXIME', 1),
(67, 'HERNANDEZ', 'ALEXIS', 2),
(68, 'HERRMANN', 'FLORIAN', 1),
(69, 'KERGROHEN', 'PIERRE-YVES', 1),
(70, 'LAMOUR', 'ANTHONY', 1),
(71, 'MARTIN', 'ALEXANDRE', 1),
(72, 'MONNIER', 'LAETITIA', 2),
(73, 'MORICONI', 'LENNY', 2),
(74, 'PIN', 'KILLIAN', 2),
(75, 'RINCK', 'ADRIEN', 2),
(76, 'ROCHE', 'CHARLES', 1),
(77, 'TRICHET', 'FLORENTIN', 2),
(78, 'UNALAN', 'GOKHAN', 1),
(79, 'WAHLER', 'ADRIAN', 2),
(80, 'WEILER', 'WILLIAM', 1),
(81, 'WENDLING', 'BRUNO', 1),
(82, 'ACKERMANN', 'PIERRE', 1),
(83, 'BALTA', 'CINDY', 2),
(84, 'BOURGUIGNON', 'KEVIN', 1),
(85, 'BRIOT', 'ANTHONY', 1),
(86, 'BRIOTTET', 'ANTOINE', 1),
(87, 'CAILLAUD', 'JEAN-BAPTISTE', 2),
(88, 'CHEUNG', 'TEVA', 1),
(89, 'CHOUFFERT', 'TRISTAN', 1),
(90, 'FELLRATH', 'JONATHAN', 1),
(91, 'FOUBERT', 'GUILLAUME', 1),
(92, 'JUNG', 'LUCAS', 1),
(93, 'KLEINCLAUS', 'FLORENT', 2),
(94, 'KRETZ', 'TEO', 1),
(95, 'MURE', 'LUCAS', 2),
(96, 'RENCUREL', 'PIERRE', 2),
(97, 'RENNER', 'JULIEN', 1),
(98, 'RIETSCH', 'VIRGILE', 2),
(99, 'SCHMIDT', 'ARNAUD', 2),
(100, 'STADELMANN', 'LOUIS', 1),
(101, 'SUTTERLIN', 'SEBASTIEN', 2),
(102, 'TAUPENOT', 'FLAVIEN', 2),
(103, 'WEBER', 'MAX', 2),
(104, 'DOMINGO', 'ALICE', 1),
(105, 'GAMPER', 'REBECCA', 1),
(106, 'GRASSET', 'JORDAN', 1),
(107, 'HAEHNEL', 'VALENTIN', 1),
(108, 'JEHL', 'REGIS', 1),
(109, 'PALMITESSA', 'LUCAS', 1),
(110, 'SANCHEZ', 'INES', 1),
(111, 'STEPHAN', 'PAUL', 1);

-- --------------------------------------------------------

--
-- Structure de la table `enseignant`
--

DROP TABLE IF EXISTS `enseignant`;
CREATE TABLE IF NOT EXISTS `enseignant` (
  `NOM_ENSEIGNANT` char(20) NOT NULL,
  `PRENOM_ENSEIGNANT` char(20) NOT NULL,
  PRIMARY KEY (`NOM_ENSEIGNANT`,`PRENOM_ENSEIGNANT`)
) ENGINE=MyISAM DEFAULT CHARSET=hp8;

--
-- Déchargement des données de la table `enseignant`
--

INSERT INTO `enseignant` (`NOM_ENSEIGNANT`, `PRENOM_ENSEIGNANT`) VALUES
('BESMOND', 'MARINE'),
('DENTINGER', 'EMELYNE'),
('HATTON', 'JEROME'),
('IWASZKO', 'THOMAS'),
('LEHMANN', 'NICOLAS'),
('LOTH', 'NICOLAS'),
('MADEMBO', 'GRACE'),
('MULLER', 'CHARLEY');

-- --------------------------------------------------------

--
-- Structure de la table `enseigner`
--

DROP TABLE IF EXISTS `enseigner`;
CREATE TABLE IF NOT EXISTS `enseigner` (
  `NOM_MATIERE` char(20) NOT NULL,
  `NOM_ENSEIGNANT` char(20) NOT NULL,
  PRIMARY KEY (`NOM_MATIERE`,`NOM_ENSEIGNANT`),
  KEY `NOM_ENSEIGNANT` (`NOM_ENSEIGNANT`)
) ENGINE=MyISAM DEFAULT CHARSET=hp8;

--
-- Déchargement des données de la table `enseigner`
--

INSERT INTO `enseigner` (`NOM_MATIERE`, `NOM_ENSEIGNANT`) VALUES
('ALGO1', 'BESMOND'),
('ALGO1', 'LOTH'),
('ALGO2', 'MADEMBO'),
('ANGLAIS', 'DENTINGER'),
('ANGLAIS', 'MULLER'),
('C', 'LEHMANN'),
('GAME DESIGN', 'LOTH');

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

DROP TABLE IF EXISTS `groupe`;
CREATE TABLE IF NOT EXISTS `groupe` (
  `ID_GROUPE` int(11) NOT NULL,
  `NUMERO_GROUPE` int(1) DEFAULT NULL,
  `NOM_NIVEAU` char(20) DEFAULT NULL,
  PRIMARY KEY (`ID_GROUPE`),
  KEY `NOM_NIVEAU` (`NOM_NIVEAU`)
) ENGINE=MyISAM DEFAULT CHARSET=hp8;

--
-- Déchargement des données de la table `groupe`
--

INSERT INTO `groupe` (`ID_GROUPE`, `NUMERO_GROUPE`, `NOM_NIVEAU`) VALUES
(1, 1, 'FUNDATION1'),
(2, 2, 'FUNDATION1'),
(3, 3, 'FUNDATION1'),
(4, 4, 'FUNDATION1'),
(5, 1, 'FUNDATION2'),
(6, 2, 'FUNDATION2'),
(7, 1, 'FUNDATION3'),
(8, 2, 'FUNDATION3'),
(9, 1, 'MASTER1'),
(10, 1, 'MASTER2'),
(11, 1, 'DOCTORAT1'),
(12, 1, 'DOCTORAT2'),
(13, 1, 'DOCTORAT3');

-- --------------------------------------------------------

--
-- Structure de la table `jour`
--

DROP TABLE IF EXISTS `jour`;
CREATE TABLE IF NOT EXISTS `jour` (
  `NOM_JOUR` char(8) NOT NULL,
  `ORD_JOUR` int(7) NOT NULL COMMENT 'Pour classer les données',
  PRIMARY KEY (`NOM_JOUR`)
) ENGINE=MyISAM DEFAULT CHARSET=hp8;

--
-- Déchargement des données de la table `jour`
--

INSERT INTO `jour` (`NOM_JOUR`, `ORD_JOUR`) VALUES
('LUNDI', 1),
('MARDI', 2),
('MERCREDI', 3),
('JEUDI', 4),
('VENDREDI', 5),
('SAMEDI', 6),
('DIMANCHE', 7);

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

DROP TABLE IF EXISTS `matiere`;
CREATE TABLE IF NOT EXISTS `matiere` (
  `NOM_MATIERE` char(20) NOT NULL,
  PRIMARY KEY (`NOM_MATIERE`)
) ENGINE=MyISAM DEFAULT CHARSET=hp8;

--
-- Déchargement des données de la table `matiere`
--

INSERT INTO `matiere` (`NOM_MATIERE`) VALUES
('ALGO1'),
('ALGO2'),
('ANGLAIS'),
('APPLI MOBILE'),
('C'),
('C#'),
('C++'),
('EUROPE'),
('GAME DESIGN'),
('IA'),
('JAPONAIS'),
('JAVA'),
('WEB');

-- --------------------------------------------------------

--
-- Structure de la table `niveau`
--

DROP TABLE IF EXISTS `niveau`;
CREATE TABLE IF NOT EXISTS `niveau` (
  `NOM_NIVEAU` char(20) NOT NULL,
  PRIMARY KEY (`NOM_NIVEAU`)
) ENGINE=MyISAM DEFAULT CHARSET=hp8;

--
-- Déchargement des données de la table `niveau`
--

INSERT INTO `niveau` (`NOM_NIVEAU`) VALUES
('DOCTORAT1'),
('DOCTORAT2'),
('DOCTORAT3'),
('FUNDATION1'),
('FUNDATION2'),
('FUNDATION3'),
('MASTER1'),
('MASTER2');

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

DROP TABLE IF EXISTS `salle`;
CREATE TABLE IF NOT EXISTS `salle` (
  `NOM_SALLE` char(20) NOT NULL,
  `LOGO_SALLE` char(40) DEFAULT NULL,
  PRIMARY KEY (`NOM_SALLE`)
) ENGINE=MyISAM DEFAULT CHARSET=hp8;

--
-- Déchargement des données de la table `salle`
--

INSERT INTO `salle` (`NOM_SALLE`, `LOGO_SALLE`) VALUES
('SONIC', ''),
('KIRBY', ''),
('LARA CROFT', ''),
('VR', ''),
('LAYTON', ''),
('POKEMON', ''),
('LINK', ''),
('QUBERT', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `tranche_horaire`
--

DROP TABLE IF EXISTS `tranche_horaire`;
CREATE TABLE IF NOT EXISTS `tranche_horaire` (
  `ID_TRANCHE_HORAIRE` int(11) NOT NULL,
  `HD_TRANCHE_HORAIRE` int(11) DEFAULT NULL,
  `HF_TRANCHE_HORAIRE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_TRANCHE_HORAIRE`)
) ENGINE=MyISAM DEFAULT CHARSET=hp8;

--
-- Déchargement des données de la table `tranche_horaire`
--

INSERT INTO `tranche_horaire` (`ID_TRANCHE_HORAIRE`, `HD_TRANCHE_HORAIRE`, `HF_TRANCHE_HORAIRE`) VALUES
(1, 9, 11),
(2, 11, 13),
(3, 14, 16),
(4, 16, 18),
(5, 18, 20);

-- --------------------------------------------------------

--
-- Structure de la table `type_matiere`
--

DROP TABLE IF EXISTS `type_matiere`;
CREATE TABLE IF NOT EXISTS `type_matiere` (
  `TYPE` char(2) NOT NULL,
  PRIMARY KEY (`TYPE`)
) ENGINE=MyISAM DEFAULT CHARSET=hp8;

--
-- Déchargement des données de la table `type_matiere`
--

INSERT INTO `type_matiere` (`TYPE`) VALUES
(''),
('CM'),
('TP');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
