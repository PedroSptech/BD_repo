/*Pedro Ludovic Nascimento Lima*/
CREATE DATABASE game_store;
USE game_store;

CREATE TABLE jogo(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(30) ,
diretor VARCHAR(30),
genero VARCHAR(30),
dtLancamento DATE,
nota INT,
quantidade INT,

CONSTRAINT cNota CHECK(nota BETWEEN 0 AND 10)
);





-- Insira pelo menos 5 registros para a tabela.
INSERT INTO jogo (nome, diretor, genero, dtLancamento, nota, quantidade ) VALUES
('Death Stranding', 'Hideo Kojima', 'Aventura', '2019-11-08', 9, 67),
('Death Stranding 2', 'Hideo Kojima','Aventura', '2025-06-25', 9 , 57),
('Metal Gear Solid V', 'Hideo Kojima','Aventura','2015-09-01', 10, 47),
('Metal Gear Solid 4', 'Hideo Kojima','Aventura', '2008-06-12', 9, 37),
('Metal Gear Solid 2', 'Hideo Kojima','Aventura', '2001-11-12', 8 , 27 );
-- Altere a tabela para inserir uma coluna que represente o tipo de mídia que deve armazenar o tipo de jogo apenas com os valores “física” ou “digital”.
Alter Table jogo ADD COLUMN tipoMidia VARCHAR(30);
ALTER TABLE jogo ADD CONSTRAINT ctipoMidia CHECK(tipoMidia IN('fisica', 'digital'));
-- Atualize os registros dos jogos inseridos anteriormente.
UPDATE jogo SET tipoMidia = 'fisica' WHERE id = 1;
UPDATE jogo SET tipoMidia = 'digital' WHERE id = 2;
UPDATE jogo SET tipoMidia = 'fisica' WHERE id = 3;
UPDATE jogo SET tipoMidia = 'digital' WHERE id = 4;
UPDATE jogo SET tipoMidia = 'fisica' WHERE id = 5;
-- Exiba apenas os jogos com data de lançamento a partir de 2015.
SELECT * FROM jogo WHERE dtLancamento > '2015-01-01';
-- Exiba os jogos que tenham a letra “a” em seu nome e são de mídia física.
SELECT * FROM jogo WHERE nome LIKE '%a%' AND tipoMidia = 'fisica' ;
-- Exiba os jogos onde o nome do diretor não contenha a letra “e”.
SELECT * FROM jogo WHERE diretor NOT LIKE '%e%';
-- Altere a tabela para criar uma checagem na inserção da nota, onde o valor não pode ser menor que 0 e nem maior que 10.
ALTER TABLE jogo ADD CONSTRAINT cNota CHECK(nota BETWEEN 0 AND 10);
-- Exiba os jogos de um determinado gênero e que ainda esteja em estoque.
SELECT * FROM jogo WHERE genero = 'Aventura' AND quantidade > 0;
-- Exclua os jogos que não têm mais unidades disponíveis em estoque.
DELETE FROM jogo WHERE quantidade = 0;
-- Renomeie a coluna “diretor” para “criador” e exiba como ficou a estrutura da tabela. 
ALTER TABLE jogo RENAME COLUMN diretor TO criador;
DESC jogo;