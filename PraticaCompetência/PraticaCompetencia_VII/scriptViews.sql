

 --  View que exibe: o Nome e a Sigla de cada estado e a quantidade de cidades que cada estado possui.

CREATE VIEW VW_CidadesPorEstado

AS

SELECT 
E.NomeEstado, E.SiglaEstado, 
    count(c.IDCidade) as qtdCidadeEstado

FROM Estado E, Cidade Ci

WHERE Ci.IDEstado = E.IDEstado

GROUP BY
E.NomeEstado, E.SiglaEstado
GO

-- View que exibe: o Nome da Cidade, a Sigla do Estado e o Nome do Pais


CREATE VIEW VW_CidadeEstadoPais
AS

SELECT 
    Ci.NomeCidade,E.SiglaEstado, P.NomePais

    FROM Cidade Ci, Estado E, Pais P

WHERE
    Ci.IDEstado = E.IDEstado
    and E.IDPais = P.IDPais

GO

-- View que exibe: o Código e o Nome do Cargo e o nome do funcionário independentemente de haver funcionário no cargo ou não.

CREATE VIEW VW_CARGOS
AS

SELECT c.IDCargo, c.NomeCargo, f.NomeFuncionario

FROM Funcionario f , Cargo c
WHERE f.IDCargo = c.IDCargo 

ORDER BY c.IDCargo
GO 


-- View que exibe: o Nome do Cargo, a Sigla do Estado e a quantidade de Colaboradores por Estado

CREATE VIEW VW_CARGOESTADO
AS

SELECT c.NomeCargo, e.SiglaEstado,
    count(f.IDFuncionario) as quantidadeFuncionarioEstado

FROM Cargo c, Estado e, Funcionario f, Cidade ci
 
WHERE f.IDCargo = c.IDCargo
and   f.IDCidadeOrigem = ci.IDCidade
and ci.IDEstado = e.IDEstado

GROUP BY 
c.NomeCargo, e.SiglaEstado
GO



-- View que exibe: o Nome do Cargo independentemente de ter ou não funcionário e a soma total gasto para cada cargo com os funcionários


CREATE VIEW VW_GASTOSCARGO
AS

SELECT c.NomeCargo,
    sum(c.Salario) as totalGastosCargo

FROM Cargo c, Funcionario f

WHERE c.IDCargo = c.IDCargo

GROUP BY c.NomeCargo
GO


--View que exibe: o Nome do Funcionario, o Cargo, a Cidade, o Estado, e o Pais

CREATE VIEW VW_DADOSFUNCIONARIO
AS

SELECT f.NomeFuncionario, c.NomeCargo, ci.NomeCidade, e.NomeEstado, p.NomePais

FROM Funcionario f, Cargo c, Cidade ci, Estado e, Pais p 

WHERE f.IDCargo = c.IDCargo
and f.IDCidadeOrigem = ci.IDCidade
and ci.IDEstado = e.IDEstado
and e.IDPais = p.IDPais