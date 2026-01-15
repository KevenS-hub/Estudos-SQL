-- Filtro com indicações de nomes por dias
-- Média de aulas

WITH tb_primeirodia AS (
    SELECT DISTINCT IdCliente
    FROM transacoes 
    WHERE substr(DtCriacao, 1, 10) = '2025-08-25'
    --WHERE DATE(DtCriacao >= '2025-08-25')
),

tb_diasCurso AS (
    SELECT DISTINCT
        IdCliente, 
        substr(DtCriacao, 1, 10) AS presenteDia
        --DATE(DtCriacao) AS presenteDia
    FROM transacoes 
    WHERE DtCriacao >= '2025-08-25'
    AND DtCriacao < '2025-08-30'

    ORDER BY IdCliente, presenteDia
),


tb_cliente_dias AS (

    SELECT t1.IdCliente, 
            count(DISTINCT t2.presenteDia) AS qtdedias

    FROM tb_primeirodia AS t1
    LEFT JOIN tb_diasCurso AS t2
    ON t1.IdCliente = t2.IdCliente

    GROUP BY t1.IdCliente
)

SELECT avg(qtdeDias),
        max(qtdeDias),
        min(qtdeDias)
FROM tb_cliente_dias;

