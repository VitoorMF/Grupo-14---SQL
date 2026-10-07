-- POPULAR O BANCO (TEMA 14)
-- Ordem: primeiro as tabelas sem FK, depois as que apontam para elas.
-- Estado civil guardado como letra: S = solteiro, C = casado, D = divorciado, V = viuvo

USE vitin;

-- FABRICANTE
INSERT INTO fabricante (cod_fabricante, nome, site, email) VALUES
(1, 'Samsung',  'www.samsung.com.br',  'contato@samsung.com.br'),
(2, 'Nestle',   'www.nestle.com.br',   'sac@nestle.com.br'),
(3, 'Tramontina','www.tramontina.com.br','sac@tramontina.com.br'),
(4, 'Faber-Castell','www.faber-castell.com.br','contato@faber-castell.com.br'),
(5, 'Philips',  'www.philips.com.br',  'atendimento@philips.com.br');

-- PRODUTO
INSERT INTO produto (cod_produto, nome, descricao, preco, cod_fabricante) VALUES
(1,  'Smartphone Galaxy A55', 'Celular 128GB',            2199.90, 1),
(2,  'Smart TV 50',           'TV 4K 50 polegadas',       2899.00, 1),
(3,  'Chocolate Classic',     'Barra 90g',                   7.49, 2),
(4,  'Leite Ninho',           'Lata 380g',                  21.90, 2),
(5,  'Jogo de Panelas',       '5 pecas inox',              489.90, 3),
(6,  'Faca do Chef',          'Lamina 8 polegadas',         79.90, 3),
(7,  'Lapis de Cor 24',       'Caixa com 24 cores',         32.50, 4),
(8,  'Caneta Esferografica',  'Azul, unidade',               2.80, 4),
(9,  'Air Fryer',             '4,1 litros',                399.00, 5),
(10, 'Barbeador Eletrico',    'A prova d agua',            259.90, 5),
(11, 'Caderno de Desenho',    'A4, 50 folhas',              10.00, 4);

-- CLIENTE (regioes diferentes; 3 clientes de Niteroi)
INSERT INTO cliente (cod_cliente, nome, cidade, estado, genero, estadocivil, dt_nascimento) VALUES
(1,  'Ana Souza',        'Niteroi',        'RJ', 'F', 'S', '1998-03-12'),
(2,  'Bruno Lima',       'Niteroi',        'RJ', 'M', 'C', '1985-07-25'),
(3,  'Carla Mendes',     'Rio de Janeiro', 'RJ', 'F', 'D', '1979-11-02'),
(4,  'Diego Rocha',      'Sao Paulo',      'SP', 'M', 'S', '2001-01-30'),
(5,  'Elisa Martins',    'Belo Horizonte', 'MG', 'F', 'C', '1990-05-18'),
(6,  'Fabio Costa',      'Porto Alegre',   'RS', 'M', 'V', '1955-09-09'),
(7,  'Gabriela Alves',   'Curitiba',       'PR', 'F', 'S', '1996-12-21'),
(8,  'Henrique Dias',    'Florianopolis',  'SC', 'M', 'C', '1982-04-14'),
(9,  'Isabela Nunes',    'Salvador',       'BA', 'F', 'S', '2000-08-08'),
(10, 'Joao Pereira',     'Recife',         'PE', 'M', 'D', '1975-02-27'),
(11, 'Karina Teixeira',  'Niteroi',        'RJ', 'F', 'V', '1950-06-03'),
(12, 'Lucas Barros',     'Vitoria',        'ES', 'M', 'S', '1993-10-19');

-- FUNCIONARIO (idades variadas, com duas pessoas da mesma idade)
INSERT INTO funcionario (cod_funcionario, nome, genero, dt_nascimento, estado_civil, cidade, estado, cargo) VALUES
(1, 'Marcos Silva',    'M', '1962-04-10', 'V', 'Rio de Janeiro', 'RJ', 'Gerente de vendas'),
(2, 'Patricia Gomes',  'F', '1988-09-15', 'C', 'Niteroi',        'RJ', 'Vendedor'),
(3, 'Rafael Moreira',  'M', '1988-02-20', 'S', 'Rio de Janeiro', 'RJ', 'Vendedor'),
(4, 'Sabrina Lopes',   'F', '1997-12-01', 'S', 'Sao Goncalo',    'RJ', 'Caixa'),
(5, 'Tiago Ferreira',  'M', '2003-06-11', 'S', 'Niteroi',        'RJ', 'Caixa'),
(6, 'Vanessa Ribeiro', 'F', '1975-03-05', 'D', 'Rio de Janeiro', 'RJ', 'Vendedor');

-- COMPRA (2024, 2025 e 2026; horarios variados)
-- O cliente 12 nunca comprou. O cliente 7 so comprou fora de 2024.
INSERT INTO compra (cod_compra, data_compra, hora, cod_cliente, cod_funcionario) VALUES
(1,  '2024-01-15', '09:20:00', 1,  2),
(2,  '2024-02-03', '14:45:00', 2,  3),
(3,  '2024-03-22', '20:30:00', 3,  2),
(4,  '2024-05-10', '11:05:00', 4,  4),
(5,  '2024-07-08', '18:50:00', 5,  6),
(6,  '2024-09-30', '21:15:00', 1,  3),
(7,  '2024-12-20', '16:40:00', 8,  1),
(8,  '2025-01-11', '10:30:00', 7,  5),
(9,  '2025-03-02', '19:10:00', 6,  2),
(10, '2025-06-17', '20:05:00', 9,  6),
(11, '2025-08-25', '08:55:00', 10, 4),
(12, '2025-11-28', '13:25:00', 2,  3),
(13, '2026-02-14', '15:00:00', 11, 2),
(14, '2026-05-06', '17:35:00', 7,  6),
(15, '2026-09-19', '20:45:00', 5,  1);

-- COMPRA_PRODUTO (produtos repetidos em varias compras; alguns com desconto)
INSERT INTO compra_produto (cod_compra, cod_produto, qnt_produto, valor_desconto) VALUES
(1,  3,  4,   0.00),
(1,  8, 10,   0.00),
(2,  1,  1, 100.00),
(3,  5,  1,  50.00),
(3,  6,  2,   0.00),
(4,  7,  3,   0.00),
(4,  8,  5,   0.00),
(5,  9,  1,  30.00),
(5,  4,  2,   0.00),
(6,  2,  1, 200.00),
(7,  3,  6,   0.00),
(7, 10,  1,   0.00),
(8,  1,  1,   0.00),
(8,  4,  3,   5.00),
(9,  6,  1,   0.00),
(10, 9,  1,   0.00),
(10, 3,  2,   0.00),
(11, 8, 20,   4.00),
(12, 5,  1,   0.00),
(12, 8,  2,   0.00),
(13, 4,  1,   0.00),
(13, 11, 2,   0.00),
(14, 2,  1, 150.00),
(14, 6,  1,   0.00),
(15, 6,  1,  20.00),
(15, 3,  1,   0.00);
