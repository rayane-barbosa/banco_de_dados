-- EX1 Crie uma View que mostra o ID e o Nome do Dependente, o Tipo de Dependência que ele possui, e o nome do funcionário que ele depende.

CREATE VIEW VW_DEPENDENTE
AS
    SELECT 
    FD.IDFuncionarioDependente, FD.Nome AS nomeDependente, DT.Nome as tipoDependencia, F.Nome as nomeFuncionario

FROM 
    FuncionariosDependentes FD
    
    INNER JOIN Funcionarios F ON F.IDFuncionario = FD.IDFuncionario
    INNER JOIN DependenteTipos DT ON DT.IDDependenteTipo =  FD.IDDependenteTipo


GO

CREATE VIEW_TELEFONESFUNCIONARIO
AS
SELECT 
