-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le : Ven 24 Février 2012 à 12:35
-- Version du serveur: 5.5.20
-- Version de PHP: 5.3.10-1ubuntu1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `phpm`
--
-- On detruit les données précdentes
DELETE from Orga where is_admin=0;
DELETE from Disponibilite;
DELETE from Categorie;
DELETE from Confiance;
DELETE from Config;
DELETE from Creneau;
DELETE from PlageHoraire;
DELETE from Tache;
DELETE from User;
--
-- Contenu de la table `Categorie`
--


INSERT INTO `Categorie` (`id`, `nom`, `couleur`) VALUES
(1, 'Bar', 'Bleu'),
(2, 'Bouffe', 'Bleu'),
(3, 'Sécurité', 'Bleu');

--
-- Contenu de la table `Confiance`
--

INSERT INTO `Confiance` (`id`, `nom`, `valeur`, `couleur`) VALUES
(2, 'Soft', 1, 'Bleu'),
(3, 'Hard', 3, 'Bleu');

--
-- Contenu de la table `Config`
--

INSERT INTO `Config` (`id`, `field`, `label`, `value`) VALUES
(1, 'manifestation.plages', 'Plages de la manifestation', '{"1":{"nom":"Pru00e9manif","debut":"2010-12-24 00:00","fin":"2010-12-31 00:00"},"2":{"nom":"Manif","debut":"2011-01-01 00:00","fin":"2011-01-04 00:00"},"3":{"nom":"Postmanif","debut":"2011-01-05 00:00","fin":"2011-01-08 00:00"}}'),
(2, 'manifestation.organisation.nom', 'Nom de l''organisation', '24 Heures de l''INSA'),
(3, 'phpm.config.initiale', 'PHPM configuré', '1'),
(4, 'manifestation.nom', '', '24 Heures de l''INSA');



--
-- Contenu de la table `Orga`
--

INSERT INTO `Orga` (`id`, `confiance_id`, `importid`, `nom`, `prenom`, `surnom`, `telephone`, `email`, `dateDeNaissance`, `departement`, `commentaire`, `permis`, `statut`, `is_admin`) VALUES
(2, 3, NULL, 'Cashman', 'Nathan', 'Nath''', '0678543131', 'Nathan.Cashman@insa-lyon.fr', '1992-07-17', '0', NULL, 1, 1, 0),
(3, 3, NULL, 'Dupond', 'Manon', 'Manon', '0656784312', 'Manon.Dupond@insa-lyon.fr', '1993-06-18', '0', NULL, 1, 1, 0),
(4, 2, NULL, 'Durand', 'Dupond', 'Dudu', '0671347654', 'Dupond.Durand@insa-lyon.fr', '1990-01-01', '2', NULL, 1, 1, 0),
(5, 2, NULL, 'Malacom', 'Lola', 'Lol', '0645341287', 'Lola.Malacom@insa-lyon.fr', '1992-01-01', '12', NULL, 1, 1, 0),
(6, 2, NULL, 'Laval', 'Natacha', 'Nat', '0634567854', 'Natacha.Laval@gmail.com', '1992-01-01', '12', NULL, 1, 1, 0),
(7, 2, NULL, 'Lelouche', 'Marc', 'Marc', '0675431234', 'Marc.L@google.com', '1994-01-01', '13', NULL, 1, 1, 0),
(8, 2, NULL, 'V', 'Jean Marc', 'Jj', '0678542341', 'jj@gmail.com', '1991-01-01', '11', NULL, 1, 1, 0),
(9, 2, NULL, 'Marché', 'Camille', 'Camille', '0656789054', 'Camille.Marche@yahoo.fr', '1985-01-01', '3', NULL, 1, 1, 0),
(10, 2, NULL, 'Dujean', 'Janot', 'Janot', '0643521345', 'Janot.Dujean@gmail.com', '1995-01-01', '13', NULL, 1, 1, 0),
(11, 2, NULL, 'Dujardin', 'Jean', 'Dudu', '0786235621', 'Jean.Dujardin@gmail.com', '1985-01-01', '13', NULL, 0, 1, 0),
(12, 3, NULL, ' MARTIN ', ' MARIE ', ' Pseudo ', ' 0678965412 ', 'MARTIN.MARIE@insa-lyon.fr', '1990-02-15', ' 17 ', NULL, 0, 1, 0),
(13, 2, NULL, ' JEANNE ', ' DUVAL ', ' Pseudo ', ' 0678965413 ', 'JEANNE.DUVAL@insa-lyon.fr', '1973-02-15', ' 61 ', NULL, 1, 1, 0),
(14, 3, NULL, ' HEBERT ', ' LEFEVRE ', ' Pseudo ', ' 0678965414 ', 'HEBERT.LEFEVRE@insa-lyon.fr', '1981-02-15', ' 18 ', NULL, 2, 1, 0),
(15, 2, NULL, ' GAUTIER ', ' LEROY ', ' Pseudo ', ' 0678965415 ', 'GAUTIER.LEROY@insa-lyon.fr', '1990-02-15', ' 63 ', NULL, 2, 1, 0),
(16, 2, NULL, ' HAMEL ', ' GUERIN ', ' Pseudo ', ' 0678965416 ', 'HAMEL.GUERIN@insa-lyon.fr', '1974-02-15', ' 6 ', NULL, 0, 1, 0),
(17, 2, NULL, ' LECONTE ', ' SIMON ', ' Pseudo ', ' 0678965417 ', 'LECONTE.SIMON@insa-lyon.fr', '1994-02-15', ' 15 ', NULL, 0, 1, 0),
(18, 2, NULL, ' DURAND ', ' LEMONNIER ', ' Pseudo ', ' 0678965418 ', 'DURAND.LEMONNIER@insa-lyon.fr', '1995-02-15', ' 35 ', NULL, 0, 1, 0),
(19, 3, NULL, ' LEROUX ', ' LELIEVRE ', ' Pseudo ', ' 0678965419 ', 'LEROUX.LELIEVRE@insa-lyon.fr', '1991-02-15', ' 27 ', NULL, 1, 1, 0),
(20, 2, NULL, ' MORIN ', ' LANGLOIS ', ' Pseudo ', ' 0678965420 ', 'MORIN.LANGLOIS@insa-lyon.fr', '1979-02-15', ' 36 ', NULL, 0, 1, 0),
(21, 3, NULL, ' MOREL ', ' DUPONT ', ' Pseudo ', ' 0678965421 ', 'MOREL.DUPONT@insa-lyon.fr', '1999-02-15', ' 46 ', NULL, 0, 1, 0),
(22, 3, NULL, ' ANNE ', ' MICHEL ', ' Pseudo ', ' 0678965422 ', 'ANNE.MICHEL@insa-lyon.fr', '1976-02-15', ' 63 ', NULL, 0, 1, 0),
(23, 2, NULL, ' DUBOIS ', ' JEAN ', ' Pseudo ', ' 0678965423 ', 'DUBOIS.JEAN@insa-lyon.fr', '1982-02-15', ' 24 ', NULL, 1, 1, 0),
(24, 3, NULL, ' FONTAINE ', ' DELAUNAY ', ' Pseudo ', ' 0678965424 ', 'FONTAINE.DELAUNAY@insa-lyon.fr', '1994-02-15', ' 37 ', NULL, 0, 1, 0),
(25, 3, NULL, ' GOSSELIN ', ' HUET ', ' Pseudo ', ' 0678965425 ', 'GOSSELIN.HUET@insa-lyon.fr', '1983-02-15', ' 82 ', NULL, 0, 1, 0),
(26, 3, NULL, ' LETELLIER ', ' MAUGER ', ' Pseudo ', ' 0678965426 ', 'LETELLIER.MAUGER@insa-lyon.fr', '1981-02-15', ' 29 ', NULL, 1, 1, 0),
(27, 2, NULL, ' LECLERC ', ' FLEURY ', ' Pseudo ', ' 0678965427 ', 'LECLERC.FLEURY@insa-lyon.fr', '1987-02-15', ' 61 ', NULL, 1, 1, 0),
(28, 3, NULL, ' ROUSSEL ', ' LAURENT ', ' Pseudo ', ' 0678965428 ', 'ROUSSEL.LAURENT@insa-lyon.fr', '1971-02-15', ' 83 ', NULL, 0, 1, 0),
(29, 3, NULL, ' LAUNAY ', ' RICHARD ', ' Pseudo ', ' 0678965429 ', 'LAUNAY.RICHARD@insa-lyon.fr', '1971-02-15', ' 65 ', NULL, 0, 1, 0),
(30, 2, NULL, ' GARNIER ', ' LEGRAND ', ' Pseudo ', ' 0678965430 ', 'GARNIER.LEGRAND@insa-lyon.fr', '1977-02-15', ' 1 ', NULL, 2, 1, 0),
(31, 2, NULL, ' AUVRAY ', ' LEMOINE ', ' Pseudo ', ' 0678965431 ', 'AUVRAY.LEMOINE@insa-lyon.fr', '1991-02-15', ' 65 ', NULL, 2, 1, 0),
(32, 2, NULL, ' ROGER ', ' THOMAS ', ' Pseudo ', ' 0678965432 ', 'ROGER.THOMAS@insa-lyon.fr', '1972-02-15', ' 44 ', NULL, 0, 1, 0),
(33, 2, NULL, ' AUBERT ', ' LEFRANCOIS ', ' Pseudo ', ' 0678965433 ', 'AUBERT.LEFRANCOIS@insa-lyon.fr', '1999-02-15', ' 76 ', NULL, 2, 1, 0),
(34, 3, NULL, ' DAVID ', ' BISSON ', ' Pseudo ', ' 0678965434 ', 'DAVID.BISSON@insa-lyon.fr', '1972-02-15', ' 69 ', NULL, 0, 1, 0),
(35, 3, NULL, ' CATHERINE ', ' ADAM ', ' Pseudo ', ' 0678965435 ', 'CATHERINE.ADAM@insa-lyon.fr', '1985-02-15', ' 12 ', NULL, 0, 1, 0),
(36, 3, NULL, ' LEMARCHAND ', ' VOISIN ', ' Pseudo ', ' 0678965436 ', 'LEMARCHAND.VOISIN@insa-lyon.fr', '1972-02-15', ' 72 ', NULL, 2, 1, 0),
(37, 2, NULL, ' HUBERT ', ' DENIS ', ' Pseudo ', ' 0678965437 ', 'HUBERT.DENIS@insa-lyon.fr', '1997-02-15', ' 44 ', NULL, 2, 1, 0),
(38, 2, NULL, ' NOEL ', ' POTTIER ', ' Pseudo ', ' 0678965438 ', 'NOEL.POTTIER@insa-lyon.fr', '1997-02-15', ' 5 ', NULL, 1, 1, 0),
(39, 2, NULL, ' PHILIPPE ', ' RENAULT ', ' Pseudo ', ' 0678965439 ', 'PHILIPPE.RENAULT@insa-lyon.fr', '1993-02-15', ' 2 ', NULL, 0, 1, 0),
(40, 3, NULL, ' LEPETIT ', ' OLIVIER ', ' Pseudo ', ' 0678965440 ', 'LEPETIT.OLIVIER@insa-lyon.fr', '1975-02-15', ' 0 ', NULL, 2, 1, 0),
(41, 2, NULL, ' LEBRETON ', ' BESNARD ', ' Pseudo ', ' 0678965441 ', 'LEBRETON.BESNARD@insa-lyon.fr', '2000-02-15', ' 68 ', NULL, 0, 1, 0),
(42, 2, NULL, ' HUE ', ' MOULIN ', ' Pseudo ', ' 0678965442 ', 'HUE.MOULIN@insa-lyon.fr', '1995-02-15', ' 80 ', NULL, 0, 1, 0),
(43, 2, NULL, ' LETOURNEUR ', ' LEMAITRE ', ' Pseudo ', ' 0678965443 ', 'LETOURNEUR.LEMAITRE@insa-lyon.fr', '1977-02-15', ' 20 ', NULL, 0, 1, 0),
(44, 2, NULL, ' JAMES ', ' LAINE ', ' Pseudo ', ' 0678965444 ', 'JAMES.LAINE@insa-lyon.fr', '1977-02-15', ' 6 ', NULL, 0, 1, 0),
(45, 3, NULL, ' RENOUF ', ' LUCAS ', ' Pseudo ', ' 0678965445 ', 'RENOUF.LUCAS@insa-lyon.fr', '1996-02-15', ' 23 ', NULL, 0, 1, 0),
(46, 3, NULL, ' PICOT ', ' GIRARD ', ' Pseudo ', ' 0678965446 ', 'PICOT.GIRARD@insa-lyon.fr', '1986-02-15', ' 87 ', NULL, 1, 1, 0),
(47, 3, NULL, ' VALLEE ', ' DUCHEMIN ', ' Pseudo ', ' 0678965447 ', 'VALLEE.DUCHEMIN@insa-lyon.fr', '1986-02-15', ' 3 ', NULL, 1, 1, 0),
(48, 3, NULL, ' MENARD ', ' VAUTIER ', ' Pseudo ', ' 0678965448 ', 'MENARD.VAUTIER@insa-lyon.fr', '2000-02-15', ' 33 ', NULL, 1, 1, 0),
(49, 3, NULL, ' BAZIN ', ' LEMIERE ', ' Pseudo ', ' 0678965449 ', 'BAZIN.LEMIERE@insa-lyon.fr', '1972-02-15', ' 69 ', NULL, 1, 1, 0),
(50, 2, NULL, ' RIVIERE ', ' FRANCOIS ', ' Pseudo ', ' 0678965450 ', 'RIVIERE.FRANCOIS@insa-lyon.fr', '1988-02-15', ' 3 ', NULL, 1, 1, 0),
(51, 3, NULL, ' HARDY ', ' PARIS ', ' Pseudo ', ' 0678965451 ', 'HARDY.PARIS@insa-lyon.fr', '1977-02-15', ' 89 ', NULL, 1, 1, 0),
(52, 3, NULL, ' LECARPENTIER ', ' RENARD ', ' Pseudo ', ' 0678965452 ', 'LECARPENTIER.RENARD@insa-lyon.fr', '1998-02-15', ' 51 ', NULL, 2, 1, 0),
(53, 2, NULL, ' DUFOUR ', ' LEBRUN ', ' Pseudo ', ' 0678965453 ', 'DUFOUR.LEBRUN@insa-lyon.fr', '1987-02-15', ' 56 ', NULL, 0, 1, 0),
(54, 3, NULL, ' LAMY ', ' ANDRE ', ' Pseudo ', ' 0678965454 ', 'LAMY.ANDRE@insa-lyon.fr', '1981-02-15', ' 82 ', NULL, 2, 1, 0),
(55, 3, NULL, ' BERNARD ', ' POULAIN ', ' Pseudo ', ' 0678965455 ', 'BERNARD.POULAIN@insa-lyon.fr', '1988-02-15', ' 53 ', NULL, 2, 1, 0),
(56, 2, NULL, ' MARY ', ' POISSON ', ' Pseudo ', ' 0678965456 ', 'MARY.POISSON@insa-lyon.fr', '1982-02-15', ' 20 ', NULL, 0, 1, 0),
(57, 2, NULL, ' BERTRAND ', ' GODEFROY ', ' Pseudo ', ' 0678965457 ', 'BERTRAND.GODEFROY@insa-lyon.fr', '1976-02-15', ' 46 ', NULL, 2, 1, 0),
(58, 3, NULL, ' PETIT ', ' FAUVEL ', ' Pseudo ', ' 0678965458 ', 'PETIT.FAUVEL@insa-lyon.fr', '1990-02-15', ' 73 ', NULL, 0, 1, 0),
(59, 3, NULL, ' LECOQ ', ' LEFEBVRE ', ' Pseudo ', ' 0678965459 ', 'LECOQ.LEFEBVRE@insa-lyon.fr', '2000-02-15', ' 82 ', NULL, 2, 1, 0),
(60, 3, NULL, ' MOUCHEL ', ' HENRY ', ' Pseudo ', ' 0678965460 ', 'MOUCHEL.HENRY@insa-lyon.fr', '1988-02-15', ' 21 ', NULL, 1, 1, 0),
(61, 3, NULL, ' LEGENDRE ', ' FRANCOISE ', ' Pseudo ', ' 0678965461 ', 'LEGENDRE.FRANCOISE@insa-lyon.fr', '1978-02-15', ' 9 ', NULL, 1, 1, 0);

--
-- Contenu de la table `Tache`
--

INSERT INTO `Tache` (`id`, `responsable_id`, `categorie_id`, `confiance_id`, `importid`, `nom`, `consignes`, `materielNecessaire`, `permisNecessaire`, `ageNecessaire`, `lieu`) VALUES
(1, 1, 1, 3, NULL, 'Charchage barrières', 'RDV au QG orga, apporter le papier de prêt', 'Des mains', 0, 18, 'Grand Lyon'),
(2, NULL, 3, 2, NULL, 'Extincteurs', 'Rapporter les extincteurs à la DirPa...', NULL, 0, 15, 'BDE'),
(3, NULL, 2, 2, NULL, 'Bouffe artiste', 'Bouffe artiste en semaine', '...', 0, 18, 'INSA'),
(4, 1, 1, 2, NULL, 'Servir des bières', '...', NULL, 0, 18, 'Humas'),
(5, NULL, 2, 3, NULL, 'Installation bar bouffe', 'Voir QG', 'Tables, matos', 1, 18, 'INSA'),
(6, 1, 1, 3, NULL, 'Matos concert Daft punk', 'Gerer le matos', NULL, 1, 20, 'Pelouse des humas');


--
-- Contenu de la table `PlageHoraire`
--

INSERT INTO `PlageHoraire` (`id`, `tache_id`, `debut`, `fin`, `dureeCreneau`, `recoupementCreneau`, `nbOrgasNecessaires`) VALUES
(1, 3, '2011-01-01 18:00:00', '2011-01-01 22:00:00', 3600, 900, 5),
(2, 2, '2011-01-01 12:00:00', '2011-01-01 14:00:00', 3600, 0, 5),
(3, 5, '2011-01-02 07:00:00', '2011-01-02 09:00:00', 7200, 0, 5),
(4, 4, '2011-01-02 18:00:00', '2011-01-02 22:00:00', 7200, 900, 20),
(5, 4, '2011-01-01 18:00:00', '2011-01-01 23:00:00', 7200, 900, 20),
(6, 6, '2011-01-02 22:00:00', '2011-01-03 00:00:00', 3600, 900, 5);


--
-- Contenu de la table `Creneau`
--

INSERT INTO `Creneau` (`id`, `disponibilite_id`, `debut`, `fin`, `plageHoraire_id`) VALUES
(2, NULL, '2011-01-01 18:00:00', '2011-01-01 19:15:00', 1),
(3, NULL, '2011-01-01 19:00:00', '2011-01-01 20:15:00', 1),
(4, NULL, '2011-01-01 20:00:00', '2011-01-01 21:15:00', 1),
(5, NULL, '2011-01-01 21:00:00', '2011-01-01 22:00:00', 1),
(6, NULL, '2011-01-01 18:00:00', '2011-01-01 19:15:00', 1),
(7, NULL, '2011-01-01 19:00:00', '2011-01-01 20:15:00', 1),
(8, NULL, '2011-01-01 20:00:00', '2011-01-01 21:15:00', 1),
(9, NULL, '2011-01-01 21:00:00', '2011-01-01 22:00:00', 1),
(10, NULL, '2011-01-01 18:00:00', '2011-01-01 19:15:00', 1),
(11, NULL, '2011-01-01 19:00:00', '2011-01-01 20:15:00', 1),
(12, NULL, '2011-01-01 20:00:00', '2011-01-01 21:15:00', 1),
(13, NULL, '2011-01-01 21:00:00', '2011-01-01 22:00:00', 1),
(14, NULL, '2011-01-01 18:00:00', '2011-01-01 19:15:00', 1),
(15, NULL, '2011-01-01 19:00:00', '2011-01-01 20:15:00', 1),
(16, NULL, '2011-01-01 20:00:00', '2011-01-01 21:15:00', 1),
(17, NULL, '2011-01-01 21:00:00', '2011-01-01 22:00:00', 1),
(18, NULL, '2011-01-01 18:00:00', '2011-01-01 19:15:00', 1),
(19, NULL, '2011-01-01 19:00:00', '2011-01-01 20:15:00', 1),
(20, NULL, '2011-01-01 20:00:00', '2011-01-01 21:15:00', 1),
(21, NULL, '2011-01-01 21:00:00', '2011-01-01 22:00:00', 1),
(22, NULL, '2011-01-02 18:00:00', '2011-01-02 20:15:00', 4),
(23, NULL, '2011-01-02 20:00:00', '2011-01-02 22:00:00', 4),
(24, NULL, '2011-01-02 18:00:00', '2011-01-02 20:15:00', 4),
(25, NULL, '2011-01-02 20:00:00', '2011-01-02 22:00:00', 4),
(26, NULL, '2011-01-02 18:00:00', '2011-01-02 20:15:00', 4),
(27, NULL, '2011-01-02 20:00:00', '2011-01-02 22:00:00', 4),
(28, NULL, '2011-01-02 18:00:00', '2011-01-02 20:15:00', 4),
(29, NULL, '2011-01-02 20:00:00', '2011-01-02 22:00:00', 4),
(30, NULL, '2011-01-02 18:00:00', '2011-01-02 20:15:00', 4),
(31, NULL, '2011-01-02 20:00:00', '2011-01-02 22:00:00', 4),
(32, NULL, '2011-01-02 18:00:00', '2011-01-02 20:15:00', 4),
(33, NULL, '2011-01-02 20:00:00', '2011-01-02 22:00:00', 4),
(34, NULL, '2011-01-02 18:00:00', '2011-01-02 20:15:00', 4),
(35, NULL, '2011-01-02 20:00:00', '2011-01-02 22:00:00', 4),
(36, NULL, '2011-01-02 18:00:00', '2011-01-02 20:15:00', 4),
(37, NULL, '2011-01-02 20:00:00', '2011-01-02 22:00:00', 4),
(38, NULL, '2011-01-02 18:00:00', '2011-01-02 20:15:00', 4),
(39, NULL, '2011-01-02 20:00:00', '2011-01-02 22:00:00', 4),
(40, NULL, '2011-01-02 18:00:00', '2011-01-02 20:15:00', 4),
(41, NULL, '2011-01-02 20:00:00', '2011-01-02 22:00:00', 4),
(42, NULL, '2011-01-02 18:00:00', '2011-01-02 20:15:00', 4),
(43, NULL, '2011-01-02 20:00:00', '2011-01-02 22:00:00', 4),
(44, NULL, '2011-01-02 18:00:00', '2011-01-02 20:15:00', 4),
(45, NULL, '2011-01-02 20:00:00', '2011-01-02 22:00:00', 4),
(46, NULL, '2011-01-02 18:00:00', '2011-01-02 20:15:00', 4),
(47, NULL, '2011-01-02 20:00:00', '2011-01-02 22:00:00', 4),
(48, NULL, '2011-01-02 18:00:00', '2011-01-02 20:15:00', 4),
(49, NULL, '2011-01-02 20:00:00', '2011-01-02 22:00:00', 4),
(50, NULL, '2011-01-02 18:00:00', '2011-01-02 20:15:00', 4),
(51, NULL, '2011-01-02 20:00:00', '2011-01-02 22:00:00', 4),
(52, NULL, '2011-01-02 18:00:00', '2011-01-02 20:15:00', 4),
(53, NULL, '2011-01-02 20:00:00', '2011-01-02 22:00:00', 4),
(54, NULL, '2011-01-02 18:00:00', '2011-01-02 20:15:00', 4),
(55, NULL, '2011-01-02 20:00:00', '2011-01-02 22:00:00', 4),
(56, NULL, '2011-01-02 18:00:00', '2011-01-02 20:15:00', 4),
(57, NULL, '2011-01-02 20:00:00', '2011-01-02 22:00:00', 4),
(58, NULL, '2011-01-02 18:00:00', '2011-01-02 20:15:00', 4),
(59, NULL, '2011-01-02 20:00:00', '2011-01-02 22:00:00', 4),
(60, NULL, '2011-01-02 18:00:00', '2011-01-02 20:15:00', 4),
(61, NULL, '2011-01-02 20:00:00', '2011-01-02 22:00:00', 4),
(62, NULL, '2011-01-02 07:00:00', '2011-01-02 09:00:00', 3),
(63, NULL, '2011-01-02 07:00:00', '2011-01-02 09:00:00', 3),
(64, NULL, '2011-01-02 07:00:00', '2011-01-02 09:00:00', 3),
(65, NULL, '2011-01-02 07:00:00', '2011-01-02 09:00:00', 3),
(66, NULL, '2011-01-02 07:00:00', '2011-01-02 09:00:00', 3);



--
-- Contenu de la table `Disponibilite`
--

INSERT INTO `Disponibilite` (`id`, `orga_id`, `debut`, `fin`) VALUES
(1, 1, '2011-01-01 00:00:00', '2011-01-02 00:00:00'),
(2, 2, '2011-01-02 10:00:00', '2011-01-02 20:00:00'),
(3, 3, '2011-01-01 14:00:00', '2011-01-01 20:00:00'),
(4, 4, '2011-01-02 08:00:00', '2011-01-03 23:00:00'),
(5, 5, '2011-01-01 13:00:00', '2011-01-01 19:00:00'),
(10, 10, '2011-01-01 10:00:00', '2011-01-01 20:00:00'),
(11, 9, '2011-01-02 14:00:00', '2011-01-02 20:00:00'),
(12, 9, '2011-01-01 10:00:00', '2011-01-01 16:00:00'),
(13, 8, '2011-01-01 14:00:00', '2011-01-01 20:00:00'),
(14, 7, '2011-01-01 07:00:00', '2011-01-02 20:00:00'),
(15, 6, '2011-01-01 07:00:00', '2011-01-02 13:00:00'),
(16, 11, '2011-01-02 12:00:00', '2011-01-02 18:00:00'),
(17, 12, '2011-01-02 16:00:00', '2011-01-02 23:00:00'),
(18, 12, '2011-01-02 10:00:00', '2011-01-02 16:00:00'),
(19, 13, '2011-01-02 07:00:00', '2011-01-02 10:00:00'),
(20, 13, '2011-01-01 00:00:00', '2011-01-01 16:00:00'),
(21, 14, '2011-01-01 16:00:00', '2011-01-01 23:00:00'),
(22, 14, '2011-01-02 07:00:00', '2011-01-02 10:00:00'),
(23, 15, '2011-01-01 00:00:00', '2011-01-01 16:00:00'),
(24, 16, '2011-01-02 10:00:00', '2011-01-02 16:00:00'),
(25, 16, '2011-01-02 16:00:00', '2011-01-02 23:00:00'),
(26, 17, '2011-01-01 00:00:00', '2011-01-01 16:00:00'),
(27, 17, '2011-01-01 16:00:00', '2011-01-01 23:00:00'),
(28, 18, '2011-01-02 10:00:00', '2011-01-02 16:00:00'),
(29, 19, '2011-01-02 16:00:00', '2011-01-02 23:00:00'),
(30, 19, '2011-01-01 16:00:00', '2011-01-01 23:00:00'),
(31, 20, '2011-01-01 16:00:00', '2011-01-01 23:00:00'),
(32, 21, '2011-01-02 07:00:00', '2011-01-02 10:00:00'),
(33, 21, '2011-01-02 16:00:00', '2011-01-02 23:00:00'),
(34, 22, '2011-01-02 07:00:00', '2011-01-02 10:00:00'),
(35, 22, '2011-01-02 16:00:00', '2011-01-02 23:00:00'),
(36, 23, '2011-01-02 10:00:00', '2011-01-02 16:00:00'),
(37, 23, '2011-01-01 16:00:00', '2011-01-01 23:00:00'),
(38, 24, '2011-01-01 00:00:00', '2011-01-01 16:00:00'),
(39, 24, '2011-01-02 10:00:00', '2011-01-02 16:00:00'),
(40, 25, '2011-01-01 16:00:00', '2011-01-01 23:00:00'),
(41, 26, '2011-01-02 16:00:00', '2011-01-02 23:00:00'),
(42, 26, '2011-01-02 10:00:00', '2011-01-02 16:00:00'),
(43, 27, '2011-01-01 00:00:00', '2011-01-01 16:00:00'),
(44, 27, '2011-01-02 16:00:00', '2011-01-02 23:00:00'),
(45, 28, '2011-01-01 16:00:00', '2011-01-01 23:00:00'),
(46, 29, '2011-01-02 16:00:00', '2011-01-02 23:00:00'),
(47, 29, '2011-01-02 07:00:00', '2011-01-02 10:00:00'),
(48, 30, '2011-01-01 16:00:00', '2011-01-01 23:00:00'),
(49, 30, '2011-01-01 00:00:00', '2011-01-01 16:00:00'),
(50, 31, '2011-01-01 00:00:00', '2011-01-01 16:00:00'),
(51, 32, '2011-01-02 07:00:00', '2011-01-02 10:00:00'),
(52, 32, '2011-01-02 10:00:00', '2011-01-02 16:00:00'),
(53, 33, '2011-01-02 10:00:00', '2011-01-02 16:00:00'),
(54, 33, '2011-01-02 16:00:00', '2011-01-02 23:00:00'),
(55, 34, '2011-01-02 07:00:00', '2011-01-02 10:00:00'),
(56, 34, '2011-01-02 10:00:00', '2011-01-02 16:00:00'),
(57, 35, '2011-01-01 00:00:00', '2011-01-01 16:00:00'),
(58, 35, '2011-01-02 10:00:00', '2011-01-02 16:00:00'),
(59, 36, '2011-01-01 00:00:00', '2011-01-01 16:00:00'),
(60, 36, '2011-01-01 16:00:00', '2011-01-01 23:00:00'),
(61, 37, '2011-01-01 00:00:00', '2011-01-01 16:00:00'),
(62, 37, '2011-01-01 16:00:00', '2011-01-01 23:00:00'),
(63, 38, '2011-01-02 10:00:00', '2011-01-02 16:00:00'),
(64, 38, '2011-01-02 07:00:00', '2011-01-02 10:00:00'),
(65, 39, '2011-01-02 10:00:00', '2011-01-02 16:00:00'),
(66, 40, '2011-01-02 07:00:00', '2011-01-02 10:00:00'),
(67, 41, '2011-01-02 16:00:00', '2011-01-02 23:00:00'),
(68, 41, '2011-01-02 10:00:00', '2011-01-02 16:00:00'),
(69, 42, '2011-01-02 16:00:00', '2011-01-02 23:00:00'),
(70, 42, '2011-01-01 00:00:00', '2011-01-01 16:00:00'),
(71, 43, '2011-01-02 10:00:00', '2011-01-02 16:00:00'),
(72, 43, '2011-01-02 07:00:00', '2011-01-02 10:00:00'),
(73, 44, '2011-01-02 07:00:00', '2011-01-02 10:00:00'),
(74, 44, '2011-01-01 00:00:00', '2011-01-01 16:00:00'),
(75, 45, '2011-01-02 16:00:00', '2011-01-02 23:00:00'),
(76, 45, '2011-01-02 10:00:00', '2011-01-02 16:00:00'),
(77, 46, '2011-01-02 10:00:00', '2011-01-02 16:00:00'),
(78, 46, '2011-01-01 00:00:00', '2011-01-01 16:00:00'),
(79, 47, '2011-01-02 10:00:00', '2011-01-02 16:00:00'),
(80, 47, '2011-01-01 16:00:00', '2011-01-01 23:00:00'),
(81, 48, '2011-01-02 07:00:00', '2011-01-02 10:00:00'),
(82, 48, '2011-01-01 16:00:00', '2011-01-01 23:00:00'),
(83, 49, '2011-01-01 00:00:00', '2011-01-01 16:00:00'),
(84, 50, '2011-01-01 00:00:00', '2011-01-01 16:00:00'),
(85, 50, '2011-01-02 10:00:00', '2011-01-02 16:00:00'),
(86, 51, '2011-01-02 10:00:00', '2011-01-02 16:00:00'),
(87, 51, '2011-01-01 00:00:00', '2011-01-01 16:00:00'),
(88, 52, '2011-01-01 00:00:00', '2011-01-01 16:00:00'),
(89, 52, '2011-01-02 07:00:00', '2011-01-02 10:00:00'),
(90, 53, '2011-01-02 10:00:00', '2011-01-02 16:00:00'),
(91, 54, '2011-01-02 07:00:00', '2011-01-02 10:00:00'),
(92, 55, '2011-01-01 00:00:00', '2011-01-01 16:00:00'),
(93, 56, '2011-01-01 00:00:00', '2011-01-01 16:00:00'),
(94, 57, '2011-01-02 10:00:00', '2011-01-02 16:00:00'),
(95, 57, '2011-01-01 00:00:00', '2011-01-01 16:00:00'),
(96, 58, '2011-01-02 16:00:00', '2011-01-02 23:00:00'),
(97, 58, '2011-01-02 07:00:00', '2011-01-02 10:00:00'),
(98, 59, '2011-01-02 07:00:00', '2011-01-02 10:00:00'),
(99, 60, '2011-01-01 16:00:00', '2011-01-01 23:00:00'),
(100, 60, '2011-01-01 00:00:00', '2011-01-01 16:00:00'),
(101, 61, '2011-01-01 16:00:00', '2011-01-01 23:00:00');



--
-- Contenu de la table `User`
--

INSERT INTO `User` (`id`, `username`, `pass`, `email`) VALUES
(1, 'orga', 'orga', 'orga@24heures.org');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
