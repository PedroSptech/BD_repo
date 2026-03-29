-- Exercício 1:
CREATE DATABASE sprint1;
USE sprint1;

CREATE TABLE Atleta(
	idAtleta INT PRIMARY KEY,
    nome VARCHAR(40),
    modalidade VARCHAR(40),
    qtdMedalha INT
);

insert into Atleta(idAtleta, nome, modalidade, qtdMedalha) VALUES
(1,'Matheus Jacob', 'Basquete', 0),
(2, 'Pedro Luodovic', 'Natação',6),
(3, 'Vitor da Luz', 'Badminton',7),
(4, 'Lucas Gama', 'Xadrez',4),
(5, 'Raphael Canuto ', 'Xadrez',5),
(6, 'Marina Santos Paixão', 'Natação', 3),
(7, 'Marcos Antônio', 'Basquete', 8),
(8, 'Thiago', 'Badminton', 3);

-- Exibir todos os dados da tabela

SELECT * FROM Atleta;

-- Exibir apenas os nomes e quantidade de medalhas dos atletas

SELECT nome, qtdMedalha FROM Atleta;

-- Exibir apenas os dados dos atletas de uma determinada modalidade

SELECT * FROM Atleta WHERE modalidade='Basquete';

-- Exibir os dados da tabela ordenados pela modalidade

SELECT * FROM Atleta ORDER BY modalidade; 

-- Exibir os dados da tabela, ordenados pela quantidade de medalhas, em ordem decrescente

SELECT * FROM Atleta ORDER BY  qtdMedalha desc;

-- Exibir os dados da tabela, dos atletas cujo nome contenha a letra s

SELECT * FROM Atleta WHERE nome LIKE '%s%';

-- Exibir os dados da tabela, dos atletas cujo nome comece com uma determinada letra

SELECT * FROM Atleta WHERE nome LIKE 'L%';

-- Exibir os dados da tabela, dos atletas cujo nome termine com a letra o

SELECT * FROM Atleta WHERE nome LIKE '%O';

-- Exibir os dados da tabela, dos atletas cujo nome tenha a penúltima letra r

SELECT * FROM Atleta WHERE nome LIKE '%O_';

--  Eliminar a tabela

DROP TABLE Atleta;

-- Exercício 2:

CREATE TABLE Musica(
idMusica INT PRIMARY KEY,
titulo VARCHAR(40),
artistas VARCHAR(40),
genero VARCHAR(40)
);

INSERT INTO Musica (idMusica, titulo, artistas, genero)VALUES
(1,'The Pretender','Foo Fighters', 'rock'),
(2, 'Learn to fly', 'Foo Fighters', 'rock'),
(3, 'You know my name', 'Chris Cornell', 'grunge'),
(4, 'Black Hole Sun', 'Chris Cornell', 'grunge'),
(5, 'Poema', 'Ney Matogrosso', 'MPB'),
(6, 'Homem com H', 'Ney Matogrosso', 'MPB'),
(7, 'Até que durou', 'PERICLES', 'Samba'),
(8, 'Melhor eu ir', 'PERICLES', 'Samba');

-- Exibir todos os dados da tabela

SELECT * FROM Musica;

-- Exibir apenas os títulos e os artistas das músicas

SELECT titulo, artistas FROM Musica;

-- Exibir apenas os dados das músicas de um determinado gênero

SELECT * FROM Musica WHERE genero = 'MPB';

-- Exibir apenas os dados das músicas de um determinado artista

SELECT * FROM Musica WHERE artistas = 'pericles';

-- Exibir os dados da tabela ordenados pelo título da música

SELECT * FROM Musica ORDER BY titulo;

-- Exibir os dados da tabela ordenados pelo artista em ordem decrescente

SELECT * FROM Musica ORDER BY artistas DESC;

-- Exibir os dados da tabela, das músicas cujo título comece com uma determinada letra

SELECT * FROM Musica WHERE titulo LIKE 'T%';

-- Exibir os dados da tabela, das músicas cujo artista termine com uma determinada letra

SELECT * FROM Musica WHERE artistas LIKE '%L';

-- Exibir os dados da tabela, das músicas cujo gênero tenha como segunda letra uma determinada letra

SELECT * FROM Musica WHERE genero LIKE '_R%';

-- Exibir os dados da tabela, das músicas cujo título tenha como penúltima letra uma determinada letra

SELECT * FROM Musica WHERE titulo LIKE '%m_';

-- Elimine a tabela

DROP TABLE Musica;

-- Exercício 3:

Create table Filme(
idFilme INT PRIMARY KEY,
titulo VARCHAR(50),
genero VARCHAR(40),
diretor VARCHAR(40)
);

INSERT INTO Filme (idFilme, titulo, genero, diretor) VALUES
(1,'Jurasic Park','Ficção','Steven Spilberg'),
(2, 'Jurasic Park 2', 'Ficção', 'Steven Spilberg'),
(3,'Django livre', 'Histórico', 'Quentin Tarantino'),
(4, 'Kill Bill', 'Ação', 'Quentin Tarantino'),
(5, 'O Lobo de Wall Street','Comédia', 'Martin Scorsese'),
(6, 'Os infiltrados','Suspense', 'Martin Scorsese'),
(7, 'Edward Mãos de Tesoura ', 'Fantasia', 'Tim Burton'),
(8, 'Alice no País das Maravilhas', 'Fantasia', 'Tim Burton');

-- Exibir todos os dados da tabela
SELECT * FROM Filme ;
-- Exibir apenas os títulos e os diretores dos filmes
SELECT titulo,diretor FROM Filme ;
-- Exibir apenas os dados dos filmes de um determinado gênero
SELECT * FROM Filme WHERE genero='Ficção';
-- Exibir apenas os dados dos filmes de um determinado diretor
SELECT * FROM Filme WHERE diretor='Tim Burton';
-- Exibir os dados da tabela ordenados pelo título do filme
SELECT * FROM Filme ORDER BY titulo;
-- Exibir os dados da tabela ordenados pelo diretor em ordem decrescente
SELECT * FROM Filme ORDER BY diretor;
-- Exibir os dados da tabela, dos filmes cujo título comece com uma determinada letra
SELECT * FROM Filme WHERE titulo LIKE 'O%';
-- Exibir os dados da tabela, dos filmes cujo diretor termine com uma determinada letra
SELECT * FROM Filme WHERE diretor LIKE '%E';
-- Exibir os dados da tabela, dos filmes cujo gênero tenha como segunda letra uma determinada letra
SELECT * FROM Filme WHERE genero LIKE '_Ç%';
-- Exibir os dados da tabela, dos filmes cujo título tenha como penúltima letra uma determinada letra
SELECT * FROM Filme WHERE titulo LIKE '%E_';
-- Elimine a tabela
DROP TABLE Filme;


-- Exercício 4:
CREATE TABLE Professor(
idProfessor INT PRIMARY KEY,
nome VARCHAR(50),
especialidade VARCHAR(40),
dtNasc DATE 
);

INSERT INTO Professor(idProfessor, nome, especialidade, dtNasc) VALUES
(1,'Vivian','Banco de Dados','1983-10-13'),
(2,'Marcos Antônio', 'Tecnologia da informação', '1964-9-14'),
(3,'Gyuliana', 'Algoritmo', '1995-6-7'),
(4,'Matheus Matos', 'Algoritmo', '1997-4-3'),
(5, 'Fernado Brandão', 'Pesquisa e inovação', '1976-3-1'),
(6, 'Thiago Bonacelli', 'Socio Emocional', '1985-6-3');

-- Exibir todos os dados da tabela
SELECT * FROM Professor;
-- Exibir apenas as especialidades dos professores
SELECT especialidade FROM Professor;
-- Exibir apenas os dados dos professores de uma determinada especialidade
SELECT * FROM Professor WHERE especialidade = 'Algoritmo';
-- Exibir os dados da tabela ordenados pelo nome do professor
SELECT * FROM Professor ORDER BY nome;
-- Exibir os dados da tabela ordenados pela data de nascimento do professor em ordem decrescente
SELECT * FROM Professor ORDER BY dtNasc DESC;
-- Exibir os dados da tabela, dos professores cujo nome comece com uma determinada letra
SELECT * FROM Professor WHERE nome LIKE 'T%';
-- Exibir os dados da tabela, dos professores cujo nome termine com uma determinada letra
SELECT * FROM Professor WHERE nome LIKE '%O';
-- Exibir os dados da tabela, dos professores cujo nome tenha como segunda letra uma determinada letra
SELECT * FROM Professor WHERE nome LIKE '_Y%';
-- Exibir os dados da tabela, dos professores cujo nome tenha como penúltima letra uma determinada letra
SELECT * FROM Professor WHERE nome LIKE '%a_';
-- Elimine a tabela
DROP TABLE  Professor;

-- Exercício 5:
CREATE TABLE Jogo(
idJogo INT PRIMARY KEY,
nome VARCHAR(50),
comentario VARCHAR(200),
ranking INT
);

INSERT INTO Jogo(idJogo, nome, comentario, ranking) VALUES
(1,'Death Stranding', 'Death Stranding é um jogo de ação e aventura de 2019 desenvolvido pela Kojima Productions e publicado pela Sony Interactive Entertainment.', 1),
(2,'Metal Gear Solid V: The Phantom Pain' ,'é um jogo de ação e aventura com elementos de furtividade, lançado em 2015 e desenvolvido e publicado pela Konami.', 2),
(3,'Minecraft', 'Minecraft é um jogo sandbox desenvolvido e publicado pela Mojang Studios.',3),
(4, 'Alan Wake', 'Alan Wake é um jogo de ação e aventura de 2010 desenvolvido pela Remedy Entertainment e publicado pela Microsoft Game Studios.', 4),
(5, 'Control','Control é um jogo de ação e aventura de 2019 desenvolvido pela Remedy Entertainment.', 5 ),
(6, 'Star Wars Jedi: Fallen Order', 'Star Wars Jedi: Fallen Order é um jogo de ação e aventura de 2019 desenvolvido pela Respawn Entertainment e publicado pela Electronic Arts.', 6);

-- Exibir todos os dados da tabela
SELECT * FROM Jogo;
-- Exibir apenas os nomes dos jogos
SELECT nome FROM Jogo;
-- Exibir apenas o comentário de um determinado jogo
SELECT comentario FROM Jogo WHERE nome = 'Alan Wake';
-- Exibir os dados da tabela ordenados pelo nome do jogo
SELECT * FROM Jogo ORDER BY nome;
-- Exibir os dados da tabela ordenados pelo ranking em ordem decrescente
SELECT * FROM Jogo ORDER BY ranking DESC;
-- Exibir os dados da tabela, dos jogos cujo nome comece com uma determinada letra
SELECT * FROM Jogo WHERE nome LIKE 'S%';
-- Exibir os dados da tabela, dos jogos cujo nome termine com uma determinada letra
SELECT * FROM Jogo WHERE nome LIKE '%L';
-- Exibir os dados da tabela, dos jogos cujo nome tenha como segunda letra uma determinada letra
SELECT * FROM Jogo WHERE nome LIKE '_E%';
-- Exibir os dados da tabela, dos jogos cujo nome tenha como penúltima letra uma determinada letra
SELECT * FROM Jogo WHERE nome LIKE '%k_';
-- Exibir os dados da tabela, dos jogos cujo nome seja diferente de Minecraft
SELECT nome FROM Jogo WHERE nome NOT LIKE 'Minecraft';
-- Elimine a tabela
DROP TABLE Jogo;




