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
     DataNascimento DATE,
     Sexo CHAR(1) CHECK(Sexo = 'M' OR Sexo = 'F' OR Sexo = 'O') NOT NULL,
     Pais INT NOT NULL,
	 CONSTRAINT FK_Pais FOREIGN KEY(Pais) REFERENCES Pais(CodigoPais)

)

/* Cria a tabela Editora*/
CREATE TABLE Editora
(
    CodigoEditora INT IDENTITY PRIMARY KEY,
     Nome VARCHAR(50) NOT NULL, 
     EmailContato VARCHAR(100),
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
    CodigoLivro INT IDENTITY PRIMARY KEY NOT NULL ,
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




/* Populando a tabela Pais */
INSERT INTO Pais(Nome, Sigla, Nacionalidade)
values('Estados Unidos da America' ,'US','Estadunidense'),
      ('Brasil','BR','Brasileira'),
      ('India','IN','Indiana'),
      ('Reino Unido','UK','Reino Unidense'),
      ('Canada','CA','Canadense'),
      ('Israel','IL','Israelense'),
      ('Franca','FR','Francesa')


/* Populando a tabela Autor */
INSERT INTO Autor(Nome, DataNascimento, Sexo, Pais) Values ('Napoleon Hill','1883-10-26','M',1)
INSERT INTO Autor(Nome, DataNascimento, Sexo, Pais) Values('Mark Manson','1984-03-09','M',1)
INSERT INTO Autor(Nome, DataNascimento, Sexo, Pais) Values('Stephenie Meyer','1973-12-24','F',1)
INSERT INTO Autor(Nome,Sexo, Pais) Values ('Charlie Donlea','M',1)
INSERT INTO Autor(Nome,DataNascimento,Sexo, Pais) Values ('George Orwell','1903-01-21','M',3)
INSERT INTO Autor(Nome,Sexo, Pais) Values( 'C. J. Tudor','F',4)
INSERT INTO Autor(Nome,DataNascimento,Sexo, Pais) Values('Margaret Atwood','1939-11-18','F',5)
INSERT INTO Autor(Nome,DataNascimento,Sexo, Pais) Values('Clarissa Pinkola Estes','1945-01-27','F',1)
INSERT INTO Autor(Nome,DataNascimento,Sexo, Pais) Values('Carol Dweck','1946-10-17','F',1)
INSERT INTO Autor(Nome,DataNascimento,Sexo, Pais) Values('Yuval Harari','1976-02-24','M',6)
INSERT INTO Autor(Nome,DataNascimento,Sexo, Pais) Values('Djamila Ribeiro','1980-08-01','F',2)
INSERT INTO Autor(Nome,Sexo, Pais) Values('Elainne Ourives','F',2)
INSERT INTO Autor(Nome,Sexo, Pais) Values('Charles Duhigg','M',1)
INSERT INTO Autor(Nome,DataNascimento,Sexo, Pais) Values('Alex Hirsch','1985-06-18','M',1)
INSERT INTO Autor(Nome,DataNascimento,Sexo, Pais) Values('Antoine Saint-Exupery','1900-07-29','M',7)
INSERT INTO Autor(Nome,DataNascimento,Sexo, Pais) Values('Neil Gaiman','1960-11-10','M',4)
INSERT INTO Autor(Nome,DataNascimento,Sexo, Pais) Values('Thiago Nigro','1990-10-07','M',2)
INSERT INTO Autor(Nome,DataNascimento,Sexo, Pais) Values('Paulo Vieira','1968-08-30','M',2)
INSERT INTO Autor(Nome,Sexo, Pais) Values('Greg McKeown','M',4)
INSERT INTO Autor(Nome,DataNascimento,Sexo, Pais) Values('Benjamin Graham','1894-05-09','M',4)






/* Populando a tabela Categoria */
INSERT INTO Categoria(CodigoCategoria, Nome)
    Values(01,'Autoajuda'),
          (02,'Negocios'),
          (03,'Ficcao'),
          (04,'Nao-Ficcao'),
          (05,'Infanto-Juvenil')



/* Populando a tabela Editora */

INSERT INTO Editora(Nome, EmailContato) Values ('Citadel','contato@citadel-brasil.com')
INSERT INTO Editora(Nome, EmailContato)VALUES ('Intrinseca','contato@intrinseca.com.br')
INSERT INTO Editora(Nome, EmailContato) VALUES('Faro Editorial','contato@faroeditorial.com.br')
INSERT INTO Editora(Nome) VALUES('Companhia das Letras')
INSERT INTO Editora(Nome, EmailContato) VALUES('Rocco','rocco@rocco.com.br')
INSERT INTO Editora(Nome) VALUES('Objetiva')
INSERT INTO Editora(Nome, EmailContato) VALUES('L&PM','contato@lpm.com.br')
INSERT INTO Editora(Nome, EmailContato) VALUES ('Gente','sac@editoragente.com.br')
INSERT INTO Editora(Nome, EmailContato) VALUES ('Universo dos Livros','relacionamento@universodoslivros.com.br')
INSERT INTO Editora(Nome) VALUES ('HarperCollins')
INSERT INTO Editora(Nome, EmailContato) VALUES ('Sextante','atendimento@sextante.com.br')




/* Populando a tabela Livro */

INSERT INTO Livro(Titulo,Categoria,QtdPaginas,ISBN /*, CodigoEditora*/) VALUES ('Mais esperto que o diabo',01,200,'978-85-68014-00-4'/*,1*/)
INSERT INTO Livro(Titulo,Categoria,DataPublicacao,QtdPaginas,ISBN /*, CodigoEditora*/) VALUES ('A sutil arte de ligar o foda-se',01, '2016-09-13',224,'978-85-51002-49-0'/*,2*/)
INSERT INTO Livro(Titulo,Categoria,DataPublicacao,QtdPaginas,ISBN /*, CodigoEditora*/) VALUES ('Sol da meia-noite',03,'2020-08-04',536,'978-65-55600-29-2'/*,2*/)
INSERT INTO Livro(Titulo,Categoria,QtdPaginas,ISBN /*, CodigoEditora*/) VALUES ('A garota do lago',03,296,'978-85-62409-88-2'/*,3*/)
INSERT INTO Livro(Titulo,Categoria,DataPublicacao,QtdPaginas,ISBN /*, CodigoEditora*/) VALUES('A revolução dos bichos',03,'1945-08-17',156,'978-85-35909-55-5'/*,4*/)
INSERT INTO Livro(Titulo,Categoria,DataPublicacao,QtdPaginas,ISBN /*, CodigoEditora*/) VALUES('1984',03,'1949-06-08',416,'978-85-35914-84-9'/*,4*/)
INSERT INTO Livro(Titulo,Categoria,QtdPaginas,ISBN /*, CodigoEditora*/) VALUES('O homem de giz',03,272,'978-85-51002-93-3'/*,2*/)
INSERT INTO Livro(Titulo,Categoria,QtdPaginas,ISBN /*, CodigoEditora*/) VALUES('O conto da Aia',03,368,'978-85-32520-66-1'/*,5*/)
INSERT INTO Livro(Titulo,Categoria,QtdPaginas,ISBN /*, CodigoEditora*/) VALUES ('Mulheres que correm com os lobos',04,576,'978-85-32529-78-7'/*,5*/)
INSERT INTO Livro(Titulo,Categoria,QtdPaginas,ISBN /*, CodigoEditora*/) VALUES ('Mindset',04,328,'978-85-47000-24-0'/*,6*/)
INSERT INTO Livro(Titulo,Categoria,DataPublicacao,QtdPaginas,ISBN /*, CodigoEditora*/) VALUES ('21 licoes para o seculo 21',04,'2018-10-15',432,'978-85-35930-91-7'/*,4*/)
INSERT INTO Livro (Titulo,Categoria,QtdPaginas,ISBN /*, CodigoEditora*/) VALUES ('Sapiens',04,464,'978-85-25432-18-6'/*,7*/)
INSERT INTO Livro(Titulo,Categoria,DataPublicacao,QtdPaginas,ISBN /*, CodigoEditora*/) VALUES ('Pequeno manual antirracista',04,'2019-11-06',136,'978-85-35932-87-4'/*,4*/)
INSERT INTO Livro(Titulo,Categoria,DataPublicacao,QtdPaginas,ISBN /*, CodigoEditora*/) VALUES ('DNA da cocriação',01,'2020-07-08',288,'978-85-45203-86-5'/*,8*/)
INSERT INTO Livro(Titulo,Categoria,DataPublicacao,QtdPaginas,ISBN /*, CodigoEditora*/) VALUES ('O poder do habito',01,'2012-02-28',408,'978-85-39004-11-9'/*,6*/)
INSERT INTO Livro(Titulo,Categoria,DataPublicacao,QtdPaginas,ISBN /*, CodigoEditora*/) VALUES ('O diario perdido de Gravity Falls',05,'2016-07-26',288, '978-85-50303-62-8'/*,9*/)
INSERT INTO Livro(Titulo,Categoria,DataPublicacao,QtdPaginas,ISBN /*, CodigoEditora*/) VALUES ('O pequeno principe',05,'1943-04-06',96,'978-85-95081-51-2'/*,10*/)
INSERT INTO Livro(Titulo,Categoria,QtdPaginas,ISBN /*, CodigoEditora*/) VALUES ('Coraline',05,224,'978-85-51006-75-7'/*,2*/)
INSERT INTO Livro(Titulo,Categoria,DataPublicacao,QtdPaginas,ISBN /*, CodigoEditora*/) VALUES ('Do mil ao milhão',02,'2018-11-10',192,'978-85-95083-27-1'/*,10*/)
INSERT INTO Livro(Titulo,Categoria,DataPublicacao,QtdPaginas,ISBN /*, CodigoEditora*/) VALUES ('O poder da autorresponsabilidade',02,'2018-01-25',160,'978-85-45202-21-9'/*,8*/)
INSERT INTO Livro(Titulo,Categoria,DataPublicacao,QtdPaginas,ISBN /*, CodigoEditora*/) VALUES ('Essencialismo',02,'2014-04-15',272,'978-85-43102-14-6'/*,11*/)
INSERT INTO Livro(Titulo,Categoria,QtdPaginas,ISBN /*, CodigoEditora*/) VALUES ('O investidor inteligente',02,672, '978-85-95080-80-5'/*,10*/)



/* Populando a tabela LivroAutor */

INSERT INTO LivroAutor(Livro, Autor)
VALUES (1,1),
       (2,2),
       (3,3),
       (4,4),
       (5,5),
       (6,5),
       (7,6),
       (8,7),
       (9,8),
       (10,9),
       (11,10),
       (12,10),
       (13,11),
       (14,12),
       (15,13),
       (16,14),
       (17,15),
       (18,16),
       (19,17),
       (20,18),
       (21,19),
       (22,20)


/**************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************       C  O  N  S  U  L  T  A  S     **************************** *************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************/


-- Exibe o Título do livro, o ISBN e a quantidade de pag de forma ordenada decrescente 

SELECT Titulo, ISBN, QtdPaginas

FROM Livro 

ORDER BY QtdPaginas


-- Exibe os autores de código par que o código seja menor que 20

SELECT Nome, CodigoAutor

FROM Autor

WHERE CodigoAutor%2 = 0

-- Exibe os Livros publicados entre 2019 e 2020

SELECT Titulo,
  DataPublicacao,
  ISBN
FROM Livro
WHERE DataPublicacao like '%2019%' 
	  OR DataPublicacao like'%2020%'
	  



-- Exibe o código da categoria e quantidade de livros que cada categoria possui ordenados por quantidade de livros

select CodigoCategoria, 
    count(Categoria) as quantLivro
from Livro li, Categoria c
where li.Categoria = c.CodigoCategoria
group by CodigoCategoria

-- Exibe o top 5 livros com maior quantidade de páginas ordenado pela quantidade de páginas

SELECT TOP 5 *
FROM Livro
ORDER BY QtdPaginas desc


