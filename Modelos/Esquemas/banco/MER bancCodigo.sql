-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.

CREATE DATABASE banco;

USE banco;

CREATE TABLE Agencia (
Codagen int PRIMARY KEY AUTO_INCREMENT,
Complemento varchar(255),
Bairro varchar(255),
UF varchar(255),
Telefone int,
Rua Texto(1)
);

CREATE TABLE Contacorrente+Cliente+Contapoupanca (
CodCorrente int,
Codclient int,
Rua int,
Bairro varchar(255),
UF varchar(255),
Complemento varchar(255),
rg varchar(255),
Profissao varchar(255),
renda float,
Email varchar(255),
telefone int,
Nome varchar(255),
cpf int,
Codagen int,
CodPoupanca int,
PRIMARY KEY (CodCorrente,Codclient,CodPoupanca),
FOREIGN KEY(Codagen) REFERENCES Agencia (Codagen);
);

