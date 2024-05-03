-- Geração de Modelo físico
-- SQL ANSI 2003 - brModelo.

CREATE DATABASE livraria;

USE livraria;

CREATE TABLE Livro (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    DataPubli INT,
    NumeroPag INT,
    Categoria VARCHAR(255),
    Nome VARCHAR(255),
    Autor VARCHAR(255)
);

CREATE TABLE Editora (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    NumeroTel INT,
    Precos FLOAT,
    Email VARCHAR(255),
    Livros VARCHAR(255),
    UF VARCHAR(255),
    Bairro VARCHAR(255),
    Cidade VARCHAR(255),
    Rua VARCHAR(255),
    CEP INT,
    Autores VARCHAR(255),
    Numero INT,
    Pedidos INT
);

CREATE TABLE Cliente (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    UF VARCHAR(255),
    Rua VARCHAR(255),
    Cidade VARCHAR(255),
    NumTel INT,
    DataNasc DATE,
    Nome VARCHAR(255),
    Email VARCHAR(255),
    CEP INT,
    Bairro VARCHAR(255),
    Numero VARCHAR(1)
);

CREATE TABLE Pedido (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    DataEntrega DATE
);

CREATE TABLE Autor (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Email VARCHAR(255),
    Rua VARCHAR(255),
    UF VARCHAR(255),
    Cidade VARCHAR(255),
    Numero INT,
    NumeroTel INT,
    Nome VARCHAR(255),
    Bairro VARCHAR(255)
);

CREATE TABLE Recebe (
    IdEditora INT,
    IdPedido INT,
    FOREIGN KEY(IdEditora) REFERENCES Editora(Id),
    FOREIGN KEY(IdPedido) REFERENCES Pedido(Id)
);

ALTER TABLE Livro ADD FOREIGN KEY(Id) REFERENCES Editora(Id);
ALTER TABLE Cliente ADD FOREIGN KEY(Id) REFERENCES Pedido(Id);
ALTER TABLE Autor ADD FOREIGN KEY(Id) REFERENCES Livro(Id);
