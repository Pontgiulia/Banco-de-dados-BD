-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 25/06/2024 às 03:45
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
-- Banco de dados: `seguradoradeveiculos`
--
CREATE DATABASE IF NOT EXISTS `seguradoradeveiculos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `seguradoradeveiculos`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `carro`
--

CREATE TABLE `carro` (
  `codCarro` int(11) NOT NULL,
  `marca` varchar(30) NOT NULL,
  `modelo` varchar(30) NOT NULL,
  `chassi` varchar(10) DEFAULT NULL,
  `placa` varchar(10) NOT NULL,
  `cor` varchar(30) DEFAULT NULL,
  `porte` varchar(20) DEFAULT NULL,
  `codCliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `carro`
--

INSERT INTO `carro` (`codCarro`, `marca`, `modelo`, `chassi`, `placa`, `cor`, `porte`, `codCliente`) VALUES
(3, 'Chevrolet', 'Camaro', NULL, '123AB45', 'amarela', NULL, 3),
(4, 'Tesla', 'Model S', NULL, '678CD90', 'preta', NULL, 4),
(5, 'Fiat', '500', NULL, '234EF56', 'vermelha', NULL, 5),
(6, 'Volkswagen', 'Golf', NULL, '789GH12', 'azul', NULL, 6),
(7, 'Jeep', 'Renegade', NULL, '345IJ78', 'verde', NULL, 7);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `codCliente` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `dataNasc` date NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `rg` varchar(15) NOT NULL,
  `rua` varchar(50) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `compl` varchar(30) DEFAULT NULL,
  `estado` char(2) DEFAULT NULL,
  `bairro` varchar(30) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `cep` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`codCliente`, `nome`, `dataNasc`, `telefone`, `email`, `cpf`, `rg`, `rua`, `num`, `compl`, `estado`, `bairro`, `cidade`, `cep`) VALUES
(3, 'Pedro Silva', '2007-02-14', '54330-4330', 'pedrosilva@email', '469.067.584-77', '64.244.864-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Ana Costa', '2009-06-23', '54331-4331', 'anacosta@email', '469.067.584-78', '64.244.864-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Rafael Oliveira', '2005-10-19', '54332-4332', 'rafaeloliveira@email', '469.067.584-79', '64.244.864-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'Mariana Ferreira', '2006-08-04', '54333-4333', 'marianaferreira@email', '469.067.584-80', '64.244.864-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'Felipe Santos', '2008-12-11', '54334-4334', 'felipesantos@email', '469.067.584-81', '64.244.864-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `ocorrencia`
--

CREATE TABLE `ocorrencia` (
  `codOcorrencia` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `codTipo` varchar(10) DEFAULT NULL,
  `descricao` varchar(225) DEFAULT NULL,
  `bairro` varchar(30) DEFAULT NULL,
  `rua` varchar(100) DEFAULT NULL,
  `cidade` varchar(30) DEFAULT NULL,
  `codCarro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `ocorrencia`
--

INSERT INTO `ocorrencia` (`codOcorrencia`, `data`, `hora`, `codTipo`, `descricao`, `bairro`, `rua`, `cidade`, `codCarro`) VALUES
(64, '2023-05-20', '15:00:00', 'B234', 'Colisão Leve', 'Barra da Tijuca', 'Av. das Américas', 'Rio de Janeiro', 3),
(65, '2022-09-10', '11:45:00', 'C345', 'Batida Lateral', 'Morumbi', 'Rua dos Três Irmãos', 'São Paulo', 4),
(66, '2021-11-30', '17:30:00', 'D456', 'Colisão Traseira', 'Boa Viagem', 'Av. Boa Viagem', 'Recife', 5),
(67, '2020-08-05', '08:15:00', 'E567', 'Tombamento', 'Cidade Nova', 'Av. das Flores', 'Belo Horizonte', 6),
(68, '2023-02-12', '14:20:00', 'F678', 'Batida com Objeto Fixo', 'Copacabana', 'Av. Atlântica', 'Rio de Janeiro', 7);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo`
--

CREATE TABLE `tipo` (
  `codTipo` varchar(10) NOT NULL,
  `tipo` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tipo`
--

INSERT INTO `tipo` (`codTipo`, `tipo`) VALUES
('B234', 'Colisão Leve'),
('C345', 'Batida Lateral'),
('D456', 'Colisão Traseira'),
('E567', 'Tombamento'),
('F678', 'Batida com Objeto Fixo');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `carro`
--
ALTER TABLE `carro`
  ADD PRIMARY KEY (`codCarro`),
  ADD UNIQUE KEY `placa` (`placa`),
  ADD KEY `codCliente` (`codCliente`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codCliente`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD UNIQUE KEY `rg` (`rg`);

--
-- Índices de tabela `ocorrencia`
--
ALTER TABLE `ocorrencia`
  ADD PRIMARY KEY (`codOcorrencia`),
  ADD KEY `codCarro` (`codCarro`),
  ADD KEY `codTipo` (`codTipo`);

--
-- Índices de tabela `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`codTipo`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `carro`
--
ALTER TABLE `carro`
  MODIFY `codCarro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `codCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `ocorrencia`
--
ALTER TABLE `ocorrencia`
  MODIFY `codOcorrencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `carro`
--
ALTER TABLE `carro`
  ADD CONSTRAINT `carro_ibfk_1` FOREIGN KEY (`codCliente`) REFERENCES `cliente` (`codCliente`);

--
-- Restrições para tabelas `ocorrencia`
--
ALTER TABLE `ocorrencia`
  ADD CONSTRAINT `ocorrencia_ibfk_1` FOREIGN KEY (`codCarro`) REFERENCES `carro` (`codCarro`),
  ADD CONSTRAINT `ocorrencia_ibfk_2` FOREIGN KEY (`codTipo`) REFERENCES `tipo` (`codTipo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
