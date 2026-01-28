
WITH tb_sumario_dias AS (

    SELECT  DATE(DtCriacao) AS DtDia,
            count(DISTINCT IdTransacao) AS qtdetransacao
    FROM transacoes

    WHERE DtCriacao >= '2025-08-25'
    AND DtCriacao < '2025-08-30'

    GROUP BY DtDia
)

SELECT *,
        SUM(qtdeTransacao) OVER (ORDER BY DtDia) AS qtdeTransacaoACUM
FROM tb_sumario_dias  