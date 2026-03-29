-- PEDRO LUDOVIC NASCIMENTO LIMA

USE sprint1;


-- Exercício 1:

-- Exibir todos os dados da tabela.
SELECT * FROM Atleta;
-- Atualizar a quantidade de medalhas do atleta com id=1;
UPDATE Atleta SET qtdMedalha = 5 WHERE idAtleta = 1;
-- Atualizar a quantidade de medalhas do atleta com id=2 e com o id=3;
UPDATE Atleta SET qtdMedalha = 3 WHERE idAtleta IN(2,3); 
-- Atualizar o nome do atleta com o id=4;
UPDATE Atleta SET nome = 'Matheus jacob' WHERE idAtleta = 4;
-- Adicionar o campo dtNasc na tabela, com a data de nascimento dos atletas, tipo date;
ALTER TABLE Atleta ADD COLUMN dtNasc DATE;
-- Atualizar a data de nascimento de todos os atletas;
UPDATE Atleta SET dtNasc = '1991-06-15' WHERE idAtleta = 1;
UPDATE Atleta SET dtNasc = '1996-04-25' WHERE idAtleta = 2;
UPDATE Atleta SET dtNasc = '1999-09-15' WHERE idAtleta = 3;
UPDATE Atleta SET dtNasc = '1996-01-25' WHERE idAtleta = 4;
UPDATE Atleta SET dtNasc = '1994-09-30' WHERE idAtleta = 5;
UPDATE Atleta SET dtNasc = '1993-05-01' WHERE idAtleta = 6;
UPDATE Atleta SET dtNasc = '1994-04-03' WHERE idAtleta = 7;
UPDATE Atleta SET dtNasc = '1995-07-05' WHERE idAtleta = 8;
-- Excluir o atleta com o id=5;
DELETE FROM Atleta WHERE idAtleta = 5;
-- Exibir os atletas onde a modalidade é diferente de natação;
SELECT * FROM Atleta WHERE modalidade <> 'Natação';
-- Exibir os dados dos atletas que tem a quantidade de medalhas maior ou igual a 3;
SELECT * FROM Atleta WHERE qtdMedalha >= 3;
-- Modificar o campo modalidade do tamanho 40 para o tamanho 60;
ALTER TABLE Atleta MODIFY COLUMN modalidade VARCHAR(60);
-- Descrever os campos da tabela mostrando a atualização do campo modalidade;
DESC Atleta;
-- Limpar os dados da tabela;
TRUNCATE TABLE Atleta;


-- Exercício 2:

-- Exibir todos os dados da tabela.
SELECT * FROM Musica;
-- Adicionar o campo curtidas do tipo int na tabela;
ALTER TABLE Musica ADD COLUMN curtidas INT; 
-- Atualizar o campo curtidas de todas as músicas inseridas;
UPDATE Musica SET curtidas = 500 WHERE idMusica = 1;
UPDATE Musica SET curtidas = 100 WHERE idMusica = 2;
UPDATE Musica SET curtidas = 600 WHERE idMusica = 3;
UPDATE Musica SET curtidas = 400 WHERE idMusica = 4;
UPDATE Musica SET curtidas = 2000 WHERE idMusica = 5;
UPDATE Musica SET curtidas = 1400 WHERE idMusica = 6;
UPDATE Musica SET curtidas = 1000 WHERE idMusica = 7;
UPDATE Musica SET curtidas = 100 WHERE idMusica = 8;
-- Modificar o campo artista do tamanho 40 para o tamanho 80;
ALTER TABLE Musica MODIFY COLUMN artistas VARCHAR(80);
-- Atualizar a quantidade de curtidas da música com id=1;
UPDATE Musica SET curtidas = 6000 WHERE idMusica = 1;
-- Atualizar a quantidade de curtidas das músicas com id=2 e com o id=3;
UPDATE Musica SET curtidas = 4500 WHERE idMusica IN(2,3);
-- Atualizar o nome da música com o id=5;
UPDATE Musica SET titulo = 'From can to cant' WHERE idMusica = 1;
-- Excluir a música com o id=4;
DELETE FROM Musica WHERE idMusica = 4;
-- Exibir as músicas onde o gênero é diferente de funk;
SELECT * FROM Musica WHERE idMusica <> 'funk';
-- Exibir os dados das músicas que tem curtidas maior ou igual a 20;
SELECT * FROM Musica WHERE curtidas >= 20;
-- Descrever os campos da tabela mostrando a atualização do campo artista;
DESC Musica;
-- Limpar os dados da tabela;
TRUNCATE TABLE Musica;

-- Exercício 3:

-- Exibir todos os dados da tabela.
SELECT * FROM Filme;
-- Adicionar o campo protagonista do tipo varchar(50) na tabela;
ALTER TABLE Filme ADD COLUMN protagonista VARCHAR(50);
-- Atualizar o campo protagonista de todas os filmes inseridos;
UPDATE Filme SET protagonista = 'T-REX' WHERE idFIlme = 1;
UPDATE Filme SET protagonista = 'Rinoceronte' WHERE idFIlme = 2;
UPDATE Filme SET protagonista = 'Django' WHERE idFIlme = 3;
UPDATE Filme SET protagonista = 'KILL BILL' WHERE idFIlme = 4;
UPDATE Filme SET protagonista = 'Leonado de Caprio' WHERE idFIlme = 5;
UPDATE Filme SET protagonista = 'Alpacino' WHERE idFIlme = 6;
UPDATE Filme SET protagonista = 'Edward' WHERE idFIlme = 7;
UPDATE Filme SET protagonista = 'Chapeleiro Maluco' WHERE idFIlme = 8;
-- Modificar o campo diretor do tamanho 40 para o tamanho 150;
ALTER TABLE Filme MODIFY COLUMN diretor VARCHAR(150);
-- Atualizar o diretor do filme com id=5;
UPDATE Filme SET diretor = 'Leonado di Caprio' WHERE idFilme = 5; 
-- Atualizar o diretor dos filmes com id=2 e com o id=7;
UPDATE Filme SET diretor = 'PEDRO' WHERE idFilme IN(2,7);
-- Atualizar o título do filme com o id=6;
UPDATE Filme SET titulo = 'GOAT' WHERE idFilme = 6;
-- Excluir o filme com o id=3;
DELETE FROM Filme WHERE idFilme = 3;
-- Exibir os filmes em que o gênero é diferente de drama;
SELECT * FROM Filme WHERE genero <> 'drama';
-- Exibir os dados dos filmes que o gênero é igual ‘suspense’;
SELECT * FROM Filme WHERE genero = 'suspense';
-- Descrever os campos da tabela mostrando a atualização do campo protagonista e diretor;
DESC Filme;

-- Exercício 4:

-- Exibir todos os dados da tabela. DESC Professor;
SELECT * FROM Professor;
-- Adicionar o campo funcao do tipo varchar(50), onde a função só pode ser ‘monitor’, ‘assistente’ ou ‘titular’;
ALTER TABLE Professor ADD COLUMN funcao VARCHAR(50) CHECK (funcao IN ('monitor', 'assistente', 'titular'));
-- Atualizar os professores inseridos e suas respectivas funções;
UPDATE Professor SET funcao = 'titular' WHERE idProfessor = 1;
UPDATE Professor SET funcao = 'assistente' WHERE idProfessor = 2;
UPDATE Professor SET funcao = 'monitor' WHERE idProfessor = 3;
UPDATE Professor SET funcao = 'titular' WHERE idProfessor = 4;
UPDATE Professor SET funcao = 'assistente' WHERE idProfessor = 5;
UPDATE Professor SET funcao = 'monitor' WHERE idProfessor = 6;
UPDATE Professor SET funcao = 'titular' WHERE idProfessor = 7;
UPDATE Professor SET funcao = 'assitente' WHERE idProfessor = 8;
-- Inserir um novo professor;
INSERT INTO Professor (idProfessor, nome, especialidade, dtNasc, funcao) VALUES 
(7, 'Pedro', 'Algoritmo', '2007-06-15', 'titular');
-- Excluir o professor onde o idProfessor é igual a 5;
DELETE FROM Professor WHERE idProfessor = 5;
-- Exibir apenas os nomes dos professores titulares;
SELECT * FROM Professor WHERE funcao = 'titular';
-- Exibir apenas as especialidades e as datas de nascimento dos professores monitores;
SELECT especialidade, dtNasc FROM Professor WHERE funcao = 'monitor';
-- Atualizar a data de nascimento do idProfessor igual a 3;
UPDATE Professor SET dtNasc  = '1900-03-05' WHERE idProfessor = 3;
-- Limpar a tabela Professor;
TRUNCATE Professor;

-- Exercício 5:

CREATE TABLE Curso (
    idCurso INT PRIMARY KEY,
    nome VARCHAR(50),
    sigla VARCHAR(3),
    coordenador VARCHAR(100)
);

INSERT INTO Curso (idCurso, nome, sigla, coordenador) VALUES
(1, 'Análise e Desenvolvimento de Sistemas', 'ADS', 'Carlos Silva'),
(2, 'Engenharia de Software', 'ESW', 'Mariana Souza'),
(3, 'Ciência da Computação', 'CCO', 'João Pereira');

-- Exibir todos os dados da tabela.
SELECT * FROM Curso;
-- Exibir apenas os coordenadores dos cursos.
SELECT coordenador FROM Curso;
-- Exibir apenas os dados dos cursos de uma determinada sigla.
SELECT * FROM  Curso WHERE sigla = 'ADS';
-- Exibir os dados da tabela ordenados pelo nome do curso.
SELECT * FROM Curso ORDER BY nome;
-- Exibir os dados da tabela ordenados pelo nome do coordenador em ordem decrescente.
SELECT * FROM Curso ORDER BY coordenador DESC;
-- Exibir os dados da tabela, dos cursos cujo nome comece com uma determinada letra.
SELECT * FROM  Curso WHERE nome LIKE 'a%';
-- Exibir os dados da tabela, dos cursos cujo nome termine com uma determinada letra.
SELECT * FROM  Curso WHERE nome LIKE '%a%';
-- Exibir os dados da tabela, dos cursos cujo nome tenha como segunda letra uma determinada letra.
SELECT * FROM  Curso WHERE nome LIKE '_n%';
-- Exibir os dados da tabela, dos cursos cujo nome tenha como penúltima letra uma determinada letra.
SELECT * FROM  Curso WHERE nome LIKE '%a_';
-- Elimine a tabela
DROP TABLE Curso;

-- Exercício 6:

CREATE TABLE Revista (
    idRevista INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    categoria VARCHAR(30)
);

INSERT INTO Revista (nome, categoria) VALUES
('Claudia', 'Moda'),
('Superinteressante', 'Ciência'),
('Exame', 'Economia');

-- Exibir todos os dados da tabela.
SELECT * FROM Revista;
-- Atualize os dados das categorias das 3 revistas inseridas. Exibir os dados da tabela novamente para verificar se atualizou corretamente.
UPDATE Revista SET categoria = 'Notícias' WHERE idRevista = 1;
UPDATE Revista SET categoria = 'Atualidades' WHERE idRevista = 2;
UPDATE Revista SET categoria = 'Política' WHERE idRevista = 3;

SELECT * FROM Revista;
-- Insira mais 3 registros completos.
INSERT INTO Revista (nome, categoria) VALUES
('Claudia', 'Moda'),
('Superinteressante', 'Ciência'),
('Exame', 'Economia');
-- Exibir novamente os dados da tabela.
SELECT * FROM Revista;
-- Exibir a descrição da estrutura da tabela.
DESC Revista;
-- Alterar a tabela para que a coluna categoria possa ter no máximo 40 caracteres.
ALTER TABLE Revista MODIFY COLUMN categoria VARCHAR(40);
-- Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o tamanho da coluna categoria
DESC Revista;
-- Acrescentar a coluna periodicidade à tabela, que é varchar(15).
ALTER TABLE Revista ADD COLUMN periodicidade VARCHAR(15);
-- Exibir os dados da tabela.
SELECT * FROM Revista;
-- Excluir a coluna periodicidade da tabela.
ALTER TABLE Revista DROP COLUMN periodicidade;

-- Exercício 7:
CREATE TABLE Carro (
    idCarro INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    placa CHAR(7)
) AUTO_INCREMENT = 1000;

INSERT INTO Carro (nome, placa) VALUES
('Gol', 'ABC1234'),
('Fusca', 'DEF5678'),
('Onix', 'GHI9012'),
('HB20', 'JKL3456');

-- Exibir todos os dados da tabela.
SELECT * FROM Carro;
-- Insira mais 3 registros sem a placa dos carros.
INSERT INTO Carro (nome) VALUES
('Corolla'),
('Civic'),
('Palio');
-- Exibir novamente os dados da tabela.
SELECT * FROM Carro;
-- Exibir a descrição da estrutura da tabela.
DESC Carro;
-- Alterar a tabela para que a coluna nome possa ter no máximo 28 caracteres.
ALTER TABLE Carro MODIFY COLUMN nome VARCHAR(28);
-- Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o tamanho da coluna;
DESC Carro;
-- Acrescentar a coluna ano à tabela, que é char(4);
ALTER TABLE Carro ADD COLUMN ano CHAR(4);
-- Atualizar todos os dados nulos da tabela;
UPDATE Carro SET placa = 'SEM0000' WHERE idCarro IN(5,6,7);
UPDATE Carro SET ano = '2024' WHERE IdCarro IN(5,6,7);



