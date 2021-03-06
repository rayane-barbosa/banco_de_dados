-- Soma o valor de todas as pizzas existentes no cadastro de pizza. 

SELECT 
    SUM(Preco) as valorTotal
FROM Pizza
GO


-- Exibe a média dos preços de todas as pizzas existentes no cadastro de pizza. 

SELECT
    AVG(Preco) as mediaPrecos

FROM Pizza
GO


-- Exibe o nome de todas as pizzas independentemente se existem ingredientes. 

SELECT Pizza.Nome,
		PizzaIngrediente.Qtd
FROM Pizza LEFT JOIN PizzaIngrediente ON Pizza.IDPizza = PizzaIngrediente.IDPizza

GROUP BY Pizza.Nome, PizzaIngrediente.Qtd
GO


-- Exibe o nome e o valor da pizza, e o nome do ingrediente utilizado. 

SELECT Pizza.Nome, Pizza.Preco, Ingrediente.Nome

FROM Pizza  INNER JOIN Pizza.Ingrediente ON Pizza.IDPizza = PizzaIngrediente.IDPizza INNER JOIN Ingrediente on PizzaIngrediente.IDIngrediente = PizzaIngrediente.IDIngrediente

GROUP BY Pizza.Nome, Pizza.Preco, Ingrediente.Nome


GO


-- Crie uma consulta que exibe o Nome da Pizza e o Preço de Custo (soma de todos os ingredientes multiplicado pela qtd) de cada Pizza

 --Crie uma consulta que exibe top 2 pizzas (Nome da Pizza e Valor) mais caras do restaurante

 --Crie uma consulta que exibe o Nome do Ingrediente e a qtde de pizza que utiliza esse ingrediente

--Crie uma consulta que mostra o nome da pizza, o valor da pizza, o nome do ingrediente, a quantidade de ingrediente, a unidade de medida do ingrediente, o valor por cada unidade de medida e o valor multiplicado (valor da und de medida multiplicado pela qtde utilizada)


-- Criando views para as consultas


CREATE VIEW VW_TOTALPIZZA
AS
SELECT 
    SUM(Preco) as valorTotal
FROM Pizza

GO

CREATE VIEW VW_MEDIAPIZZA
AS

SELECT
    AVG(Preco) as mediaPrecos

FROM Pizza

GO

CREATE VIEW VW_PIZZAINGREDIENTES
AS
SELECT Pizza.Nome,
		PizzaIngrediente.Qtd
FROM Pizza LEFT JOIN PizzaIngrediente ON Pizza.IDPizza = PizzaIngrediente.IDPizza

GROUP BY Pizza.Nome, PizzaIngrediente.Qtd
GO

