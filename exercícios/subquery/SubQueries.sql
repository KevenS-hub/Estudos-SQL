
-- SELECT *
-- FROM produtos;

SELECT * 
FROM transacao_produto AS t1

WHERE IdProduto IN (
    SELECT IdProduto
    FROM produtos
    WHERE DescNomeProduto = 'Resgatar Ponei'
); 