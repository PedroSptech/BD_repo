CREATE DATABASE ccoasp02;
USE ccoasp02;

CREATE TABLE cliente(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
cpf CHAR(11));

CREATE TABLE pedido(
id INT PRIMARY KEY AUTO_INCREMENT,
dt_pedido DATETIME,
valor DECIMAL(7,2),
fk_cliente INT,
CONSTRAINT ctFKCliente FOREIGN KEY (fk_cliente) REFERENCES cliente(id)
);

INSERT INTO cliente (nome, cpf) VALUES 
('Ana Souza', '12345678901'),
('Carlos Alberto', '23456789012'),
('Beatriz Mendes', '34567890123');

INSERT INTO pedido (dt_pedido, valor, fk_cliente) VALUES 
('2024-03-15 10:30:00', 150.50, 1), 
('2024-03-15 14:20:00', 89.90, 2),  
('2024-03-16 09:15:00', 450.00, 1), 
('2024-03-16 16:45:00', 1200.00, 3); 


-- AVG
SELECT AVG(valor) AS ticket_medio FROM pedido;

-- ROUND = casa decimais formatadas
SELECT ROUND(AVG(valor), 2) AS ticket_medio FROM pedido;

-- TRUNCATE = QUE ELIMINA AS CASAS DECIMAIS, PÓS O VALOR ESPECIFICADO
SELECT TRUNCATE(SUM(valor), 2) AS receita_total_formtada FROM pedido;

-- MAX() : Maior valor dentre os elementos
SELECT MAX(valor) FROM pedido;

-- MIN() :Menor Valor dentre os elementos
SELECT MIN(valor) FROM pedido;
-- COUNT() : Contar a quantidade de elementos
SELECT COUNT(*) FROM pedido;
-- SUM()
SELECT SUM(valor) FROM pedido;

SELECT c.nome AS 'Nomes', SUM(p.valor) AS 'Total' FROM cliente AS c JOIN pedido p ON p.fk_cliente = c.id WHERE p.valor > 300 GROUP BY c.nome;

SELECT c.nome AS 'Nomes', SUM(p.valor) AS 'Total' FROM cliente AS c JOIN pedido p ON p.fk_cliente = c.id GROUP BY c.nome HAVING SUM(p.valor) > 300;

/*
SELECT...
FROM...
JOIN...
WHERE...
GROUP BY...
HAVING...
ORDER BY...
*/

