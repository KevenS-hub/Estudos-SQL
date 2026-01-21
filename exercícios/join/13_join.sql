-- Dia de maior engajamento de cada aluno que iniciou o curso no dia 01


WITH alunos_dia01 AS (
    SELECT DISTINCT Idcliente
    FROM transacoes
    WHERE DATE(DtCriacao) = '2025-08-25'
),

tb_dia_cliente AS (

    SELECT t1.IdCliente,
           DATE(t2.DtCriacao) AS DtDia,
           count(*) AS qtdeInteracoes
    FROM alunos_dia01 AS t1

    LEFT JOIN transacoes AS t2
    ON t1.IdCliente = t2.IdCliente 
    AND t2.DtCriacao >= '2025-08-25'
    AND t2.DtCriacao < '2025-08-30' 

    GROUP BY t1.IdCliente, DATE(t2.DtCriacao)

    ORDER BY t1.IdCliente, DtDia
),

tb_rn AS (
        SELECT *,
            ROW_NUMBER() OVER (PARTITION BY IdCliente ORDER BY qtdeInteracoes DESC, DtDia ASC) AS rn 
        FROM tb_dia_cliente
)

SELECT *
FROM tb_rn 
WHERE rn = 1