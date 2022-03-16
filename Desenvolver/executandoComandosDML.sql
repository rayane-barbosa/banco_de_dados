/*Exercicios Banco de Dados 1*/

/*Usando DDL*/

/*Ex 1: É solicitado a criação de 3 tabelas a partir de um modelo/*

/*Para atender os requisitos dos exercícios propostos é criada uma base de dados que eu vou chamar de paises/*

CREATE DATABASE paises

/*Defino para o SQL que irei realizar as operações a seguir no banco de dados paises*/

USE paises

/*Tabela Pais*/
CREATE TABLE Pais
(
	IDPais int identity primary key,
  	NomePais varchar(80),
	SiglaPais char(2),
	

)

/*Tabela Estado*/
CREATE TABLE Estado
(	
	IDEstado int identity primary key,
	NomeEstado varchar(50),
	SiglaEstado char(2),
	IDPais int
)
/*Tabela Cidade*/ 
CREATE TABLE Cidade
(
	IDCidade int identity primary key,
	NomeCidade varchar(120),
	IDEstado int
		
)

/*Usando DML*/
/*Ex 2:  */
INSERT TO TABLE Pais(NomePais , SiglaPais)
values('Brasil', 'BR')

/*Ex: 3 */

INSERT INTO Estado(NomeEstado, SiglaEstado)
values('Acre', 'AC'), /* 1*/
	  ('Alagoas', 'AL'), /*2 */
	  ('Amapa', 'AM'),/* 3*/
	  ('Amazonas', 'AM'),/* 4*/
	  ('Bahia', 'BA'),/* 5*/
	  ('Ceara', 'CE'),/* 6*/
	  ('Espirito Santo', 'ES'),/*7 */
	  ('Goias', 'GO'),/* 8*/
	  ('Maranhao', 'MA'),/*9 */
	  ('Mato Grosso', 'MT'),/*10 */
	  ('Mato Grosso do Sul', 'MS'),/*11 */
	  ('Minas Gerais', 'MG'),/*12 */
	  ('Para', 'PA'),/*13 */
	  ('Paraiba','PB'),/* 14*/
	  ('Parana', 'PR'),/*15 */
	  ('Pernambuco', 'PE')/*16 */
	  ('Piaui', 'PI'),/* 17*/
	  ('Rio de Janeiro', 'RJ'),/*18 */
	  ('Rio Grande do Norte', 'RN'),/*19 */
	  ('Rio Grande do Sul', 'RS'),	  /*20 */
	  ('Rondonia', 'RO'),/*21 */
	  ('Roraima', 'RR'),/*22 */
	  ('Santa Catarina', 'SC'),/*23 */
	  ('Sao Paulo', 'SP'),/*24 */
	  ('Sergipe', 'SE'),/*25 */
	  ('Tocantins', 'TO'),/*26 */
	  ('Distrito Federal', 'DF')/* 27*/


/*Ex: 4 */

INSERT TO Cidade(NomeCidade, IDEstado)
values('Maceio', 2),
	   ('Estrela de Alagoas', 2),
	   ('Anadia',2),
	   ('Macapa', 3),
	   ('Santana', 3),
	   ('Itaubal', 3),
	   ('Manaus', 4),
	   ('Coari', 4),
	   (4),
	   ('Salvador', 5),
	   ('Ilheus', 5),
	   (5),
	   ('Fortaleza', 6),
	   ('Sobral', 6),
	   (6),
	   ('Vitoria', 7),
	   ('Guarapari', 7),
	   (7),
	   ('Goias', 8),
	   ('Goiania', 8),
	   (8),
	   ('Sao Luis', 9),
	   ('Acailandia', 9),
	   (9),
	   ('Cuiaba', 10),
	   ('Sinop', 10),
	   (10),
	   ('Campo Grande', 11),
	   ('Dourados', 11),
	   (11),
	   ('Belo Horizonte', 12),
	   ('Sao Tome das Letras', 12),
	   (12),
	   ('Belem', 13),
	   ('Ananindeua', 13),
	   (13),
	   ('Teresina', 14),
	   ('Parnaiba', 14),
	   (14),
	   ('Rio de Janeiro', 15),
	   ('Niteroi', 15),
	   (15),
	   ('Natal', 16),
	   ('Mossoro', 16),
	   (16),
	   ('Porto Alegre', 17),
	   ('Rio Grande', 17),
	   (17),
	   ('Porto velho', 18),
	   ('Vilhena', 18),
	   (18),
	   ('Boa Vista', 19),
	   ('Alto Alegre', 19),
	   (19),
	   ('Florianopolis', 20),
	   ('Blumenal', 20),
	   (20),
