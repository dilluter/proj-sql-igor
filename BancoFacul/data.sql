-- 1. Criação do banco de dados
CREATE DATABASE IF NOT EXISTS SistemaEventos;
USE SistemaEventos;

-- 2. Criação da tabela de eventos
CREATE TABLE Eventos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    data_evento DATE,
    criado_em DATETIME DEFAULT NOW()
);

-- 3. Inserção de dados com datas
INSERT INTO Eventos (nome, data_evento) VALUES
('Workshop de Segurança', '2025-06-10'),
('Palestra sobre IA', '2025-05-25'),
('Curso de SQL', '2025-05-20'),
('Encontro de Devs', '2025-04-15'),
('Maratona de Programação', '2025-03-10');

-- 4. Selecionar todos os eventos
SELECT * FROM Eventos;

-- 5. Filtrar eventos futuros (após a data atual)
SELECT * FROM Eventos
WHERE data_evento > CURDATE();

-- 6. Filtrar eventos que aconteceram este mês
SELECT * FROM Eventos
WHERE MONTH(data_evento) = MONTH(CURDATE())
AND YEAR(data_evento) = YEAR(CURDATE());

-- 7. Ordenar eventos por data (mais próximos primeiro)
SELECT * FROM Eventos
ORDER BY data_evento ASC;

-- 8. Eventos entre duas datas
SELECT * FROM Eventos
WHERE data_evento BETWEEN '2025-04-01' AND '2025-06-30';

-- 9. Diferença em dias entre hoje e a data do evento
SELECT nome, data_evento, DATEDIFF(data_evento, CURDATE()) AS dias_ate_evento
FROM Eventos;

-- 10. Atualizar data de um evento
UPDATE Eventos SET data_evento = '2025-07-01' WHERE nome = 'Workshop de Segurança';

-- 11. Adicionar nova coluna com a data de encerramento
ALTER TABLE Eventos ADD COLUMN data_fim DATE;

-- 12. Atualizar a data de fim de um evento
UPDATE Eventos SET data_fim = '2025-06-11' WHERE nome = 'Workshop de Segurança';

-- 13. Apagar eventos já passados
DELETE FROM Eventos WHERE data_evento < CURDATE();
