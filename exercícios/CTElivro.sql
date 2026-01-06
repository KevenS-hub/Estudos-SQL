-- Listando os produtos com valor médio maior ou acima de 300

WITH Produto_valores AS(
    SELECT IdProduto t1, 
            AVG(VlProduto) AS avarege_value
    FROM transacao_produto t2
    GROUP BY IdProduto 
)

SELECT *
FROM Produto_valores 
WHERE avarege_value >= 300
ORDER BY avarege_value DESC;