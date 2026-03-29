/*Pedro Ludovic Nascimento Lima*/
CREATE DATABASE estoque;
USE estoque;

CREATE TABLE MisteriosSA (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    data_compra DATE,
    preco DECIMAL(10, 2),
    peso_gramas INT,
    data_retirada DATE 
);

-- Insira na tabela, no mínimo 5 compras de alimentos com datas diferentes. Por agora, não preencha a coluna referente a "data de retirada".
INSERT INTO MisteriosSA (id, nome, data_compra, preco, peso_gramas) 
VALUES 
(1, 'Biscoitos Scooby', '2026-02-10', 15.90, 500),
(2, 'Pão de Forma Extra Grande', '2026-02-12', 8.50, 750),
(3, 'Salsicha enlatada', '2026-02-15', 12.00, 400),
(4, 'Mostarda Picante', '2026-02-18', 7.20, 250),
(5, 'Caixa de Hambúrgueres', '2026-02-20', 45.00, 1200);
-- Verifique se os valores foram inseridos corretamente.
SELECT * FROM MisteriosSA;
-- Exiba os nomes, as datas de compra e retirada e o id dos alimentos ordenados a partir da data de compra mais antiga.
SELECT nome, data_compra, data_retirada, id FROM MisteriosSA ORDER BY data_compra ;
-- Alguém comeu uma caixa de biscoitos, atualize a data de retirada da caixa de “Biscoitos Scooby” que foi comprada a mais tempo.
UPDATE MisteriosSA SET data_retirada = CURDATE() WHERE nome = 'Biscoitos Scooby';
-- Altere o nome da coluna id para idComida.
ALTER TABLE MisteriosSA RENAME COLUMN id TO idComida;
-- Altere o tipo do check para que os alimentos só possam ser “Biscoitos Scooby” ou “Cachorro-quente”.
ALTER TABLE MisteriosSA ADD CONSTRAINT cNome CHECK(nome IN('Biscoitos Scooby','Cachorro-quente' ));
-- Exiba os produtos onde o nome seja "Biscoitos Scooby" de forma que o nome das colunas dataCompra apareça como "data da compra" e dataRetirada apareça como "data da retirada".
SELECT idComida, nome, data_compra AS 'data da compra', preco, peso_gramas, data_retirada AS 'data da retirada' FROM MisteriosSA WHERE nome = 'Biscoitos Scooby';
-- Exiba os alimentos que foram comprados antes do dia 25 de julho de 2024.
SELECT nome FROM MisteriosSA WHERE data_compra < '2024-07-25';
-- Exiba os alimentos que possuem um preço acima ou igual a 30.50.
SELECT * FROM MisteriosSA WHERE preco > 30.50;
-- Limpe a tabela.
TRUNCATE MisteriosSA;