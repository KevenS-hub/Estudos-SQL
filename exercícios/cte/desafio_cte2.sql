-- CHURN


WITH tb_clientesd1 AS ( 
    SELECT DISTINCT IdCliente
    FROM transacoes 

    WHERE DtCriacao >= '2025-08-25'
    AND DtCriacao < '2025-08-26'
),

tb_join AS (

    SELECT
            DATE(t2.DtCriacao) AS DtDia,
            count(DISTINCT t1.IdCliente) AS QtdeDeClientes,
            1.0* count(DISTINCT t1.IdCliente) / (select count(*) from tb_clientesd1) AS retencao,
            1 - 1. * count(DISTINCT t1.IdCliente) / (select count(*) from tb_clientesd1) AS churn

    FROM tb_clientesd1 AS t1

    LEFT JOIN transacoes AS t2
    ON t1.IdCliente = t2.IdCliente 

    WHERE t2.DtCriacao >= '2025-08-25'
    AND t2.DtCriacao < '2025-08-30'

    GROUP BY DtDia
)

SELECT * FROM tb_join