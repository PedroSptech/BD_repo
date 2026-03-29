USE sprint2;

CREATE TABLE Pessoa1 (
    idPessoa1 INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    dtNascimento DATE
);

CREATE TABLE Pessoa2 (
    idPessoa2 INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    dtNascimento DATE,
    fkPessoa1 INT UNIQUE,
    CONSTRAINT fk_pessoa2_pessoa1 FOREIGN KEY (fkPessoa1) REFERENCES Pessoa1(idPessoa1)
);

SELECT * FROM Pessoa1;
SELECT * FROM Pessoa2;

SELECT 
    p1.nome AS 'Nome Pessoa 1',
    p1.dtNascimento AS 'Data de nasciemento pessoa 1',
    p2.nome AS 'Nome Pessoa 2',
    p2.dtNascimento AS 'Data de nasciemento pessoa 2'
FROM
    Pessoa1 AS p1
        JOIN
    Pessoa2 AS p2 ON p2.fkPessoa1 = p1.idPessoa1;
    
SELECT 
	p1.nome AS 'Nome Pessoa 1',
    p1.dtNascimento AS 'Data de nasciemento pessoa 1',
    p2.nome AS 'Nome Pessoa 2',
    p2.dtNascimento AS 'Data de nasciemento pessoa 2',
CASE 
	WHEN p2.nome LIKE 'Filho da%' THEN 'FILHO'
    ELSE NULL 
    END AS 'PARENTESCO'
FROM
    Pessoa1 AS p1
        JOIN
    Pessoa2 AS p2 ON p2.fkPessoa1 = p1.idPessoa1;


SELECT 
	p1.nome AS 'Nome Pessoa 1',
    p1.dtNascimento AS 'Data de nasciemento pessoa 1',
    p2.nome AS 'Nome Pessoa 2',
    IFNULL(p2.nome, 'SEM NOME'),
    p2.dtNascimento AS 'Data de nasciemento pessoa 2',
CASE 
	WHEN p2.nome LIKE 'Filho da%' THEN 'FILHO'
    ELSE NULL 
    END AS 'PARENTESCO'
FROM
    Pessoa1 AS p1
        JOIN
    Pessoa2 AS p2 ON p2.fkPessoa1 = p1.idPessoa1;

