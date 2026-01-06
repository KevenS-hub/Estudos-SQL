SELECT 
    t1.DescNomeProduto,
    count(*) AS QuantidadePedidos
FROM produtos t1
INNER JOIN transacao_produto t2
    ON t1.IdProduto = t2.IdProduto
GROUP BY 
    t1.DescNomeProduto;


-- SELECT t1.IdProduto,
--       t1.DescNomeProduto,
 --      t2.idTransacaoProduto,
  --     t2.QtdeProduto,as
--FROM produtos AS t1
--INNER JOIN transacao_produto AS t2
--ON t1.idProduto = t2.IdProduto;


