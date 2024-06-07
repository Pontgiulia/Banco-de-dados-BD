-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07/06/2024 às 17:43
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `produtoravinho`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `casta`
--

CREATE TABLE `casta` (
  `codcasta` int(11) NOT NULL,
  `casta` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `casta_vinho`
--

CREATE TABLE `casta_vinho` (
  `codvinho` int(11) DEFAULT NULL,
  `codcasta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtor`
--

CREATE TABLE `produtor` (
  `idprodutor` int(11) NOT NULL,
  `nomeprodutor` varchar(50) DEFAULT NULL,
  `moradaprodutor` varchar(50) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `codregiao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtor`
--

INSERT INTO `produtor` (`idprodutor`, `nomeprodutor`, `moradaprodutor`, `telefone`, `email`, `codregiao`) VALUES
(1, 'Qt. Vallado', 'Régua', '254323147', 'vallado@mail.telepac.pt', 1),
(3, 'Finagra', 'Reguengos', '266509270', 'esporao@esporao.com', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `regiao`
--

CREATE TABLE `regiao` (
  `idregiao` int(11) NOT NULL,
  `descriregiao` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `regiao`
--

INSERT INTO `regiao` (`idregiao`, `descriregiao`) VALUES
(1, 'Dão'),
(2, 'Alenteijo'),
(3, 'Douro'),
(4, 'ETEC MCM'),
(5, 'Fazenda MCM'),
(7, 'Fazenda Sul Giu');

-- --------------------------------------------------------

--
-- Estrutura para tabela `vinho`
--

CREATE TABLE `vinho` (
  `idvinho` int(11) NOT NULL,
  `nomevinho` varchar(30) DEFAULT NULL,
  `ano_vinho` int(11) DEFAULT NULL,
  `cor` varchar(15) DEFAULT NULL,
  `grau` decimal(7,2) DEFAULT NULL,
  `preco` decimal(7,2) DEFAULT NULL,
  `codprodutor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `casta`
--
ALTER TABLE `casta`
  ADD PRIMARY KEY (`codcasta`);

--
-- Índices de tabela `casta_vinho`
--
ALTER TABLE `casta_vinho`
  ADD KEY `codvinho` (`codvinho`),
  ADD KEY `codcasta` (`codcasta`);

--
-- Índices de tabela `produtor`
--
ALTER TABLE `produtor`
  ADD PRIMARY KEY (`idprodutor`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `codregiao` (`codregiao`);

--
-- Índices de tabela `regiao`
--
ALTER TABLE `regiao`
  ADD PRIMARY KEY (`idregiao`);

--
-- Índices de tabela `vinho`
--
ALTER TABLE `vinho`
  ADD PRIMARY KEY (`idvinho`),
  ADD KEY `codprodutor` (`codprodutor`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `casta`
--
ALTER TABLE `casta`
  MODIFY `codcasta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produtor`
--
ALTER TABLE `produtor`
  MODIFY `idprodutor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `regiao`
--
ALTER TABLE `regiao`
  MODIFY `idregiao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `vinho`
--
ALTER TABLE `vinho`
  MODIFY `idvinho` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `casta_vinho`
--
ALTER TABLE `casta_vinho`
  ADD CONSTRAINT `casta_vinho_ibfk_1` FOREIGN KEY (`codvinho`) REFERENCES `vinho` (`idvinho`),
  ADD CONSTRAINT `casta_vinho_ibfk_2` FOREIGN KEY (`codcasta`) REFERENCES `casta` (`codcasta`);

--
-- Restrições para tabelas `produtor`
--
ALTER TABLE `produtor`
  ADD CONSTRAINT `produtor_ibfk_1` FOREIGN KEY (`codregiao`) REFERENCES `regiao` (`idregiao`);

--
-- Restrições para tabelas `vinho`
--
ALTER TABLE `vinho`
  ADD CONSTRAINT `vinho_ibfk_1` FOREIGN KEY (`codprodutor`) REFERENCES `produtor` (`idprodutor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
