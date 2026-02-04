-- Quantidade de transações acumuladas ao longo do tempo

WITH tb_diario AS (

    SELECT DATE(DtCriacao) AS DtDia,
            count(DISTINCT IdTransacao) AS QtdeTransacoes
    FROM transacoes

    GROUP BY DtDia
    ORDER BY DtDia
),

tb_acum AS (
    SELECT *,
        SUM(QtdeTransacoes) OVER (ORDER BY DtDia) AS QtdeTransacaoAcum
    FROM tb_diario
)

-- Quando atingimos 100000 transações acumuladas ?

SELECT * 
FROM tb_acum
WHERE qtdeTransacaoAcum > 100000
LIMIT 1