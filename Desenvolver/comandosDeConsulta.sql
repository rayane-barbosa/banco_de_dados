/********Exercicio 1**********/
--Exibe o ID do Funcionário, o Nome do Funcionário, o ID do Cargo , o Nome do Cargo

SELECT IDFuncionario, NomeFuncionario, c.IDCargo, NomeCargo
FROM Funcionario f , Cargo c
WHERE f.IDCargo = c.IDCargo
 

/********Exercicio 2**********/
-- Exibe o ID da Cidade, o Nome da Cidade, a Sigla do Estado, e o Nome do País

SELECT IDCidade, NomeCidade, e.IDEstado, p.NomePais
FROM Cidade Ci,Estado e, Pais p
WHERE Ci.IDEstado = e.IDEstado AND e.IDPais = p.IDPais

/********Exercicio 3**********/
--Exibe o Nome do Cargo, e a quantidade de funcionário que cada cargo possui


SELECT 
	NomeCargo,
    count(NomeCargo) as contagemCargo

From Cargo

GROUP BY
NomeCargo

/********Exercicio 4**********/

-- Exibe o Nome do Estado, a Sigla do Estado, e a quantidade de cidades que cada estado possui

SELECT 
E.NomeEstado, E.SiglaEstado, 
    count(c.IDCidade) as qtdCidadeEstado

FROM Estado E, Cidade Ci

WHERE Ci.IDEstado = E.IDEstado

GROUP BY
E.NomeEstado, E.SiglaEstado

/********Exercicio 5**********/
--Exibe o Nome do cargo, nome do funcionário

SELECT 
    c.NomeCargo, f.NomeFuncionario

From Cargo c, Funcionario f 

WHERE c.IDCargo = f.IDCargo

/********Exercicio 6**********/
--Exibe o Nome do Funcionário, o Cargo desde que o funcionário pertença ao estado de São Paulo.


SELECT
    F.NomeFuncionario, C.NomeCargo, E.NomeEstado
From Funcionario F, Cargo C, Estado E, Cidade Ci
Where C.IDCargo = F.IDCargo 
    and F.IDCidadeOrigem = Ci.IDCidade 
    and Ci.IDEstado = E.IDEstado 
    and E.SiglaEstado = 'SP'


/********Exercicio 7**********/
--Exibe a quantidade de funcionários para cada Nome de estado.

SELECT 
    E.NomeEstado, 
    count(F.IDFuncionario) as totalFuncionariosEstado

FROM Estado E, Funcionario F, Cidade Ci 

WHERE 
    F.IDCidadeOrigem = Ci.IDCidade 
    and Ci.IDEstado = E.IDEstado

GROUP BY
NomeEstado

/********Exercicio 8**********/
--Exibe o ID do Funcionário, o Nome do Funcionário, o Nome do Cargo, o Salário, o Nome da Cidade, o Nome do Estado, a Sigla do Estado, e o Nome do País

SELECT 
    F.IDFuncionario, F.NomeFuncionario, C.NomeCargo, C.Salario, Ci.NomeCidade, E.NomeEstado, E.SiglaEstado, P.NomePais

    FROM Funcionario F, Cargo C, Cidade Ci, Estado E, Pais P

WHERE
    F.IDCargo = C.IDCargo
    and F.IDCidadeOrigem = Ci.IDCidade
    and Ci.IDEstado = E.IDEstado
    and E.IDPais = P.IDPais
  





