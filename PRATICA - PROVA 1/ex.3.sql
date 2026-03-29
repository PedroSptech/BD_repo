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



