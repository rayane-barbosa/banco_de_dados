/********************************************************************************************************************************************************************************
                    C R I A C A O   D O  B A N C O  D E  D A D O S     B D E D I T O R A                  
********************************************************************************************************************************************************************************/

USE MASTER
-- Usa master. Caso rode o script usando outro banco
GO

/* Cria o banco de dados BDEditora*/
CREATE DATABASE BDEditora

GO

/*Acessando o banco de dados BDEditora*/
USE BDEditora

GO

/* Cria a tabela Pais*/
CREATE TABLE Pais
(
    CodigoPais INT IDENTITY PRIMARY KEY,
    Nome varchar(50) NOT NULL,
    Sigla char(2) NOT NULL,
    Nacionalidade varchar(50) NOT NULL,
    CONSTRAINT UNQ_Pais_Sigla UNIQUE(Sigla)
    
)

/* Cria a tabela Autor*/
CREATE TABLE Autor
(
     CodigoAutor INT IDENTITY PRIMARY KEY,
     Nome VARCHAR(50) NOT NULL, 
     DataNascimento DATE NOT NULL,
     Sexo CHAR(1) CHECK(Sexo = 'M' OR Sexo = 'F' OR Sexo = 'O') NOT NULL,
     Pais INT NOT NULL,
	 CONSTRAINT FK_Pais FOREIGN KEY(Pais) REFERENCES Pais(CodigoPais)

)

/* Cria a tabela Editora*/
CREATE TABLE Editora
(
    CodigoEditora INT IDENTITY PRIMARY KEY,
     Nome VARCHAR(50) NOT NULL, 
     EmailContato NVARCHAR,
     Situacao CHAR(1) DEFAULT('A'),
     CONSTRAINT CK_Editora_Situacao CHECK(Situacao = 'A' OR Situacao = 'I')
    
)
GO

/* Cria a tabela Categoria*/
CREATE TABLE Categoria
(
    CodigoCategoria SMALLINT PRIMARY KEY NOT NULL, 
    Nome VARCHAR(20) NOT NULL

)

/* Cria a tabela Livro*/
CREATE TABLE Livro
(
    CodigoLivro INT PRIMARY KEY NOT NULL ,
    Titulo VARCHAR(100) NOT NULL,
    Categoria SMALLINT NOT NULL,
    DataPublicacao DATE,
    QtdPaginas INT NOT NULL,
    ISBN VARCHAR(20) NOT NULL,
    CONSTRAINT FK_Livro_Categoria FOREIGN KEY(Categoria) REFERENCES Categoria(CodigoCategoria)
)

/* Cria a tabela LivroAutor*/
CREATE TABLE LivroAutor
(
    Livro INT NOT NULL,
    Autor INT NOT NULL,
    CONSTRAINT FK_Cod_Livro FOREIGN KEY(Livro) REFERENCES Livro(CodigoLivro),
    CONSTRAINT FK_Cod_Autor FOREIGN KEY(Autor) REFERENCES Autor(CodigoAutor)
    
	)
 GO   

ALTER TABLE LivroAutor
ADD CONSTRAINT CodigoLivroAutor PRIMARY KEY CLUSTERED (Livro, Autor) 
GO


/* Populando a tabela Categoria */
INSERTO INTO Categoria(CodigoCategoria, Nome)
    Values(01,'Autoajuda'),
        (02,'Negocios'),
        (03,'Ficcao'),
        (04,'Nao-Ficcao'),
        (05,'Infanto-Juvenil')
