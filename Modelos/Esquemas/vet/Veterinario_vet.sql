-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03/05/2024 às 00:22
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `vet`
--
CREATE DATABASE IF NOT EXISTS `vet` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `vet`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `animal`
--

CREATE TABLE `animal` (
  `ID` int(11) NOT NULL,
  `Raca` varchar(255) DEFAULT NULL,
  `Vacinas` varchar(255) DEFAULT NULL,
  `Doencas` varchar(255) DEFAULT NULL,
  `DataNasc` date DEFAULT NULL,
  `Tipo` varchar(255) DEFAULT NULL,
  `Nome` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `consulta`
--

CREATE TABLE `consulta` (
  `ID` int(11) NOT NULL,
  `Data` date DEFAULT NULL,
  `Especialista` varchar(255) DEFAULT NULL,
  `Motivo` varchar(255) DEFAULT NULL,
  `AnimalID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `dono`
--

CREATE TABLE `dono` (
  `ID` int(11) NOT NULL,
  `Rua` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Complemento` varchar(255) DEFAULT NULL,
  `Telefone` int(11) DEFAULT NULL,
  `Numero` int(11) DEFAULT NULL,
  `Nome` varchar(255) DEFAULT NULL,
  `Bairro` varchar(255) DEFAULT NULL,
  `DataNasc` date DEFAULT NULL,
  `CEP` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `veterinario`
--

CREATE TABLE `veterinario` (
  `ID` int(11) NOT NULL,
  `Numero` int(11) DEFAULT NULL,
  `Bairro` varchar(255) DEFAULT NULL,
  `Rua` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Complemento` varchar(255) DEFAULT NULL,
  `Nome` varchar(255) DEFAULT NULL,
  `CEP` int(11) DEFAULT NULL,
  `Telefone` int(11) DEFAULT NULL,
  `DataNasc` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`ID`);

--
-- Índices de tabela `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `AnimalID` (`AnimalID`);

--
-- Índices de tabela `dono`
--
ALTER TABLE `dono`
  ADD PRIMARY KEY (`ID`);

--
-- Índices de tabela `veterinario`
--
ALTER TABLE `veterinario`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `animal`
--
ALTER TABLE `animal`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `consulta`
--
ALTER TABLE `consulta`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `dono`
--
ALTER TABLE `dono`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `veterinario`
--
ALTER TABLE `veterinario`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`AnimalID`) REFERENCES `animal` (`ID`),
  ADD CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`AnimalID`) REFERENCES `animal` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
