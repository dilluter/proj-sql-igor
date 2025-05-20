-- 1. Criação de banco de dados
CREATE DATABASE Escola;
USE Escola;

-- 2. Criação de tabelas
CREATE TABLE Alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    idade INT,
    curso_id INT
);

CREATE TABLE Cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    duracao_meses INT
);

-- 3. Inserção de dados
INSERT INTO Cursos (nome, duracao_meses) VALUES
('Análise de Sistemas', 24),
('Engenharia de Software', 48),
('Ciência de Dados', 36);

INSERT INTO Alunos (nome, idade, curso_id) VALUES
('João', 20, 1),
('Maria', 22, 2),
('Carlos', 19, 1),
('Ana', 23, 3),
('Fernanda', 21, 2);

-- 4. Seleção de dados
SELECT * FROM Alunos;

-- 5. Filtro com WHERE
SELECT * FROM Alunos WHERE idade > 21;

-- 6. JOIN (junção de tabelas)
SELECT Alunos.nome AS Nome_Aluno, Cursos.nome AS Curso
FROM Alunos
JOIN Cursos ON Alunos.curso_id = Cursos.id;

-- 7. ORDER BY (ordenar)
SELECT * FROM Alunos ORDER BY idade DESC;

-- 8. GROUP BY e HAVING
SELECT curso_id, COUNT(*) AS total_alunos
FROM Alunos
GROUP BY curso_id
HAVING total_alunos > 1;

-- 9. Atualizar dados
UPDATE Alunos SET idade = 25 WHERE nome = 'João';

-- 10. Excluir dados
DELETE FROM Alunos WHERE nome = 'Carlos';

-- 11. ALTER TABLE: adicionar nova coluna
ALTER TABLE Alunos ADD COLUMN email VARCHAR(100);

-- 12. LIMIT: limitar quantidade de resultados
SELECT * FROM Alunos LIMIT 3;

-- 13. DROP TABLE: apagar tabela
-- DROP TABLE Alunos;

-- 14. DROP DATABASE: apagar banco de dados
-- DROP DATABASE Escola;
