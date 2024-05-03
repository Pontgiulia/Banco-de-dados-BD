-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03/05/2024 às 00:20
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
-- Banco de dados: `banco`
--
CREATE DATABASE IF NOT EXISTS `banco` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `banco`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `agencia`
--

CREATE TABLE `agencia` (
  `CodAgencia` int(11) NOT NULL,
  `Complemento` varchar(255) DEFAULT NULL,
  `Bairro` varchar(255) DEFAULT NULL,
  `UF` varchar(255) DEFAULT NULL,
  `Telefone` int(11) DEFAULT NULL,
  `Rua` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `contacorrente`
--

CREATE TABLE `contacorrente` (
  `CodCorrente` int(11) NOT NULL,
  `CodCliente` int(11) DEFAULT NULL,
  `Rua` int(11) DEFAULT NULL,
  `Bairro` varchar(255) DEFAULT NULL,
  `UF` varchar(255) DEFAULT NULL,
  `Complemento` varchar(255) DEFAULT NULL,
  `RG` varchar(255) DEFAULT NULL,
  `Profissao` varchar(255) DEFAULT NULL,
  `Renda` float DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Telefone` int(11) DEFAULT NULL,
  `Nome` varchar(255) DEFAULT NULL,
  `CPF` int(11) DEFAULT NULL,
  `CodAgencia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `contapoupanca`
--

CREATE TABLE `contapoupanca` (
  `CodPoupanca` int(11) NOT NULL,
  `CodCliente` int(11) DEFAULT NULL,
  `Rua` int(11) DEFAULT NULL,
  `Bairro` varchar(255) DEFAULT NULL,
  `UF` varchar(255) DEFAULT NULL,
  `Complemento` varchar(255) DEFAULT NULL,
  `RG` varchar(255) DEFAULT NULL,
  `Profissao` varchar(255) DEFAULT NULL,
  `Renda` float DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Telefone` int(11) DEFAULT NULL,
  `Nome` varchar(255) DEFAULT NULL,
  `CPF` int(11) DEFAULT NULL,
  `CodAgencia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `agencia`
--
ALTER TABLE `agencia`
  ADD PRIMARY KEY (`CodAgencia`);

--
-- Índices de tabela `contacorrente`
--
ALTER TABLE `contacorrente`
  ADD PRIMARY KEY (`CodCorrente`),
  ADD KEY `CodAgencia` (`CodAgencia`);

--
-- Índices de tabela `contapoupanca`
--
ALTER TABLE `contapoupanca`
  ADD PRIMARY KEY (`CodPoupanca`),
  ADD KEY `CodAgencia` (`CodAgencia`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `agencia`
--
ALTER TABLE `agencia`
  MODIFY `CodAgencia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `contacorrente`
--
ALTER TABLE `contacorrente`
  MODIFY `CodCorrente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `contapoupanca`
--
ALTER TABLE `contapoupanca`
  MODIFY `CodPoupanca` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `contacorrente`
--
ALTER TABLE `contacorrente`
  ADD CONSTRAINT `contacorrente_ibfk_1` FOREIGN KEY (`CodAgencia`) REFERENCES `agencia` (`CodAgencia`);

--
-- Restrições para tabelas `contapoupanca`
--
ALTER TABLE `contapoupanca`
  ADD CONSTRAINT `contapoupanca_ibfk_1` FOREIGN KEY (`CodAgencia`) REFERENCES `agencia` (`CodAgencia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
