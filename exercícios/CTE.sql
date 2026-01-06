-- Cálculo de taxa de retenção de clientes 

WITH tb_cliente_primeiro_dia AS (

    SELECT DISTINCT IdCliente 
    FROM transacoes 
    WHERE DATE(DtCriacao) = '2025-08-25'
),

tb_cliente_ultimo_dia AS (

    SELECT DISTINCT IdCliente 
    FROM transacoes 
    WHERE DATE(DtCriacao) = '2025-08-29'
),

tb_join AS (
    SELECT t1.IdCliente AS primCliente,
        t2.IdCliente AS ultCliente

    FROM tb_cliente_primeiro_dia AS t1

    LEFT JOIN tb_cliente_ultimo_dia AS t2
    ON t1.IdCliente = t2.IdCliente
)

SELECT count(primCLiente),
        count(ultCliente),
        1. * count(ultCliente) / count(primCliente)
FROM tb_join;
