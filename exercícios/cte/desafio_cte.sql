-- Quantidade de clientes em determinada data de janeiro de 2025
-- Quantas assistiram ao curso de SQL

WITH tb_clientes_jan AS (
    SELECT DISTINCT IdCliente
    FROM transacoes 
    WHERE DtCriacao >= '2025-01-01'
    AND DtCriacao < '2025-02-01'
),

tb_clientes_curso AS (
    SELECT DISTINCT IdCliente 
    FROM transacoes
    WHERE DtCriacao >= '2025-08-25'
    AND DtCriacao < '2025-08-30'
)
SELECT count(t1.IdCliente) AS ClientesJan,
        count(t2.IdCliente) AS ClienteCurso
FROM tb_clientes_jan AS t1 

LEFT JOIN tb_clientes_curso AS t2
ON t1.IdCliente = t2.IdCliente
 
