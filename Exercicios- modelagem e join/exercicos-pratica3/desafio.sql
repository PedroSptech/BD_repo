USE sprint2;


CREATE TABLE Time (
    idTime INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    estado CHAR(2)
);


CREATE TABLE Tecnico (
    idTecnico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    fkTime INT,
    CONSTRAINT fk_tecnico_time FOREIGN KEY (fkTime) REFERENCES Time(idTime)
);


CREATE TABLE Escalacao (
    idEscalacao INT PRIMARY KEY AUTO_INCREMENT,
    numJogador CHAR(3),
    nome VARCHAR(45),
    posicao VARCHAR(45),
    tipo VARCHAR(45),
    dtJogo DATETIME,
    fkTecnico INT,
    CONSTRAINT fk_escalacao_tecnico FOREIGN KEY (fkTecnico) REFERENCES Tecnico(idTecnico)
);