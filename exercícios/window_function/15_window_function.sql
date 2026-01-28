WITH tb_cliente_dia AS (

    SELECT IdCliente,
            DATE(DtCriacao) AS DtDia,
            count(DISTINCT IdTransacao) AS qtdetransacao
    FROM transacoes

    WHERE dtCriacao >= '2025-08-25'
    AND dtCriacao < '2025-08-30' 

    GROUP BY IdCliente, DtDia
),

tb_lag AS (
    SELECT *,
            SUM(qtdetransacao) OVER (PARTITION BY IdCliente ORDER BY DtDia) AS acum,
            LAG(qtdetransacao) OVER (PARTITION BY IdCliente ORDER BY DtDia) AS lagTransacao
    FROM tb_cliente_dia
)

SELECT *,
1.* qtdeTransacao / lagTransacao 
FROM tb_lag