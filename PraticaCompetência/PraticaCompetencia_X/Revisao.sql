CREATE DATABASE BDRevisao
GO

USE BDRevisao

GO

CREATE TABLE Departamento
(

    IDDepartamento INT IDENTITY PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Ativo CHAR(1) NOT NULL,
    Observacao VARCHAR(1000)
)

CREATE TABLE Funcionario
(
    IDFuncionario INT IDENTITY PRIMARY KEY,
    Nome vachar(50) NOT NULL,
    DataNascimento DATE NOT NULL,
    CPF CHAR(11) NOT NULL,
    Sexo CHAR(1) CHECK (Sexo = 'M' OR Sexo = 'F' OR Sexo = 'O')NOT NULL,
    IDDepartamento INT NOT NULL REFERENCES Departamento(IDDepartamento),
    Salario MONEY NOT NULL
)

CREATE TABLE Dependente
(
    IDDependente INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    IDFuncionario INT NOT NULL REFERENCES Funcionario(IDFuncionario)
)

