SELECT *,
substr(DescNomeProduto, 1, 10)
FROM produtos

INNER JOIN transacao_produto AS t2
ON produtos.IdProduto = t2.IdProduto


