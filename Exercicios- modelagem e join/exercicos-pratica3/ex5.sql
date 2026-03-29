USE sprint2;

CREATE TABLE Candidato (
    idCandidato INT PRIMARY KEY AUTO_INCREMENT,
    nome_Candidato VARCHAR(100),
    cpf CHAR(11) UNIQUE,
    dataNascimento DATE
);

CREATE TABLE ProcessoCNH (
    idProcesso INT PRIMARY KEY AUTO_INCREMENT,
    categoria CHAR(2),
    validadeProcesso DATE,
    fkCandidato INT UNIQUE,
    CONSTRAINT fkHabPessoa FOREIGN KEY (fkCandidato) REFERENCES Candidato(idCandidato)
);

SELECT 
    nome_Candidato AS 'Nome do Motorista', 
    cpf AS 'Registro CPF' 
FROM Candidato;	

SELECT 
    idProcesso, 
    categoria,
    CASE 
        WHEN categoria = 'A' THEN 'Moto'
        WHEN categoria = 'B' THEN 'Carro'
        WHEN categoria = 'AB' THEN 'Moto e Carro'
        ELSE 'Não Definido'
    END AS 'Tipo de Veículo'
FROM ProcessoCNH;

SELECT 
    idProcesso, 
    IFNULL(validadeProcesso, 'Em Análise') AS 'Status Validade' 
FROM ProcessoCNH;