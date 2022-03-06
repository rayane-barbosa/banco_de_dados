Criando a nossa base de dados AULASQL:

``````sql

CREATE DATABASE AULASQL
GO
``````

Após a execução do comando acima é necessário selecionar a base de dados para criação das tabelas.

A base de dados que será criada a partir do modelo lógico apresentado conta com as tabelas: Estado, Cidade, Funcionário, Dependente e Cargo, que são tabelas fortes* e a tabela FuncionarioCargo que é uma tabela fraca. As mesmas possuem atributos identificadores e as relações entre tabelas é realizada através de ***REFERENCES***.

**Criação das tabelas:**

Tabela Estado:

``````sql
CREATE TABLE ESTADO
(

	CodEstado int identity primary key, /* Referenciando CodEstado como chave primaria da tabela */ 
	Nome varchar(50) not null,
	Sigla varchar(2) not null
)
``````

Tabela Cidade:

````sql
CREATE TABLE CIDADE
( 
	Nome varchar(50) not null ,
	Codcidade int identity primary key,/* Referenciando CodCidade como chave primaria da tabela */ 
	ESTADO int not null REFERENCES ESTADO(CodEstado)	/* Referenciando CodEstado como chave estrangeira da tabela CIDADE(relacao)*/ 
)
````

Tabela Funcionario:

````sql
CREATE TABLE FUNCIONARIO
(
	CodFuncionario int identity primary key, /* Referenciando CodFuncionario como chave primaria da tabela */ 
	Nome varchar(120) not null,
	DataNascimento date not null,
	Sexo char(1) check(Sexo = 'M' or Sexo = 'F' or Sexo = 'O') not null, 
	CIDADE int not null REFERENCES CIDADE(CodCidade) /* Referenciando CodCidade como chave estrangeira da tabela FUNCIONARIO(relacao)*/
)
````

Tabela Dependente:

````sql
CREATE TABLE DEPENDENTE
(
	CodDependente int primary key, /* Referenciando CodDependente como chave primaria da tabela */
	Nome varchar(120) not null,
	DataNascimento date not null,
	Sexo char(1) check(Sexo = 'M' or Sexo = 'F' or Sexo = 'O') not null,
	Tipo varchar(2),
	FUNCIONARIO int not null REFERENCES FUNCIONARIO(CodFuncionario) /* Referenciando CodFuncionario como chave estrangeira da tabela DEPENDENTE(relacao)*/
)
````

Tabela Cargo:

````sql
CREATE TABLE CARGO
(
	CodCargo int identity primary key, /* Referenciando CodCargo como chave primaria da tabela */
	Salario money not null,
	nome varchar(50)
	
)
````

Tabela FunionarioCargo:

````sql
CREATE TABLE FUNCIONARIOCARGO(
		DataInicio date not null,
		DataFim date not null,
		CodFuncionario int not null REFERENCES FUNCIONARIO(CodFuncionario), /* Referenciando CodFuncionario como chave estrangeira da tabela FUNCIONARIOCARGO(relacao)*/
		CodCargo int not null REFERENCES CARGO(CodCargo),   /* Referenciando CodCargo como chave estrangeira da tabela FUNCIONARIOCARGO(relacao)*/
		CodFuncionarioCargo int not null
		)
````

Para a tabela FuncionarioCargo foram utilizadas 2 ***REFERENCES***, ou seja, ela é fruto do relacionamento de 2 tabelas. A ***PRIMARY KEY*** é nesse caso uma chave composta por duas ***FOREING KEYS***. 

Nesse caso precisamos que a ***PRIMARY KEY*** receba os valores e identifique CodFuncionario como atributo identificador composto.

Para isso precisaremos alterar a tabela como ***ALTER***

````sql
ALTER TABLE FUNCIONARIOCARGO /* Alterando tabela FUNCIONARIOCARGO*/
ADD CONSTRAINT CodFuncionarioCargo PRIMARY KEY CLUSTERED (CodFuncionario, CodCargo) /* Chave primaria composta das chaves estrangeiras CodFuncionario, CodCargo*/
````



Visualizando as relações utilizando ***POWER BI***:

![Visualizando os dados](https://github.com/rayane-barbosa/banco_de_dados/blob/main/PraticaCompet%C3%AAncia/PraticaCompetencia_III/image/relacoestabelas.PNG)