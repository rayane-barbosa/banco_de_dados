CREATE DATABASE LogisticaEngComp
GO

ALTER DATABASE LogisticaEngComp collate Latin1_General_CI_AI
GO

USE LogisticaEngComp
GO

/*
drop table FretesOcorrencias
drop table OcorrenciaTipos
drop table Fretes
drop table FreteTipos
drop table ProdutoTipos
drop table Contratantes
drop table Veiculos
drop table VeiculoTipos
drop table MeiosTransporte
drop table FuncionariosDependentes
drop table DependenteTipos
drop table FuncionariosTreinamentos
drop table FuncionariosTelefones
drop table TelefoneTipos
drop table Funcionarios
drop table Operadoras
drop table Logradouros
drop table Bairros
drop table Cidades
drop table Estados
drop table Paises
drop table Continentes
*/

CREATE TABLE Continentes
(
	IDContinente SMALLINT IDENTITY PRIMARY KEY,
	Nome VARCHAR(30) NOT NULL
)

GO

CREATE TABLE Paises
(
	IDPais SMALLINT IDENTITY PRIMARY KEY,
	Nome VARCHAR(200) NOT NULL,
	Sigla CHAR(3) NOT NULL,
	IDContinente SMALLINT NOT NULL REFERENCES Continentes(IDContinente)
)

GO

CREATE TABLE Estados
(
	IDEstado INT IDENTITY PRIMARY KEY,
	Nome VARCHAR(200) NOT NULL,
	Sigla CHAR(2) NOT NULL,
	IDPais SMALLINT NOT NULL REFERENCES Paises(IDPais)
)

GO

CREATE TABLE Cidades
(
	IDCidade INT IDENTITY PRIMARY KEY,
	Nome VARCHAR(200) NOT NULL,
	IDEstado INT NOT NULL REFERENCES Estados(IDEstado)
)

GO

CREATE TABLE Bairros
(
	IDBairro INT IDENTITY PRIMARY KEY,
	Nome VARCHAR(200) NOT NULL,
	IDCidade INT NOT NULL REFERENCES Cidades(IDCidade)
)

GO

CREATE TABLE Logradouros
(
	IDLogradouro INT IDENTITY PRIMARY KEY,
	Nome VARCHAR(200) NOT NULL,
	IDBairro INT NOT NULL REFERENCES Bairros(IDBairro)
)

GO

CREATE TABLE Operadoras
(
	IDOperadora SMALLINT IDENTITY PRIMARY KEY,
	Nome VARCHAR(50) NOT NULL,
	Numero VARCHAR(5) NOT NULL
)

GO

CREATE TABLE TelefoneTipos
(
	IDTelefoneTipo SMALLINT IDENTITY PRIMARY KEY,
	Nome VARCHAR(50) NOT NULL
)

CREATE TABLE Funcionarios
(
	IDFuncionario INT IDENTITY PRIMARY KEY,
	CPF CHAR(11) NOT NULL,
	Nome VARCHAR(120) NOT NULL, 
	DataNascimento DATE NOT NULL,
	Sexo CHAR(1) NOT NULL CHECK(Sexo = 'M' or Sexo = 'F'),
	DataAdmissao DATE NOT NULL,
	DataRescisao DATE NULL,
	TipoHabilitacao VARCHAR(5) NOT NULL CHECK(TipoHabilitacao = 'A' OR TipoHabilitacao = 'B' OR TipoHabilitacao = 'AB' OR TipoHabilitacao = 'C' OR TipoHabilitacao = 'D' OR TipoHabilitacao = 'BREVET'),
	IDLogradouro INT NOT NULL,
	ValorHora MONEY NOT NULL CHECK(ValorHora > 0) ,
	Email VARCHAR(200) NOT NULL UNIQUE,
)

GO

CREATE TABLE FuncionariosTelefones
(
	IDFuncionarioTelefone INT IDENTITY PRIMARY KEY,
	IDFuncionario INT NOT NULL REFERENCES Funcionarios(IDFuncionario),
	IDOperadora SMALLINT NOT NULL REFERENCES Operadoras(IDOperadora),
	IDTipoTelefone SMALLINT NOT NULL REFERENCES TelefoneTipos(IDTelefoneTipo),
	DDD VARCHAR(5) NOT NULL,
	Numero VARCHAR(10) NOT NULL UNIQUE
)

GO

CREATE TABLE FuncionariosTreinamentos
(
	IDFuncionarioTreinamento  INT IDENTITY PRIMARY KEY,
	IDFuncionario INT NOT NULL REFERENCES Funcionarios(IDFuncionario),
	Nome VARCHAR(500) NOT NULL,
	CargaHoraria SMALLINT NOT NULL CHECK(CargaHoraria > 0),
	AnoConclusao SMALLINT NOT NULL CHECK(AnoConclusao <= YEAR(GETDATE()))
)

GO

CREATE TABLE DependenteTipos
(
	IDDependenteTipo SMALLINT IDENTITY PRIMARY KEY,
	Nome VARCHAR(30) NOT NULL
)

GO

CREATE TABLE FuncionariosDependentes
(
	IDFuncionarioDependente  INT IDENTITY PRIMARY KEY,
	IDFuncionario INT NOT NULL REFERENCES Funcionarios(IDFuncionario),
	IDDependenteTipo SMALLINT NOT NULL REFERENCES DependenteTipos(IDDependenteTipo),
	Nome VARCHAR(200) NOT NULL
)

GO

CREATE TABLE MeiosTransporte
(
	IDMeioTransporte  SMALLINT IDENTITY PRIMARY KEY,
	Nome VARCHAR(50) NOT NULL
)

GO

CREATE TABLE VeiculoTipos
(
	IDVeiculoTipo SMALLINT IDENTITY PRIMARY KEY,
	IDMeioTransporte SMALLINT NOT NULL REFERENCES MeiosTransporte(IDMeioTransporte),
	Nome VARCHAR(50) NOT NULL,
)

GO

CREATE TABLE Veiculos
(
	IDVeiculo  INT IDENTITY PRIMARY KEY,
	Nome VARCHAR(100) NOT NULL,
	Placa VARCHAR(10) NOT NULL UNIQUE,
	Chassis VARCHAR(50) NOT NULL UNIQUE,
	IDVeiculoTipo SMALLINT NOT NULL REFERENCES VeiculoTipos(IDVeiculoTipo),
	ConsumoKmLitro DECIMAL(5,2) NOT NULL,
	Observacao VARCHAR(2000) NULL
)

GO

CREATE TABLE Contratantes
(
	IDContratante INT IDENTITY PRIMARY KEY,
	CPF CHAR(11) NULL,
	CNPJ CHAR(18) NULL ,
	Nome VARCHAR(200) NOT NULL,
	Telefone1 VARCHAR(20) NOT NULL,
	Telefone2 VARCHAR(20) NULL,
	Email VARCHAR(200) NOT NULL
)

GO

CREATE TABLE ProdutoTipos
(
	IDProdutoTipo SMALLINT IDENTITY PRIMARY KEY,
	Nome VARCHAR(100) NOT NULL
)

GO

CREATE TABLE FreteTipos
(
	IDFreteTipo SMALLINT IDENTITY PRIMARY KEY,
	Nome VARCHAR(100) NOT NULL,
	Observacao VARCHAR(2000) NULL,
	Situacao CHAR(1) NOT NULL CHECK(Situacao = 'A' OR Situacao = 'I') DEFAULT('A')
)

GO

CREATE TABLE Fretes
(
	IDFrete INT IDENTITY PRIMARY KEY,
	IDContratante INT NOT NULL REFERENCES Contratantes(IDContratante),
	DataHoraPrevistoRetirada DATETIME NOT NULL,
	DataHoraEfetivaRetirada DATETIME NULL,
	IDLogradouroRetirada INT NOT NULL REFERENCES Logradouros(IDLogradouro),
	DataHoraPrevistoEntrega DATETIME NOT NULL,
	DataHoraEfeitivaEntrega DATETIME NULL,
	IDLogradouroEntrega INT NOT NULL REFERENCES Logradouros(IDLogradouro),
	Recebedor VARCHAR(100) NOT NULL,
	IDVeiculo INT NOT NULL REFERENCES Veiculos(IDVeiculo),
	IDFuncionario INT NOT NULL REFERENCES Funcionarios(IDFuncionario),
	IDFreteTipo SMALLINT NOT NULL REFERENCES FreteTipos(IDFreteTipo),
	IDProdutoTipo SMALLINT NOT NULL REFERENCES ProdutoTipos(IDProdutoTipo),
	DescricaoProduto VARCHAR(100) NOT NULL,
	Peso DECIMAL(8,2) NOT NULL,
	Altura DECIMAL(8,2) NULL,
	Largura DECIMAL(8,2) NULL,
	Profundidade DECIMAL(8,2) NULL,
	Observacao VARCHAR(2000) NULL,
	Valor MONEY NOT NULL

)

GO

CREATE TABLE OcorrenciaTipos
(
	IDOcorrenciaTipo SMALLINT IDENTITY PRIMARY KEY,
	Nome VARCHAR(100) NOT NULL,
	Situacao CHAR(1) NOT NULL CHECK(Situacao = 'A' or Situacao = 'I'),
	Observacao VARCHAR(1000) NULL
)

GO


CREATE TABLE FretesOcorrencias
(
	IDFreteOcorrencia INT IDENTITY PRIMARY KEY,
	DataHora DATETIME NOT NULL,
	IDFrete INT NOT NULL REFERENCES Fretes(IDFrete),
	IDOcorrenciaTipo SMALLINT NOT NULL REFERENCES OcorrenciaTipos(IDOcorrenciaTipo),
	Observacao VARCHAR(1000) NULL
)