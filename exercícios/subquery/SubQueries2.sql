SELECT count(DISTINCT IdCliente)
FROM clientes AS t1

WHERE t1.IdCliente IN(
    SELECT DISTINCT IdCliente
    FROM transacoes
    WHERE DATE(t1.DtCriacao) IN ('2025-08-25', '2025-08-29')
);

SELECT count(DISTINCT IdCliente)
FROM transacoes 
WHERE DATE(DtCriacao) IN ('2025-08-25');