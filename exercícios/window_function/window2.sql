-- Quantidade de usuários cadastrados (Absoluto e acumulado) ao longo do tempo?

WITH tb_clientes AS (
    SELECT DATE(DtCriacao) AS DtDia,
    COUNT(DISTINCT idCliente) AS QtdeClientes
    FROM Clientes
    GROUP BY DtDia
),

tb_acum AS(
    SELECT *,
        SUM(QtdeClientes) OVER (ORDER BY DtDia) AS QtdeClientesAcum
    FROM tb_clientes
)

SELECT *
FROM tb_acum
    