SELECT IdCliente,
        DATE(DtCriacao) AS DtDia
FROM transacoes

WHERE DATE(DtCriacao) BETWEEN '2025-01-01' AND '2025-12-31'
ORDER BY IdCliente, DtDia