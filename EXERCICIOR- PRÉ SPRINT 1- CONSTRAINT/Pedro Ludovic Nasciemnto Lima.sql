/*Pedro Ludovic Nascimento Lima*/
-- ex1
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


-- ex2
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


-- ex3
/*Pedro Ludovic Nascimento Lima*/
CREATE DATABASE desenho;
USE desenho;

CREATE TABLE desenhos_animados (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(50) NOT NULL,
    data_lancamento DATE,
    emissora_original VARCHAR(50),
    classificacao VARCHAR(20),
    status_desenho VARCHAR(15),
    nota INT,
    
    CONSTRAINT chk_nota CHECK (nota BETWEEN 1 AND 5)
);

ALTER TABLE desenhos_animados AUTO_INCREMENT = 10;

INSERT INTO desenhos_animados (titulo, data_lancamento, emissora_original, classificacao, status_desenho, nota)
VALUES 
('Avatar: A Lenda de Aang', '2005-02-21', 'Nickelodeon', 'Livre', 'Finalizado', 5),
('Rick and Morty', '2013-12-02', 'Adult Swim', '16 anos', 'Em exibição', 5),
('Ben 10', '2005-12-27', 'Cartoon Network', 'Livre', 'Finalizado', 4),
('Os Simpsons', '1989-12-17', 'Fox', '12 anos', 'Em exibição', 4),
('X-Men: Evolution', '2000-11-04', 'Kids WB', 'Livre', 'Finalizado', 5);

-- Exibir todos os dados da tabela
SELECT * FROM desenhos_animados;
-- Exibir todos os desenhos com a classificação menor ou igual a 14 anos
SELECT * FROM desenhos_animados WHERE classificacao IN('Livre', '12 anos', '14 anos');
-- Exibir todos os desenhos de uma mesma emissora original
SELECT * FROM desenhos_animados WHERE emissora_original = 'Fox';
-- Modificar o campo status, para que aceite apenas o status 'exibindo', 'finalizado', 'cancelado', tente inserir algum outro valor para ver se a regra foi aplicada
ALTER TABLE desenhos_animados ADD CONSTRAINT CHECK(status_desenho IN('exibindo', 'finalizado', 'cancelado'));
-- Modificar o status 'exibindo' para 'finalizado' de 2 desenhos pelo ID
UPDATE desenhos_animados SET status_desenho = 'finalizado' WHERE id IN(2,3);
-- Deletar a linha do desenho de ID 12
DELETE FROM desenhos_animados WHERE id=12;
-- Exibir apenas os desenhos que comecem com uma determinada letra
SELECT * FROM desenhos_animados WHERE titulo LIKE 'A%';
-- Renomear a coluna classificacao para classificacaoIndicativa
ALTER TABLE desenhos_animados RENAME COLUMN classificacao TO classificacaoIndicativa;
-- Atualizar a nota e data de lançamento do desenho de ID 11
UPDATE desenhos_animados SET nota = 3 AND data_lancamento = '1984-06-05' WHERE ID = 11;
-- Limpe todos os dados da tabela
TRUNCATE desenhos_animados;
-- Remover a regra do status do desenho
SHOW CREATE TABLE desenhos_animados;
ALTER TABLE desenhos_animados DROP CHECK desenhos_animados_chk_1;


-- ex4
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


-- ex5
/*Pedro Ludovic Nascimento Lima*/
CREATE DATABASE vingadores;
USE vingadores;

CREATE TABLE heroi (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    versao VARCHAR(45), 
    habilidade VARCHAR(100),
    altura_cm INT
);

INSERT INTO heroi (nome, versao, habilidade, altura_cm) 
VALUES 
('Homem de Ferro', 'Vingadores: Ultimato', 'Intelecto Gênio e Armadura Tecnológica', 185),
('Capitão América', 'O Primeiro Vingador', 'Super Força e Liderança', 188),
('Thor', 'Thor: Amor e Trovão', 'Controle do Trovão e Imortalidade', 198),
('Pantera Negra', 'Pantera Negra: Wakanda para Sempre', 'Agilidade Sobre-humana e Traje de Vibranium', 183),
('Doutor Estranho', 'No Multiverso da Loucura', 'Mestre das Artes Místicas', 182);


-- Exiba os dados inseridos na tabela
SELECT * FROM heroi;
-- Adicione um campo de regeneração, onde ele aceitará apenas os valores booleanos de TRUE ou FALSE.
ALTER TABLE heroi ADD COLUMN regeneracao VARCHAR(5);
ALTER TABLE heroi ADD CONSTRAINT cRegeneracao CHECK(regeneracao IN('TRUE', 'FALSE'));
-- Modifique o campo versão para aceitar até 100 caracteres.
ALTER TABLE heroi MODIFY COLUMN versao VARCHAR(100);
-- Remova o herói de id 3 pois ele se morreu em batalha.
DELETE FROM heroi WHERE id = 3;
-- Chegou reforços, insira um novo herói para a equipe.
INSERT INTO heroi (nome, versao, habilidade, altura_cm, regeneracao) VALUES
('Franklin Richards', 'Quarteto Fantástico: Heróis Renascem', 'Manipulação da Realidade e Onipotência', 142, 'TRUE');
-- Exiba todos os dados inseridos na tabela onde o nome do herói começa com “C” ou “H”.
SELECT * FROM heroi WHERE nome LIKE 'C%' OR 'H%';
-- Exiba todos os dados inseridos na tabela onde o nome do herói não contém a letra “A” no campo nome.
SELECT * FROM heroi WHERE nome NOT LIKE '%a%';
-- Exiba apenas o nome do herói onde a altura for maior que 190.
SELECT * FROM heroi WHERE altura_cm > 190;
-- Exiba todos os dados da tabela de forma decrescente pelo nome onde a altura do herói for maior que 180.
SELECT * FROM heroi WHERE altura_cm > 180 ORDER BY nome DESC;
-- Limpe os dados da tabela.
TRUNCATE heroi;