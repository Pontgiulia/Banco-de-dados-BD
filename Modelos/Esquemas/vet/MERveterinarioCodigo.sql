-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.

CREATE DATABASE veterinario;

USE veterinario;

CREATE TABLE Animal (
Raça varchar(255),
Vacinas varchar(255),
Doenças varchar(255),
DatadNasc int,
Tipo varchar(255),
id int PRIMARY KEY,
Nome varchar(255),

id int
);

CREATE TABLE Consulta (
id int PRIMARY KEY AUTO_INCREMENT,
Data int,
Especialista varchar(255),
Motivo varchar(255)
);

CREATE TABLE Dono (
id int PRIMARY KEY AUTO_INCREMENT,
Rua varchar(255),
email varchar(255),
Complemento Varchar(255),
Telefone int,
numero int,
Nome varchar(255),
Bairro varchar(255),
DatadNasc int,
CEP int,

id int,
FOREIGN KEY(id) REFERENCES Animal (id)
);

CREATE TABLE Veterinário (
id int PRIMARY KEY AUTO_INCREMENT,
numero int,
Bairro varchar(255),
Rua varchar(255),
email varchar(255),
Complemento varchar(255),
Nome varchar(255),
CEP int,
Telefone int,
datadNasc int,

id int,
FOREIGN KEY(id) REFERENCES Consulta (id)
);

ALTER TABLE Animal ADD FOREIGN KEY(id) REFERENCES Consulta (id);
