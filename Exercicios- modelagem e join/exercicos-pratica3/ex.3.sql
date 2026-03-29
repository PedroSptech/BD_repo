use sprint2;

CREATE TABLE pessoa(
idPessoa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
cpf CHAR(11)
);

INSERT INTO pessoa (nome, cpf) VALUES 
('Ana Souza', '12345678901'),
('Carlos Oliveira', '98765432100'),
('Beatriz Mendes', '45678912344');

CREATE TABLE Reserva(
idReserva INT PRIMARY KEY AUTO_INCREMENT,
dtReserva DATETIME,
dtRetirada DATETIME,
dtDevolucao DATETIME,
fkPessoa INT,
CONSTRAINT ctFKPessoa FOREIGN KEY (fkPessoa) REFERENCES pessoa(idPessoa)
);

INSERT INTO Reserva (dtReserva, dtRetirada, dtDevolucao, fkPessoa) VALUES 
('2024-03-20 10:00:00', '2024-03-21 08:30:00', '2024-03-25 18:00:00', 1),
('2024-03-21 14:20:00', '2024-03-22 09:00:00', '2024-03-23 09:00:00', 2),
('2024-03-22 11:00:00', '2024-03-22 13:00:00', '2024-03-24 13:00:00', 1);

SELECT * FROM pessoa;
SELECT * FROM Reserva;

SELECT p.nome AS 'NOMES', p.cpf AS 'CPF', r.dtReserva  AS 'Data de reserva' FROM pessoa AS p JOIN Reserva AS r ON r.fkPessoa = p.idPessoa;

SELECT 
    p.nome AS 'NOMES',
    p.cpf AS 'CPF',
    r.dtReserva AS 'Data de reserva',
CASE
	WHEN r.dtReserva < '2007-11-01' THEN 'ANTIGO'
	ELSE 'NOVOS'
    END AS 'Categoria'
FROM
    pessoa AS p
        JOIN
    Reserva AS r ON r.fkPessoa = p.idPessoa;
    
SELECT p.nome, IFNULL(cpf, 'CPF não cadastrado') AS 'CPF' FROM pessoa AS p;
