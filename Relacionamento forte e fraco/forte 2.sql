USE sprint2;

CREATE TABLE funcionario(
id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
cpf CHAR(11),
salario DECIMAL(7,2),
fk_supervisor INT,
CONSTRAINT ctFKSupervisor FOREIGN KEY (fk_supervisor) REFERENCES funcionario (id_funcionario)
);

CREATE TABLE dependenter(
id_dependente INT,
nome VARCHAR(45),
cpf CHAR(11) UNIQUE NOT NULL,
fk_funcionario INT,
CONSTRAINT chave_composta PRIMARY KEY (id_dependente, fk_funcionario),
CONSTRAINT ctFKFuncionario FOREIGN KEY (fk_funcionario) REFERENCES funcionario(id_funcionario)
);

INSERT INTO funcionario (nome, cpf, salario, fk_supervisor) VALUES 
('Clara Faria', '11111111111', 15000, null),
('Vivian Silva', '11111111112', 16000, null),
('Marcos Paulo', '11111111113', 6000, 1),
('Raphael Canuto', '11111111114', 6000, 2);

SELECT * FROM funcionario;


SELECT 
s.nome AS 'Nome Supervisor',
f.nome 'Nome Funcionario'
FROM funcionario AS f
JOIN funcionario AS s
ON f.id_funcionario = s.fk_supervisor;

SELECT * FROM 
funcionario 
WHERE
fk_supervisor IS NULL;
