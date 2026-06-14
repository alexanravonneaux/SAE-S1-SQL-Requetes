-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mer. 29 jan. 2025 à 10:25
-- Version du serveur :  5.7.17
-- Version de PHP :  5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `td1`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `CLI_REF` int(11) NOT NULL,
  `CLI_NOM` varchar(20) NOT NULL,
  `CLI_RUE` varchar(30) NOT NULL,
  `CLI_CP` int(11) NOT NULL,
  `CLI_VILLE` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `correcteur`
--

CREATE TABLE `correcteur` (
  `COR_IDC` int(11) NOT NULL,
  `COR_NOMC` varchar(20) NOT NULL,
  `COR_RUE` varchar(50) NOT NULL,
  `COR_CP` int(11) NOT NULL,
  `COR_VILLE` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE `facture` (
  `FACT_NUM` int(11) NOT NULL,
  `FAC_DATE` date NOT NULL,
  `CLI_REF` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `langue`
--

CREATE TABLE `langue` (
  `LAN_CODEL` int(11) NOT NULL,
  `LAN_LIBELLEL` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `niveau`
--

CREATE TABLE `niveau` (
  `NIV_NUM` int(11) NOT NULL,
  `NIV_PRIXUNITAIRECOPIE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `pacquet`
--

CREATE TABLE `pacquet` (
  `PAQ_NUMP` int(11) NOT NULL,
  `PAQ_NBCOPIES` int(11) NOT NULL,
  `PAQ_DATEREMISE` date NOT NULL,
  `PAQ_DATERETOUR` date DEFAULT NULL,
  `FACT_NUM` int(11) DEFAULT NULL,
  `COR_IDC` int(11) NOT NULL,
  `LAN_CODEL` int(11) NOT NULL,
  `NIV_NUM` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `reglement`
--

CREATE TABLE `reglement` (
  `REG_NUM` int(11) NOT NULL,
  `REG_DATE` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `regler`
--

CREATE TABLE `regler` (
  `FACT_NUM` int(11) NOT NULL,
  `REG_NUM` int(11) NOT NULL,
  `RGL_MONTANT` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `specialiser`
--

CREATE TABLE `specialiser` (
  `LAN_CODEL` int(11) NOT NULL,
  `COR_IDC` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`CLI_REF`);

--
-- Index pour la table `correcteur`
--
ALTER TABLE `correcteur`
  ADD PRIMARY KEY (`COR_IDC`);

--
-- Index pour la table `facture`
--
ALTER TABLE `facture`
  ADD PRIMARY KEY (`FACT_NUM`),
  ADD KEY `CLI_REF` (`CLI_REF`);

--
-- Index pour la table `langue`
--
ALTER TABLE `langue`
  ADD PRIMARY KEY (`LAN_CODEL`);

--
-- Index pour la table `niveau`
--
ALTER TABLE `niveau`
  ADD PRIMARY KEY (`NIV_NUM`);

--
-- Index pour la table `pacquet`
--
ALTER TABLE `pacquet`
  ADD PRIMARY KEY (`PAQ_NUMP`),
  ADD KEY `FACT_NUM` (`FACT_NUM`),
  ADD KEY `COR_IDC` (`COR_IDC`),
  ADD KEY `LAN_CODEL` (`LAN_CODEL`),
  ADD KEY `NIV_NUM` (`NIV_NUM`);

--
-- Index pour la table `reglement`
--
ALTER TABLE `reglement`
  ADD PRIMARY KEY (`REG_NUM`);

--
-- Index pour la table `regler`
--
ALTER TABLE `regler`
  ADD PRIMARY KEY (`FACT_NUM`,`REG_NUM`),
  ADD KEY `REG_NUM` (`REG_NUM`);

--
-- Index pour la table `specialiser`
--
ALTER TABLE `specialiser`
  ADD PRIMARY KEY (`LAN_CODEL`,`COR_IDC`),
  ADD KEY `COR_IDC` (`COR_IDC`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `facture`
--
ALTER TABLE `facture`
  ADD CONSTRAINT `facture_ibfk_1` FOREIGN KEY (`CLI_REF`) REFERENCES `client` (`CLI_REF`);

--
-- Contraintes pour la table `pacquet`
--
ALTER TABLE `pacquet`
  ADD CONSTRAINT `pacquet_ibfk_1` FOREIGN KEY (`FACT_NUM`) REFERENCES `facture` (`FACT_NUM`),
  ADD CONSTRAINT `pacquet_ibfk_2` FOREIGN KEY (`COR_IDC`) REFERENCES `correcteur` (`COR_IDC`),
  ADD CONSTRAINT `pacquet_ibfk_3` FOREIGN KEY (`LAN_CODEL`) REFERENCES `langue` (`LAN_CODEL`),
  ADD CONSTRAINT `pacquet_ibfk_4` FOREIGN KEY (`NIV_NUM`) REFERENCES `niveau` (`NIV_NUM`);

--
-- Contraintes pour la table `regler`
--
ALTER TABLE `regler`
  ADD CONSTRAINT `regler_ibfk_1` FOREIGN KEY (`FACT_NUM`) REFERENCES `facture` (`FACT_NUM`),
  ADD CONSTRAINT `regler_ibfk_2` FOREIGN KEY (`REG_NUM`) REFERENCES `reglement` (`REG_NUM`);

--
-- Contraintes pour la table `specialiser`
--
ALTER TABLE `specialiser`
  ADD CONSTRAINT `specialiser_ibfk_1` FOREIGN KEY (`LAN_CODEL`) REFERENCES `langue` (`LAN_CODEL`),
  ADD CONSTRAINT `specialiser_ibfk_2` FOREIGN KEY (`COR_IDC`) REFERENCES `correcteur` (`COR_IDC`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
