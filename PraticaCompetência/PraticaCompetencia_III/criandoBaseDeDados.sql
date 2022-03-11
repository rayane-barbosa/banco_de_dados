/* Criando a base de dados AULASQL */ 
CREATE DATABASE AULASQL
GO

/* Criando da tabela ESTADO */ 
CREATE TABLE ESTADO
(

	CodEstado int identity primary key, /* Referenciando CodEstado como chave primaria da tabela */ 
	Nome varchar(50) not null,
	Sigla varchar(2) not null
)
/* Criando da tabela CIDADE */ 
CREATE TABLE CIDADE
( 
	Nome varchar(50) not null ,
	Codcidade int identity primary key,/* Referenciando CodCidade como chave primaria da tabela */ 
	ESTADO int not null REFERENCES ESTADO(CodEstado)	/* Referenciando CodEstado como chave estrangeira da tabela CIDADE(relacao)*/ 
)

/* Criando da tabela FUNCIONARIO */ 
CREATE TABLE FUNCIONARIO
(
	CodFuncionario int identity primary key, /* Referenciando CodFuncionario como chave primaria da tabela */ 
	Nome varchar(120) not null,
	DataNascimento date not null,
	Sexo char(1) check(Sexo = 'M' or Sexo = 'F' or Sexo = 'O') not null, 
	CIDADE int not null REFERENCES CIDADE(CodCidade) /* Referenciando CodCidade como chave estrangeira da tabela FUNCIONARIO(relacao)*/
)
/* Criando da tabela DEPENDENTE */ 
CREATE TABLE DEPENDENTE
(
	CodDependente int primary key, /* Referenciando CodDependente como chave primaria da tabela */
	Nome varchar(120) not null,
	DataNascimento date not null,
	Sexo char(1) check(Sexo = 'M' or Sexo = 'F' or Sexo = 'O') not null,
	Tipo varchar(2),
	FUNCIONARIO int not null REFERENCES FUNCIONARIO(CodFuncionario) /* Referenciando CodFuncionario como chave estrangeira da tabela DEPENDENTE(relacao)*/
)

/* Criando da tabela CARGO */ 
CREATE TABLE CARGO
(
	CodCargo int identity primary key, /* Referenciando CodCargo como chave primaria da tabela */
	Salario money not null,
	nome varchar(50)
	
)
/* Criando da tabela FUNCIONARIOCARGO */ 
CREATE TABLE FUNCIONARIOCARGO(
		DataInicio date not null,
		DataFim date not null,
		CodFuncionario int not null REFERENCES FUNCIONARIO(CodFuncionario), /* Referenciando CodFuncionario como chave estrangeira da tabela FUNCIONARIOCARGO(relacao)*/
		CodCargo int not null REFERENCES CARGO(CodCargo),   /* Referenciando CodCargo como chave estrangeira da tabela FUNCIONARIOCARGO(relacao)*/
		CodFuncionarioCargo int not null
		)


ALTER TABLE FUNCIONARIOCARGO /* Alterando tabela FUNCIONARIOCARGO*/
ADD CONSTRAINT CodFuncionarioCargo PRIMARY KEY CLUSTERED (CodFuncionario, CodCargo) /* Chave primaria composta das chaves estrangeiras CodFuncionario, CodCargo*/



