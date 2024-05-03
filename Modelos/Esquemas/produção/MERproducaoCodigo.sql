-- Geração de Modelo físico
-- SQL ANSI 2003 - brModelo.

CREATE DATABASE producao;

USE producao;

CREATE TABLE Departamento (
    CodDepart INT PRIMARY KEY AUTO_INCREMENT,
    CodEmpr INT
);

CREATE TABLE Empregado (
    CodEmpr INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(255),
    Email VARCHAR(255),
    Rua VARCHAR(255),
    Complemento VARCHAR(255),
    CarteiraTrabalho INT,
    Bairro VARCHAR(255),
    CEP INT,
    DataNasc DATE,
    CodProdut INT
);

CREATE TABLE Produto (
    CodProdut INT PRIMARY KEY AUTO_INCREMENT,
    Preco FLOAT,
    Peso FLOAT,
    Tipo VARCHAR(1)
);

CREATE TABLE Estoque (
    CodEstoque INT PRIMARY KEY AUTO_INCREMENT,
    QuantidadeProduto INT,
    Produto VARCHAR(255),
    CodProdut INT,
    FOREIGN KEY(CodProdut) REFERENCES Produto(CodProdut)
);

ALTER TABLE Departamento ADD FOREIGN KEY(CodEmpr) REFERENCES Empregado(CodEmpr);
ALTER TABLE Empregado ADD FOREIGN KEY(CodProdut) REFERENCES Produto(CodProdut);
