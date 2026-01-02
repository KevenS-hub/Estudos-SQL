-- Do início ao fim (2025-08-25 a 2025-08-29), quantos clientes assinaram a lista de presença?

SELECT COUNT(DISTINCT t1.IdCliente)

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
ON t2.IdProduto = t3.IdProduto

WHERE t1.DtCriacao >= '2025-08-25'
AND t1.Dtcriacao < '2025-08-30'
AND t3.DescNomeProduto = 'Lista de presença';