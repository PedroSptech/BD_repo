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