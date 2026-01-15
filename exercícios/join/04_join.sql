-- Clientes mais antigos, medir frequência

SELECT t1.IdCLiente,
        julianday('now') - julianday(substr(t1.DtCriacao, 1, 19)) AS idadebase,
        count(t2.IdTransacao) as qtdeTransacoes
FROM clientes AS t1

LEFT JOIN transacoes AS t2
ON t1.IdCliente = t2.IdCliente

GROUP BY t1.IdCliente, idadebase 