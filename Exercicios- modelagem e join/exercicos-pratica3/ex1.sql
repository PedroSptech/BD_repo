USE sprint2;

CREATE TABLE Atleta (
    idAtleta INT PRIMARY KEY,
    nome VARCHAR(40),
    modalidade VARCHAR(40),
    qtdMedalha INT,
    fkPais INT,
    CONSTRAINT fkAtletaPais FOREIGN KEY (fkPais) REFERENCES pais(idPais)
);

INSERT INTO Atleta (idAtleta, nome, modalidade, qtdMedalha, fkPais) VALUES
(1, 'Rebeca Andrade', 'Ginástica Artística', 6, 1), 
(2, 'Simone Biles', 'Ginástica Artística', 11, 2),
(3, 'Gabriel Medina', 'Surfe', 1, 1),
(4, 'Ítalo Ferreira', 'Surfe', 1, 1),
(5, 'Caeleb Dressel', 'Natação', 9, 2),
(6, 'Katie Ledecky', 'Natação', 14, 2);

CREATE TABLE pais (
    idPais INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30),
    capital VARCHAR(40)
);

INSERT INTO pais (nome, capital) VALUES
('Brasil', 'Brasília'),
('EUA', 'Washington'),
('França', 'Paris'),
('Canadá', 'Ottawa'),
('Austrália', 'Camberra');

UPDATE Atleta SET fkPais = 1 WHERE idAtleta BETWEEN 2 AND 5;

SELECT 
    a.nome AS Atleta, 
    a.modalidade, 
    a.qtdMedalha,
    p.nome AS Pais 
FROM Atleta AS a
JOIN pais AS p ON a.fkPais = p.idPais;

SELECT 
    a.nome AS Atleta, 
    p.nome AS Pais 
FROM Atleta AS a
JOIN pais AS p ON a.fkPais = p.idPais;

SELECT a.nome AS Atleta, 
    a.modalidade, 
    a.qtdMedalha,
    p.nome AS Pais
FROM Atleta AS a 
JOIN Pais AS p ON a.fkPais = p.idPais WHERE p.capital = 'Brasília';