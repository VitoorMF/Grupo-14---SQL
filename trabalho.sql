CREATE DATABASE vitin;
USE vitin;

CREATE TABLE cliente (
    cod_cliente INT NOT NULL PRIMARY KEY,
    nome VARCHAR(100),
    cidade VARCHAR(100),
    estado VARCHAR(100),
    genero CHAR(1),
    estado_civil VARCHAR(20),
    dt_nascimento DATE
);

CREATE TABLE fabricante (
    cod_fabricante INT PRIMARY KEY,
    nome VARCHAR(100),
    site VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE funcionario (
    cod_funcionario INT PRIMARY KEY,
    nome VARCHAR(100),
    genero CHAR(1),
    dt_nascimento DATE,
    estado_civil VARCHAR(20),
    cidade VARCHAR(100),
    estado CHAR(2),
    cargo VARCHAR(100)
);

CREATE TABLE compra (
    cod_compra INT PRIMARY KEY,
    hora TIME,
    data_compra DATE,
    cod_cliente INT,
    cod_funcionario INT NOT NULL,
    
    FOREIGN KEY (cod_cliente)
    REFERENCES cliente(cod_cliente),
    
    FOREIGN KEY (cod_funcionario)
    REFERENCES funcionario(cod_funcionario)
);

CREATE TABLE produto (
    cod_produto INT PRIMARY KEY,
    nome VARCHAR(100),
    descricao VARCHAR(100),
    preco DECIMAL(10, 2),
    cod_fabricante INT NOT NULL,
    
    FOREIGN KEY (cod_fabricante)
    REFERENCES fabricante(cod_fabricante)
);

CREATE TABLE compra_produto (
    cod_compra INT,
    cod_produto INT,
    qnt_produto INT,
    valor_desconto DECIMAL(10, 2),
    PRIMARY KEY (cod_compra, cod_produto),

    FOREIGN KEY (cod_compra)
    REFERENCES compra(cod_compra),

    FOREIGN KEY (cod_produto)
    REFERENCES produto(cod_produto)
);
