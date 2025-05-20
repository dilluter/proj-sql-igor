CREATE DATABASE diluter_corp;
USE diluter_corp;

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf_cnpj VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    endereco VARCHAR(250),
    data_cadastro DATE
);
CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2),
    data_contratacao DATE
);
CREATE TABLE produtos (
    id_produtos INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(250),
    preco DECIMAL(10,2),
    estoque INT,
    categoria VARCHAR(50)
);
CREATE TABLE pedidos (
    id_pedidos INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    id_funcionario INT,
    data DATE,
    status VARCHAR(30),
    valor_total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario)
);
CREATE TABLE pagamentos (
    id_pagamentos INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT,
    forma_pagamento VARCHAR(20),
    valor_pagar DECIMAL(10,2),
    status VARCHAR(20),
    data DATE,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedidos)
);
CREATE TABLE chamados (
    id_chamados INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    id_funcionario INT,
    titulo VARCHAR(100),
    descricao VARCHAR(250),
    status VARCHAR(20),
    data_abertura DATE,
    data_encerramento DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario)
);
SELECT * FROM chamados WHERE status = 'aberto';
SELECT * FROM pagamentos WHERE status = 'pendente';
SELECT nome, preco FROM produtos;
SELECT * FROM pedidos WHERE id_cliente = 1;
















