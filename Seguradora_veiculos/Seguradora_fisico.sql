-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE cliente (
codCliente int PRIMARY KEY,
nome varchar(100),
dataNasc date,
telefone varchar(15),
email varchar(50),
cpf varchar(15),
rg varchar(15),
rua varchar(50),
num int,
compl varchar(30),
estado char(2),
bairro varchar(30),
cidade varchar(50),
cep varchar(15)
)

CREATE TABLE carro (
codCarro int PRIMARY KEY,
marca varchar(30),
porte varchar(20),
placa varchar(10),
cor varchar(30),
modelo varchar(30),
chassi varchar(10),
codCliente int,
FOREIGN KEY(codCliente) REFERENCES cliente (codCliente)
)

CREATE TABLE ocorrencia (
codOcorrencia int PRIMARY KEY,
data date,
hora date,
bairro varchar(30),
rua varchar(100),
descricao varchar(225),
cidade varchar(30),
codCarro int,
codTipo int,
FOREIGN KEY(codCarro) REFERENCES carro (codCarro)
)

CREATE TABLE tipo (
codTipo int PRIMARY KEY,
tipo varchar(30)
)

ALTER TABLE ocorrencia ADD FOREIGN KEY(codTipo) REFERENCES tipo (codTipo)
