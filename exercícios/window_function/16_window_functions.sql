WITH cliente_dia AS (
        SELECT DISTINCT IdCliente,
                DATE(DtCriacao) AS DtDia
        FROM transacoes

        WHERE DATE(DtCriacao) BETWEEN '2025-01-01' AND '2025-12-31'
        ORDER BY IdCliente, DtDia
),

tb_lag AS (
        SELECT *,
                LAG(DtDia) OVER (PARTITION BY IdCliente ORDER BY DtDia) AS LagDia
        FROM cliente_dia
),

tb_diff_dt AS (
        SELECT *,
                CAST(julianday(DtDia) - julianday(LagDia) AS INTEGER) AS DtDiff
        FROM tb_lag
),

avg_cliente AS (
        SELECT IdCliente, CAST(avg(DtDiff) AS INTEGER) AS DiferencaMedia 
        FROM tb_diff_dt
        GROUP BY IdCliente
)

-- Nossos usuários voltam em média de quanto em quanto tempo?
SELECT avg(DiferencaMedia) FROM avg_cliente