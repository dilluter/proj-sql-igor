-- Criando o banco de dados
DROP DATABASE IF EXISTS hcode;
CREATE DATABASE hcode;
USE hcode;

-- Criando a tabela de pessoas
CREATE TABLE tb_pessoas (
    idpessoa INT AUTO_INCREMENT NOT NULL,
    desnome VARCHAR(256) NOT NULL,
    dtcadastro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    CONSTRAINT pk_pessoas PRIMARY KEY (idpessoa)
) ENGINE=InnoDB;

-- Criando a tabela de funcionários
CREATE TABLE tb_funcionarios (
    idfuncionario INT AUTO_INCREMENT NOT NULL,
    idpessoa INT NOT NULL,
    vlsalario DECIMAL(10,2) NOT NULL DEFAULT 1000.00,
    dtadmissao DATE NOT NULL,
    CONSTRAINT pk_funcionarios PRIMARY KEY (idfuncionario),
    CONSTRAINT fk_funcionarios_pessoas FOREIGN KEY (idpessoa) REFERENCES tb_pessoas (idpessoa)
);

-- Criando a tabela de pedidos
CREATE TABLE tb_pedidos (
    idpedido INT AUTO_INCREMENT NOT NULL,
    idpessoa INT NOT NULL,
    dtpedido DATETIME NOT NULL,
    vlpedido DECIMAL(10,2),
    CONSTRAINT pk_pedidos PRIMARY KEY (idpedido),
    CONSTRAINT fk_pedidos_pessoas FOREIGN KEY (idpessoa) REFERENCES tb_pessoas (idpessoa)
);

-- Inserindo dados na tabela de pessoas
INSERT INTO tb_pessoas (desnome) VALUES ('Gabi'), ('Igor'), ('Wend');

-- Inserindo dados na tabela de funcionários
INSERT INTO tb_funcionarios VALUES
(NULL, 1, 5000, CURRENT_DATE()),
(NULL, 2, 5000, CURRENT_DATE());

-- Inserindo dados na tabela de pedidos
INSERT INTO tb_pedidos VALUES
(NULL, 1, NOW(), 2325.00),
(NULL, 1, NOW(), 35325.00),
(NULL, 2, NOW(), 25325.00),
(NULL, 2, NOW(), 8000.00),
(NULL, 3, NOW(), 120000.00);

-- Criando uma view para visualizar pedidos
CREATE VIEW v_pedidos AS
SELECT 
    b.desnome,
    SUM(a.vlpedido) AS total,
    CONVERT(AVG(a.vlpedido), DECIMAL(10,2)) AS media,
    CONVERT(MIN(a.vlpedido), DECIMAL(10,2)) AS menor_valor,
    CONVERT(MAX(a.vlpedido), DECIMAL(10,2)) AS maior_valor,
    COUNT(*) AS total_de_pedidos
FROM tb_pedidos a 
INNER JOIN tb_pessoas b USING(idpessoa)
GROUP BY b.idpessoa
HAVING SUM(a.vlpedido) > 34000;

-- Consultas úteis
SELECT * FROM tb_pessoas;
SELECT * FROM tb_funcionarios;
SELECT * FROM tb_pedidos;
SELECT * FROM v_pedidos;

-- Contagem de funcionários
SELECT COUNT(*) AS total FROM tb_funcionarios;

-- Atualização de salário para funcionário específico
UPDATE tb_funcionarios SET vlsalario = vlsalario * 1.5 WHERE idfuncionario = 7;

-- Selecionando funcionários do sexo masculino com salário acima de 1600
SELECT * FROM tb_funcionarios WHERE vlsalario > 1600;

-- Exibindo nome e salário com aumento de 10%
SELECT nome, vlsalario AS atual, CONVERT(vlsalario * 1.1, DECIMAL(10,2)) AS 'salario com aumento de 10%'
FROM tb_funcionarios;

-- Join entre funcionários e pessoas
SELECT *
FROM tb_funcionarios a
INNER JOIN tb_pessoas b ON a.idpessoa = b.idpessoa;

-- Left join entre pessoas e funcionários
SELECT *
FROM tb_pessoas a
LEFT JOIN tb_funcionarios b ON a.idpessoa = b.idpessoa;
