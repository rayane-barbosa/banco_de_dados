

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
 


-- View que exibe: o Nome do Cargo, a Sigla do Estado e a quantidade de Colaboradores por Estado



-- View que exibe: o Nome do Cargo independentemente de ter ou não funcionário e a soma total gasto para cada cargo com os funcionários


--View que exibe: o Nome do Funcionario, o Cargo, a Cidade, o Estado, e o Pais