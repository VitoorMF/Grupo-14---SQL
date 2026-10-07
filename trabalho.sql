CREATE DATABASE vitin;
USE vitin;

CREATE TABLE cliente (
    cod_cliente INT PRIMARY KEY,
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
    estado VARCHAR(100)
);

CREATE TABLE compra (
    cod_compra INT PRIMARY KEY,
    hora TIME,
    data_compra DATE,
    cod_cliente INT,
    cod_funcionario INT,

    FOREIGN KEY (cod_cliente)
        REFERENCES cliente(cod_cliente),

    FOREIGN KEY (cod_funcionario)
        REFERENCES funcionario(cod_funcionario)
);