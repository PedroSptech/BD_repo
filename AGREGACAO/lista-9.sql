CREATE DATABASE escola;
USE escola;

CREATE TABLE aluno(
idAluno INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
RA CHAR(11),
fk_grupo INT,
CONSTRAINT ctFKGrupo FOREIGN KEY (fk_grupo) REFERENCES grupo(idGrupo)
);
CREATE TABLE professor(
idProfessor INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
disciplina VARCHAR(45)
) AUTO_INCREMENT = 10000;

CREATE TABLE grupo(
idGrupo INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
descricao VARCHAR(45),
fk_professor INT,
CONSTRAINT ctFKProfessor FOREIGN KEY (fk_professor) REFERENCES professor(idProfessor)
);
CREATE TABLE avaliacao(
idAaliacao INT PRIMARY KEY AUTO_INCREMENT,
nota DECIMAL(3,2),

);

INSERT INTO professor (nome, disciplina) VALUES 
('Alan Turing', 'Algoritmos'),
('Ada Lovelace', 'Banco de Dados'),
('Grace Hopper', 'Sistemas Operacionais');

INSERT INTO grupo (nome, descricao, fk_professor) VALUES 
('Os Binários', 'Projeto de Automação Residencial', 10000),
('Data Wizards', 'Análise de Dados Governamentais', 10001),
('Code Breakers', 'Desenvolvimento de Criptografia', 10000);

INSERT INTO aluno (nome, RA, fk_grupo) VALUES 
('João Silva', '01234567890', 1),
('Maria Souza', '01234567891', 1),
('Carlos Oliveira', '01234567892', 2),
('Ana Costa', '01234567893', 3);

SELECT * FROM aluno;
SELECT * FROM professor;
SELECT * FROM grupo;

SELECT a.*, g.* FROM aluno AS a JOIN grupo AS g ON a.fk_grupo = g.idGrupo;

SELECT a.*, g.* FROM aluno AS a JOIN grupo AS g ON a.fk_grupo = g.idGrupo WHERE g.idGrupo = 1;

SELECT a.*, g.*, a.AVG() FROM aluno AS a JOIN grupo AS g ON a.fk_grupo = g.idGrupo;


