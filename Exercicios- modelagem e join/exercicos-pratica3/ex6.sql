use sprint2;

CREATE TABLE Endereco (
    idEndereco INT PRIMARY KEY AUTO_INCREMENT,
    logradouro VARCHAR(100),
    numero VARCHAR(10),
    bairro VARCHAR(50),
    cidade VARCHAR(50)
);

CREATE TABLE Farmacia (
    idFarmacia INT PRIMARY KEY AUTO_INCREMENT,
    nomeFantasia VARCHAR(100),
    cnpj CHAR(14),
    fkEndereco INT UNIQUE,
    CONSTRAINT fk_farmacia_endereco 
        FOREIGN KEY (fkEndereco) REFERENCES Endereco(idEndereco)
);

CREATE TABLE Farmaceutico (
    idFarmaceutico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    crf VARCHAR(20),
    salario DECIMAL(10, 2),
    fkFarmacia INT,
    CONSTRAINT fk_farmaceutico_farmacia FOREIGN KEY (fkFarmacia) REFERENCES Farmacia(idFarmacia)
);


INSERT INTO Endereco VALUES 
( 'Av. Paulista', '1000', 'Bela Vista', 'São Paulo'),
( 'Rua Augusta', '500', 'Consolação', 'São Paulo'),
( 'Av. Brigadeiro', '150', 'Liberdade', 'São Paulo'),
( 'Rua das Flores', '12', 'Centro', 'Curitiba'),
( 'Praça da Sé', 'S/N', 'Sé', 'São Paulo');


INSERT INTO Farmacia VALUES 
( 'Droga Tech', '12345678000101', 1),
( 'Saúde & Cia', '98765432000102', 2),
( 'Bio Farmas', '11223344000103', 3),
( 'Farmácia Popular', '55667788000104', 4),
( 'Remédio Rápido', '99001122000105', 5);


INSERT INTO Farmaceutico VALUES 
( 'Carlos Eduardo', 'CRF123', 4500.00, 1),
( 'Ana Beatriz', 'CRF456', 5200.00, 1),
( 'Marcos Paulo', 'CRF789', NULL , 2), 
( 'Juliana Silva', 'CRF321', 4800.00, 3),
( 'Ricardo Souza', 'CRF654', 6000.00, 4);

SELECT 
    f.nome AS 'Nome do Profissional',
    far.nomeFantasia AS 'Local de Trabalho'
FROM Farmaceutico AS f
JOIN Farmacia AS far ON f.fkFarmacia = far.idFarmacia;

SELECT 
    nome,
    IFNULL(salario, 0) AS 'Salário Atual',
    CASE 
        WHEN salario >= 5000 THEN 'Nível Sênior'
        WHEN salario < 5000 THEN 'Nível Pleno'
        ELSE 'A definir'
    END AS 'Categoria Profissional'
FROM Farmaceutico;

SELECT * FROM Farmaceutico
JOIN Farmacia ON fkFarmacia = idFarmacia
JOIN Endereco ON fkEndereco = idEndereco;