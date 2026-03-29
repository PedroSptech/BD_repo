CREATE DATABASE aula3BD;

USE aula3BD;

/*
DECIMAL
INT - inteiro ; integer
FLOAT
*/

CREATE TABLE professor(
id INT,
nome VARCHAR(45),
cpf CHAR(11),
salario DECIMAL(6,2),
tipo VARCHAR(20),
dtCadastro DATETIME,
CONSTRAINT PKid PRIMARY KEY (id),
CONSTRAINT cTipo CHECK (tipo IN('Assitente', 'Titular', 'Monitor'))
);

ALTER TABLE professor MODIFY COLUMN id INT AUTO_INCREMENT;
/*
ALTER TABLE professor DROP COLUMN cTipo;
ALTER TABLE professor ADD CONSTRAINT;
cTipo CHECK (tipo IN('Assitente', 'Titular', 'Monitor'))
*/

INSERT INTO professor (nome, cpf, salario, tipo, dtCadastro) VALUES
-- curdate() ->PEGA A DATA ATUAL
-- current_timestamp() ou now() -> Peg a data e hora atual

('Clara', '11111111111', 1.99, 'Assitente', CURRENT_TIMESTAMP()),
('Pedro', '2222222222', 1000.10, 'Monitor', NOW()),
('Raphael', '33333333333', 5000.99, 'Titular', NOW()),
('Nicole', '44444444444', 6000.50, 'Titular', CURRENT_TIMESTAMP());

CREATE TABLE aluno(
id INT PRIMARY KEY AUTO_INCREMENT,
ra CHAR(8) UNIQUE,
nome VARCHAR(45) DEFAULT 'Sem nome',
dtCadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO aluno(ra) VALUES
('04261077'),
('04261099'),
('04261000');

UPDATE aluno SET nome = 'Nicole' WHERE id = 1;
UPDATE aluno SET nome = 'Thiago' WHERE id = 2;
UPDATE aluno SET nome = 'Clara' WHERE id = 3;

SELECT * FROM aluno;

SELECT 

nome AS 'Primeiro Nome',
-- ALIAS - APELIDO
ra AS 'Resgistro acadêmico'
FROM aluno;

SELECT 
	CASE
    WHEN tipo = 'Monitor' THEN salario = 3000.00
    WHEN tipo = 'Assitente' THEN salario = 5000.00
    WHEN tipo = 'Titular' THEN salario = 9000.00
    ELSE salario = 0.00
    END AS salario_teste
FROM professor;
 
DESC professor;

SELECT * FROM professor;

SELECT
CONCAT('Hello ', 'World');

INSERT INTO atleta (cpf) VALUES
('12345678910');

SELECT
IFNULL(nome, 'SEM NOME')
FROM atleta;

SELECT 
CONCAT(IFNULL(nome, ' SEM NOME' ),' ',modalidade)
FROM atleta;

CREATE TABLE atleta(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
modalidade VARCHAR(30),
CPF CHAR(11) NOT NULL,
dtCadastro DATETIME DEFAULT CURRENT_TIMESTAMP(),
qtdMedalhas INT,
CONSTRAINT cModalidade CHECK (modalidade IN('Atletismo', 'Natação', 'Futebol de botão'))  
);

INSERT INTO atleta (nome, modalidade, cpf, qtdMedalhas) VALUES
('Phelps', 'Natação','12345678910', 28),
('Guilherme', 'Natação', '33333333333', 20),
('Raphael', 'Futebol de Botão', '44444444444', 10),
('Rafael', 'Futebol de Botão', '55555555555', 9);

-- SELECT COM CASE, IFNULL, CONCAT, ALIAS

SELECT
CASE
WHEN qtdMedalhas > 2 THEN 'Muito bom !'
WHEN qtdMedalhas < 1 THEN 'VIXE! SEM MEDALHA'
ELSE 'TÁ NO CAMINHO! KEEP GOING!'
END AS performance,
CASE
WHEN modalidade = 'FUTEBOL DE BOTÃO' THEN 'DIFERENCIADO'
ELSE 'PADRÃO'
END AS descrcao_modalidade,
IFNULL(nome, 'SEU NOME'),
CONCAT('CPF:', cpf, '/ Cadastro na data: '
, dtCadastro) AS info_registro
FROM atleta
WHERE nome LIKE 'R%'
AND nome LIKE '%L'
OR nome NOT LIKE 'P%';


 