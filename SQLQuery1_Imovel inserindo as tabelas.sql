USE CREATE DATABASE GTIimoveis;
go

USE GTIimoveis;
go

CREATE TABLE estado(
sgEstado CHAR(2) NOT NULL PRIMARY KEY,
nmEstado VARCHAR(15) NOT NULL
);
GO

CREATE TABLE cidade(
codigoCidade INTEGER NOT NULL PRIMARY KEY,
nomeCidade VARCHAR(50) NOT NULL,
sgEstado CHAR(2) NOT NULL,
FOREIGN KEY (sgEstado)
REFERENCES estado(sgEstado)
);
GO

CREATE TABLE bairro(
codigoBairro INTEGER NOT NULL PRIMARY KEY,
nomeBairro VARCHAR(50) NOT NULL,
codigoCidade INTEGER NOT NULL,
sgEstado CHAR(2) NOT NULL,
FOREIGN KEY (codigoCidade)
REFERENCES cidade(codigoCidade),
FOREIGN KEY (sgEstado)
REFERENCES estado(sgEstado)
);
GO

CREATE TABLE faixaImovel(
codigoFaixa INTEGER NOT NULL PRIMARY KEY,
nomeFaixa VARCHAR(50) NOT NULL,
valorMinimo NUMERIC(8,2),
valorMaximo NUMERIC(9,2)
);
GO

CREATE TABLE compradores(
codigoComprador INTEGER NOT NULL PRIMARY KEY,
nomeComprador VARCHAR(50) NOT NULL,
nomeEnderecoComprador VARCHAR(255) NOT NULL,
nrCPFComprador NUMERIC(11,0) NOT NULL,
codigoCidade INTEGER NOT NULL,
codigoBairro INTEGER  NOT NULL,
sgEstado CHAR(2) NOT NULL,
telComprador INTEGER NOT NULL,
FOREIGN KEY (codigoCidade)
REFERENCES cidade(codigoCidade),
FOREIGN KEY (codigoBairro)
REFERENCES bairro(codigoBairro),
FOREIGN KEY (sgEstado)
REFERENCES estado(sgEstado)
);
GO

ALTER TABLE compradores
ALTER COLUMN telComprador NUMERIC(11,0) NOT NULL;
GO


CREATE TABLE vendedor(
codigoVendedor INTEGER NOT NULL PRIMARY KEY,
nomeVendedor VARCHAR(50) NOT NULL,
nomeEndereco VARCHAR(255) NOT NULL,
nrCPF NUMERIC(11,0) NOT NULL,
codigoCidade INTEGER NOT NULL,
codigoBairro INTEGER  NOT NULL,
sgEstado CHAR(2) NOT NULL,
telefone NUMERIC(9,2) NOT NULL,
dataNascimento DATE NOT NULL,
FOREIGN KEY (codigoCidade)
REFERENCES cidade(codigoCidade),
FOREIGN KEY (codigoBairro)
REFERENCES bairro(codigoBairro),
FOREIGN KEY (sgEstado)
REFERENCES estado(sgEstado)
);
GO

ALTER TABLE vendedor
ALTER COLUMN telefone NUMERIC(11,0) NOT NULL;
GO

CREATE TABLE Imovel(
codigoImovel INTEGER NOT NULL PRIMARY KEY,
codigoVendedor INTEGER NOT NULL,
codigoCidade INTEGER NOT NULL,
codigoBairro INTEGER  NOT NULL,
sgEstado CHAR(2) NOT NULL,
enderecoImovel VARCHAR(255) NOT NULL,
nrAreaUtil DECIMAL(7,2) NOT NULL,
nrAreaTotal DECIMAL(7,2) NOT NULL,
vlPreco DECIMAL(11,2) NOT NULL,
stVendido CHAR(1) NOT NULL,
dataLancamento NUMERIC(10,2) NOT NULL
FOREIGN KEY (codigoCidade)
REFERENCES cidade(codigoCidade),
FOREIGN KEY (codigoBairro)
REFERENCES bairro(codigoBairro),
FOREIGN KEY (sgEstado)
REFERENCES estado(sgEstado),
FOREIGN KEY (codigoVendedor)
REFERENCES vendedor(codigoVendedor)
);
GO

ALTER TABLE Imovel
ALTER COLUMN dataLancamento DATETIME NOT NULL

CREATE TABLE oferta(
codigoOferta INTEGER NOT NULL PRIMARY KEY,
codigoComprador INTEGER NOT NULL,
vlOferta NUMERIC(10,2) NOT NULL,
dataOferta NUMERIC(10,2) NOT NULL,
FOREIGN KEY (codigoComprador)
REFERENCES compradores(codigoComprador)
);
GO

ALTER TABLE oferta
ALTER COLUMN dataOferta DATETIME NOT NULL;
GO

CREATE TABLE ofertaImovel(
codigoImovel INTEGER NOT NULL,
codigoOferta INTEGER NOT NULL,
FOREIGN KEY (codigoImovel)
REFERENCES Imovel(codigoImovel),
FOREIGN KEY (codigoOferta)
REFERENCES oferta(codigoOferta)
);
GO
