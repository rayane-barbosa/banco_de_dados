CREATE DATABASE AULASQL
GO


CREATE TABLE ESTADO
(

	CodEstado int identity primary key,
	Nome varchar(50) not null,
	Sigla varchar(2) not null
)

CREATE TABLE CIDADE
( 
	Nome varchar(50) not null ,
	Codcidade int identity primary key,
	ESTADO int not null REFERENCES ESTADO(CodEstado)	
)

CREATE TABLE FUNCIONARIO
(
	CodFuncionario int identity primary key,
	Nome varchar(120) not null,
	DataNascimento date not null,
	Sexo char(1) check(Sexo = 'M' or Sexo = 'F' or Sexo = 'O') not null,
	CIDADE int not null REFERENCES CIDADE(CodCidade)
)

CREATE TABLE DEPENDENTE
(
	CodDependente int primary key,
	Nome varchar(120) not null,
	DataNascimento date not null,
	Sexo char(1) check(Sexo = 'M' or Sexo = 'F' or Sexo = 'O') not null
	Tipo varchar(2),
	FUNCIONARIO int not null REFERENCES FUNCIONARIO(CodFuncionario)
)


CREATE TABLE CARGO
(
	CodCargo int identity primary key,
	Salario money not null,
	FUNCIONARIO int not null REFERENCES FUNCIONARIO(CodFuncionario)
)


