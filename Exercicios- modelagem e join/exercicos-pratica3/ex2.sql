USE sprint2;

CREATE TABLE Album (
    idAlbum INT PRIMARY KEY,
    nome VARCHAR(40),
    tipo VARCHAR(10),
    dtLancamento DATE,
    CONSTRAINT ctTipo CHECK(tipo IN('digital', 'físico'))
);


INSERT INTO Album VALUES 
(1, 'Hybrid Theory', 'digital', '2000-10-24'),
(2, 'After Hours', 'físico', '2020-03-20');


CREATE TABLE Musica (
    idMusica INT PRIMARY KEY,
    titulo VARCHAR(40),
    artista VARCHAR(40),
    genero VARCHAR(40),
    fkAlbum INT,
    CONSTRAINT ctFKAlbum FOREIGN KEY (fkAlbum) REFERENCES Album(idAlbum)
);


INSERT INTO Musica VALUES 
(1, 'In the End', 'Linkin Park', 'Rock', 1),
(2, 'Numb', 'Linkin Park', 'Rock', 1),
(3, 'Blinding Lights', 'The Weeknd', 'Pop', 2);

SELECT * FROM Musica;
SELECT * FROM Album;

UPDATE Album 
SET 
    nome = 'METEORA'
WHERE
    idAlbum = 1;-- Uma dúvida 

SELECT 
    m.titulo, m.artista, m.genero, a.nome AS 'Album'
FROM
    Musica AS m
        JOIN
    Album AS a ON m.fkAlbum = a.idAlbum;

SELECT 
    m.titulo, a.nome AS 'Album'
FROM
    Musica AS m
        JOIN
    Album AS a ON m.fkAlbum = a.idAlbum;

SELECT 
    m.titulo, m.artista, m.genero, a.nome AS 'Album'
FROM
    Musica AS m
        JOIN
    Album AS a ON m.fkAlbum = a.idAlbum
WHERE
    m.genero = 'Rock';

