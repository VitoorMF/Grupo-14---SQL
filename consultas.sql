-- QUESTÃO 2

USE vitin;

-- a) 
SELECT nome, cidade, estado
FROM cliente
WHERE estado NOT IN ('PR', 'SC', 'RS');


-- b) 
SELECT nome,
    CASE estadocivil
        WHEN 'S' THEN 'Solteiro(a)'
        WHEN 'C' THEN 'Casado(a)'
        WHEN 'D' THEN 'Divorciado(a)'
        WHEN 'V' THEN 'Viúvo(a)'
    END AS estado_civil
FROM cliente
WHERE cidade = 'Niteroi';


-- c) 
SELECT nome
FROM cliente
WHERE cod_cliente NOT IN (
    SELECT cod_cliente
    FROM compra
    WHERE YEAR(data_compra) = 2024
);


-- d)
SELECT 
    c.nome AS nome_cliente,
    f.nome AS nome_funcionario,
    fab.nome AS marca_produto
FROM compra co
INNER JOIN cliente c ON co.cod_cliente = c.cod_cliente
INNER JOIN funcionario f ON co.cod_funcionario = f.cod_funcionario
INNER JOIN compra_produto cp ON co.cod_compra = cp.cod_compra
INNER JOIN produto p ON cp.cod_produto = p.cod_produto
INNER JOIN fabricante fab ON p.cod_fabricante = fab.cod_fabricante;


-- e)
SELECT 
    TIMESTAMPDIFF(YEAR, dt_nascimento, CURDATE()) AS idade,
    COUNT(*) AS total_funcionarios
FROM funcionario
GROUP BY idade;

-- f)
SELECT 
    cp.cod_compra,
    SUM((p.preco * cp.qnt_produto) - cp.valor_desconto) AS valor_total_compra
FROM compra_produto cp
INNER JOIN produto p ON cp.cod_produto = p.cod_produto
GROUP BY cp.cod_compra
ORDER BY valor_total_compra DESC
LIMIT 5;


-- g)
SELECT 
    f.nome AS fabricante,
    COUNT(p.cod_produto) AS total_produtos
FROM fabricante f
LEFT JOIN produto p ON f.cod_fabricante = p.cod_fabricante
GROUP BY f.cod_fabricante, f.nome;


-- h)
SELECT 
    p.nome AS produto,
    COUNT(cp.cod_compra) AS qtd_vendas,
    SUM(cp.qnt_produto) AS total_unidades_vendidas
FROM produto p
INNER JOIN compra_produto cp ON p.cod_produto = cp.cod_produto
GROUP BY p.cod_produto, p.nome
HAVING COUNT(cp.cod_compra) > 1
ORDER BY p.nome ASC;


-- i)
SELECT 
    c.nome AS cliente,
    COALESCE(SUM((p.preco * cp.qnt_produto) - cp.valor_desconto), 0) AS valor_total_gasto
FROM cliente c
LEFT JOIN compra co ON c.cod_cliente = co.cod_cliente
LEFT JOIN compra_produto cp ON co.cod_compra = cp.cod_compra
LEFT JOIN produto p ON cp.cod_produto = p.cod_produto
GROUP BY c.cod_cliente, c.nome;


-- j)
SELECT 
    cp.cod_compra,
    SUM((p.preco * cp.qnt_produto) - cp.valor_desconto) AS valor_total_compra,
    CASE 
        WHEN SUM((p.preco * cp.qnt_produto) - cp.valor_desconto) > (
            SELECT AVG(total_por_compra)
            FROM (
                SELECT SUM((p2.preco * cp2.qnt_produto) - cp2.valor_desconto) AS total_por_compra
                FROM compra_produto cp2
                INNER JOIN produto p2 ON cp2.cod_produto = p2.cod_produto
                GROUP BY cp2.cod_compra
            ) AS sub_media
        ) THEN 'Alto'
        ELSE 'Baixo'
    END AS classificacao
FROM compra_produto cp
INNER JOIN produto p ON cp.cod_produto = p.cod_produto
GROUP BY cp.cod_compra;
