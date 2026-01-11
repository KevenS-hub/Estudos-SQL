-- Quantidade de clientes em determinada data de janeiro de 2025
-- Quantas assistiram ao curso de SQL


WITH QtdeTotal AS (
    SELECT count(IdCliente) AS qtde_CLientes
    FROM Clientes

    WHERE substr(DtCriacao, 1, 10) >= '2025-01-01'
    AND substr(DtCriacao, 1, 10) <= '2025-01-31'
),

Expectadores_totais AS (
    SELECT count(idCliente) AS qtde_Expectadores
    FROM clientes

    WHERE DtAtualizacao >= '2025-01-01'
    AND DtAtualizacao <= '2025-01-31'
)

SELECT q.qtde_Clientes,
        e.qtde_Expectadores
FROM Expectadores_totais AS e
CROSS JOIN QtdeTotal AS q
