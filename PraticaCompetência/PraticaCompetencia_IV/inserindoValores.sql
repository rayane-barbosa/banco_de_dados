USE aulasql

INSERT INTO Estado(Nome, Sigla)
values('Acre', 'AC'),
	  ('Alagoas', 'AL'),
	  ('Amapa', 'AM'),
	  ('Amazonas', 'AM'),
	  ('Bahia', 'BA'),
	  ('Ceara', 'CE'),
	  ('Espirito Santo', 'ES'),
	  ('Goias', 'GO'),
	  ('Maranhao', 'MA'),
	  ('Mato Grosso', 'MT'),
	  ('Mato Grosso do Sul', 'MS'),
	  ('Minas Gerais', 'MG'),
	  ('Para', 'PR'),
	  ('Piaui', 'PI'),
	  ('Rio de Janeiro', 'RJ'),
	  ('Rio Grande do Norte', 'RN'),
	  ('Rio Grande do Sul', 'RS'),	  
	  ('Rondonia', 'RO'),
	  ('Roraima', 'RR'),
	  ('Santa Catarina', 'SC'),
	  ('Sao Paulo', 'SP'),
	  ('Sergipe', 'SE'),
	  ('Tocantins', 'TO'),
	  ('Distrito Federal', 'DF')


INSERT INTO Cidade(Nome,CodEstado)
values ('Rio Branco',1),
	   ('Cruzeiro do Sul', 1),
	   ('Maceio', 2),
	   ('Estrela de Alagoas', 2),
	   ('Macapa', 3),
	   ('Santana', 3),
	   ('Manaus', 4),
	   ('Coari', 4),
	   ('Salvador', 5),
	   ('Ilheus', 5),
	   ('Fortaleza', 6),
	   ('Sobral', 6),
	   ('Vitoria', 7),
	   ('Guarapari', 7),
	   ('Goias', 8),
	   ('Goiania', 8),
	   ('Sao Luis', 9),
	   ('Acailandia', 9),
	   ('Cuiaba', 10),
	   ('Sinop', 10),
	   ('Campo Grande', 11),
	   ('Dourados', 11),
	   ('Belo Horizonte', 12),
	   ('Sao Tome das Letras', 12),
	   ('Belem', 13),
	   ('Ananindeua', 13),
	   ('Teresina', 14),
	   ('Parnaiba', 14),
	   ('Rio de Janeiro', 15),
	   ('Niteroi', 15),
	   ('Natal', 16),
	   ('Mossoro', 16),
	   ('Porto Alegre', 17),
	   ('Rio Grande', 17),
	   ('Porto velho', 18),
	   ('Vilhena', 18),
	   ('Boa Vista', 19),
	   ('Alto Alegre', 19),
	   ('Florianopolis', 20),
	   ('Blumenal', 20),
	   ('Sao Paulo', 21),
	   ('Campinas', 21),
	   ('Aracaju',22),
	   ('Lagarto', 22)
	   ('Palmas', 23),
	   ('Araguaina', 23)	 

INSERT INTO Funcionario(Nome,Sexo,dataNascimento, CodCidade)
values('Elson Carrilho Aranha', 'M', '1992-01-24', 1),
		('Abraao Morao Correia', 'M', '1994-05-10', 19),
		('Jacinto SodreChagas', 'M', '1985-03-26', 22),
		('Kendrick Bulhosa Cruz', 'M', '1999-03-10', 15),
		('Michele Verissimo Condorcet', 'F', '1996-10-05', 21)


INSERT INTO Cargo(Nome, Salario
values('TechLead Pl', '8500'), /*1*/
	  ('Dev BackEnd Pl', '7000'), /*2*/
	  ('Dev BackEnd Jr', '4500'),/*3*/
	  ('Dev FrontEnd Pl', '6500'),/*4*/
	  ('Dev FrontEnd Jr', '3000'),/*5*/
	  ('Dev FullStack Pl', '8000'),/*6*/
	  ('Dev FullStack Jr', '5000'),/*7*/
	  ('UI/UX Pl', '6700'),/*8*/
	  ('UI/UX Jr', '3100'),/*9*/
	  ('Analista de Dados Pl', '9000'), /*10*/
	  ('Analista de Dados Jr', '3250')/*11*/

INSERT INTO Dependente(CodFuncionario,Tipo, Nome, Sexo, DataNascimento)
values ('2', 'Filho', 'Kelvin Morao Correia', 'M', '2020-07-19'),
	   ('2', 'Filho', 'Ana Clara Nunes Lameirinhas Correia
', 'F', '2017-10-15'),
		('3', '	Filho', 'Matias Chagas', 'M', '2010-11-15'),
		('5','Conjuge', 'Andrea Sa','F', '1990-09-27')


INSERT INTO FuncionarioCargo(CodFuncionario, CodCargo, DataInicio, DataFim)
values('1', '5', '2012-03-01','2018-06-10'),
	   ('2','2', '2017-09-20', '2021-03-09'),	   
	    ('3','5', '2015-10-09', '2020-06-10' ),		
		('5','6', '2019-03-20', '2021-10-07' )
		
		

INSERT INTO FuncionarioCargo (CodFuncionario, CodCargo, DataInicio)
values('1', '8', '2018-06-13'),
	  ('2','1', '2021-03-10' ),
	  ('3','7','2020-06-15'),
	  ('4','3', '2022-01-10'),
	  ('5','10', '2021-10-10' )
	  