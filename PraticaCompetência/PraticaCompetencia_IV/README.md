# Utilizando T-SQL DML

Utilizando o modelo de banco de dados **AULASQL**:

````sql
USE AULASQL
````



Inserindo dados na tabela **ESTADO** com ***INSERT***

```````sql

INSERT INTO ESTADO(Nome, Sigla)
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
```````

Inserindo dados na tabela CIDADE:

```sql
INSERT INTO CIDADE(Nome,ESTADO)
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
	   ('Campinas', 22),
	   ('Palmas', 23),
	   ('Araguaina', 23)	 

```

Inserindo dados na tabela FUNCIONARIO:

````sql
INSERT INTO FUNCIONARIO(Nome,Sexo,dataNascimento, CIDADE)
values('Elson Carrilho Aranha', 'M', '1992-01-24', 1),
		('Abraao Morao Correia', 'M', '1994-05-10', 19),
		('Jacinto SodreChagas', 'M', '1985-03-26', 22),
		('Kendrick Bulhosa Cruz', 'M', '1999-03-10', 15),
		('Michele Veríssimo Condorcet', 'F', '1996-10-05', 21)
````



