-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03/05/2024 às 00:18
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
-- Banco de dados: `livraria`
--
CREATE DATABASE IF NOT EXISTS `livraria` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `livraria`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `autor`
--

CREATE TABLE `autor` (
  `Id` int(11) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Rua` varchar(255) DEFAULT NULL,
  `UF` varchar(255) DEFAULT NULL,
  `Cidade` varchar(255) DEFAULT NULL,
  `Numero` int(11) DEFAULT NULL,
  `NumeroTel` int(11) DEFAULT NULL,
  `Nome` varchar(255) DEFAULT NULL,
  `Bairro` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `Id` int(11) NOT NULL,
  `UF` varchar(255) DEFAULT NULL,
  `Rua` varchar(255) DEFAULT NULL,
  `Cidade` varchar(255) DEFAULT NULL,
  `NumTel` int(11) DEFAULT NULL,
  `DataNasc` date DEFAULT NULL,
  `Nome` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `CEP` int(11) DEFAULT NULL,
  `Bairro` varchar(255) DEFAULT NULL,
  `Numero` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `editora`
--

CREATE TABLE `editora` (
  `Id` int(11) NOT NULL,
  `NumeroTel` int(11) DEFAULT NULL,
  `Precos` float DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Livros` varchar(255) DEFAULT NULL,
  `UF` varchar(255) DEFAULT NULL,
  `Bairro` varchar(255) DEFAULT NULL,
  `Cidade` varchar(255) DEFAULT NULL,
  `Rua` varchar(255) DEFAULT NULL,
  `CEP` int(11) DEFAULT NULL,
  `Autores` varchar(255) DEFAULT NULL,
  `Numero` int(11) DEFAULT NULL,
  `Pedidos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `livro`
--

CREATE TABLE `livro` (
  `Id` int(11) NOT NULL,
  `DataPubli` int(11) DEFAULT NULL,
  `NumeroPag` int(11) DEFAULT NULL,
  `Categoria` varchar(255) DEFAULT NULL,
  `Nome` varchar(255) DEFAULT NULL,
  `Autor` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

CREATE TABLE `pedido` (
  `Id` int(11) NOT NULL,
  `DataEntrega` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `recebe`
--

CREATE TABLE `recebe` (
  `IdEditora` int(11) DEFAULT NULL,
  `IdPedido` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`Id`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Id`);

--
-- Índices de tabela `editora`
--
ALTER TABLE `editora`
  ADD PRIMARY KEY (`Id`);

--
-- Índices de tabela `livro`
--
ALTER TABLE `livro`
  ADD PRIMARY KEY (`Id`);

--
-- Índices de tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`Id`);

--
-- Índices de tabela `recebe`
--
ALTER TABLE `recebe`
  ADD KEY `IdEditora` (`IdEditora`),
  ADD KEY `IdPedido` (`IdPedido`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `autor`
--
ALTER TABLE `autor`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `editora`
--
ALTER TABLE `editora`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `livro`
--
ALTER TABLE `livro`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `autor`
--
ALTER TABLE `autor`
  ADD CONSTRAINT `autor_ibfk_1` FOREIGN KEY (`Id`) REFERENCES `livro` (`Id`);

--
-- Restrições para tabelas `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`Id`) REFERENCES `pedido` (`Id`);

--
-- Restrições para tabelas `livro`
--
ALTER TABLE `livro`
  ADD CONSTRAINT `livro_ibfk_1` FOREIGN KEY (`Id`) REFERENCES `editora` (`Id`);

--
-- Restrições para tabelas `recebe`
--
ALTER TABLE `recebe`
  ADD CONSTRAINT `recebe_ibfk_1` FOREIGN KEY (`IdEditora`) REFERENCES `editora` (`Id`),
  ADD CONSTRAINT `recebe_ibfk_2` FOREIGN KEY (`IdPedido`) REFERENCES `pedido` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
