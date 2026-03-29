/*Pedro Ludovic Nascimento Lima*/
CREATE DATABASE olimpiadas;
USE olimpiadas;

CREATE TABLE esporte(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(40),
categoria VARCHAR(20),
Njogadores INT,
estreia DATE,
pOrigem VARCHAR(30),
CONSTRAINT cCategoria CHECK(categoria IN('Individual', 'Coletivo'))
);

-- Insira pelo menos 5 registros na tabela.
INSERT INTO esporte (nome, categoria, Njogadores, estreia, pOrigem) VALUES
('Futebol', 'Coletivo', 11, '1863-10-26', 'Inglaterra'),
('Tênis', 'Individual', 1, '1873-01-01', 'Reino Unido'),
('Basquete', 'Coletivo', 5, '1891-12-01', 'Estados Unidos'),
('Judô', 'Individual', 1, '1882-05-01', 'Japão'),
('Vôlei', 'Coletivo', 6, '1895-02-09', 'Estados Unidos');
-- Altere a tabela para adicionar uma coluna popularidade que armazene a popularidade do esporte como um valor decimal entre 0 e 10 e exiba como ficou a estrutura da tabela.
ALTER TABLE esporte ADD COLUMN popularidade INT;
ALTER TABLE esporte ADD CONSTRAINT cPopularidade CHECK(popularidade BETWEEN 1 AND 10);
-- Atualize os registros para definir a popularidade dos esportes inseridos anteriormente.
UPDATE esporte SET popularidade = 6 WHERE id = 1; 
UPDATE esporte SET popularidade = 7 WHERE id = 2; 
UPDATE esporte SET popularidade = 8 WHERE id = 3; 
UPDATE esporte SET popularidade = 9 WHERE id = 4; 
UPDATE esporte SET popularidade = 10 WHERE id = 5; 
-- Exiba os esportes ordenados por popularidade em ordem crescente.
SELECT * FROM esporte ORDER BY popularidade;
-- Exiba apenas os esportes que estrearam nas Olimpíadas a partir do ano 2000.
SELECT * FROM esporte WHERE estreia > '2000-01-01';
-- Crie uma checagem para que não possa ser inserido valores dentro de estreia que seja menor que 06 de abril de 1896 e depois da data atual.
ALTER TABLE esporte ADD CONSTRAINT CHECK(estreia BETWEEN '1896-04-06' AND '2026-02-23');
-- Altere a tabela para excluir a regra de inserção de categoria, assim podendo colocar valores além de "Individual" ou "Coletivo".
ALTER TABLE esporte DROP CONSTRAINT cCategoria; 
-- Exiba apenas os esportes cujo nome do país de origem tenha "a" na segunda letra.
SELECT * FROM esporte WHERE pOrigem LIKE '_a%';
-- Exiba os dados onde o número de jogadores por equipe esteja entre 4 e 11.
SELECT * FROM esporte WHERE Njogadores BETWEEN 4 AND 11;
-- Remova os registros onde id seja 1, 3 e 5.
DELETE FROM esporte WHERE id = 1 and  3 and 5;
