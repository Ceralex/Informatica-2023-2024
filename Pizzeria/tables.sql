-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Ott 21, 2023 alle 09:22
-- Versione del server: 10.4.28-MariaDB
-- Versione PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pizzeria`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `clienti`
--

CREATE TABLE `clienti` (
  `id` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `indirizzo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `ingredienti`
--

CREATE TABLE `ingredienti` (
  `nome` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `ordini`
--

CREATE TABLE `ordini` (
  `id` int(11) NOT NULL,
  `giorno` date NOT NULL,
  `tipo_pagamento` enum('carta','contanti','crypto') DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `pizze`
--

CREATE TABLE `pizze` (
  `nome` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `pizze_ingredienti`
--

CREATE TABLE `pizze_ingredienti` (
  `nome_pizza` varchar(20) DEFAULT NULL,
  `ingrediente` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `pizze_ordini`
--

CREATE TABLE `pizze_ordini` (
  `id_ordine` int(11) NOT NULL,
  `nome_pizza` varchar(20) NOT NULL,
  `quantita` int(11) NOT NULL,
  `prezzo` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `clienti`
--
ALTER TABLE `clienti`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `ingredienti`
--
ALTER TABLE `ingredienti`
  ADD PRIMARY KEY (`nome`);

--
-- Indici per le tabelle `ordini`
--
ALTER TABLE `ordini`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indici per le tabelle `pizze`
--
ALTER TABLE `pizze`
  ADD PRIMARY KEY (`nome`);

--
-- Indici per le tabelle `pizze_ingredienti`
--
ALTER TABLE `pizze_ingredienti`
  ADD KEY `nome_pizza` (`nome_pizza`),
  ADD KEY `ingrediente` (`ingrediente`);

--
-- Indici per le tabelle `pizze_ordini`
--
ALTER TABLE `pizze_ordini`
  ADD PRIMARY KEY (`id_ordine`,`nome_pizza`),
  ADD KEY `nome_pizza` (`nome_pizza`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `ordini`
--
ALTER TABLE `ordini`
  ADD CONSTRAINT `ordini_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clienti` (`id`);

--
-- Limiti per la tabella `pizze_ingredienti`
--
ALTER TABLE `pizze_ingredienti`
  ADD CONSTRAINT `pizze_ingredienti_ibfk_1` FOREIGN KEY (`nome_pizza`) REFERENCES `pizze` (`nome`),
  ADD CONSTRAINT `pizze_ingredienti_ibfk_2` FOREIGN KEY (`ingrediente`) REFERENCES `ingredienti` (`nome`);

--
-- Limiti per la tabella `pizze_ordini`
--
ALTER TABLE `pizze_ordini`
  ADD CONSTRAINT `pizze_ordini_ibfk_1` FOREIGN KEY (`id_ordine`) REFERENCES `ordini` (`id`),
  ADD CONSTRAINT `pizze_ordini_ibfk_2` FOREIGN KEY (`nome_pizza`) REFERENCES `pizze` (`nome`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

