-- QUESTÃO 2

-- A)
SELECT nome, cidade, estado
FROM cliente
WHERE estado NOT IN ('PR', 'SC', 'RS');

-- B) 
SELECT
    nome,
    CASE estado_civil
        WHEN 'S' THEN 'Solteiro(a)'
        WHEN 'C' THEN 'Casado(a)'
        WHEN 'D' THEN 'Divorciado(a)'
        WHEN 'V' THEN 'Viúvo(a)'
    END AS estado_civil
FROM cliente
WHERE cidade = 'Niteroi';
