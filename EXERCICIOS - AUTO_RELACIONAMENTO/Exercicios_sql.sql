CREATE DATABASE sprint2a;
use sprint2a;
-- EXERCICIO 1
CREATE TABLE area_empresa(
idarea_empresa INT PRIMARY KEY AUTO_INCREMENT,
nome_area_empresa VARCHAR(45),
fkfuncionario INT
);

ALTER TABLE area_empresa ADD CONSTRAINT ctFKFuncionario FOREIGN KEY (fkfuncionario) REFERENCES funcionario(idfuncionario);

CREATE TABLE funcionario(
idfuncionario INT PRIMARY KEY AUTO_INCREMENT,
nome_funcionario VARCHAR(45),
fk_area_empresa INT,
fk_supervisor INT,
CONSTRAINT ctFKSupervisor FOREIGN KEY (fk_supervisor) REFERENCES funcionario(idfuncionario),
CONSTRAINT ctFKArea_empresa FOREIGN KEY (fk_area_empresa) REFERENCES area_empresa(idarea_empresa)
);

INSERT INTO area_empresa (nome_area_empresa, fkfuncionario) VALUES 
('Tecnologia', NULL),
('Recursos Humanos', NULL),
('Financeiro', NULL);


INSERT INTO funcionario (nome_funcionario, fk_area_empresa, fk_supervisor) VALUES 
('Carlos Alberto', 1, NULL), 
('Ana Maria', 2, NULL),     
('Roberto Shinyashiki', 3, NULL); 


INSERT INTO funcionario (nome_funcionario, fk_area_empresa, fk_supervisor) VALUES 
('Bruno Souza', 1, 1), 
('Carla Dias', 2, 2),  
('Daniela Lima', 1, 1); 


UPDATE area_empresa SET fkfuncionario = 1 WHERE idarea_empresa = 1;


UPDATE area_empresa SET fkfuncionario = 2 WHERE idarea_empresa = 2;


UPDATE area_empresa SET fkfuncionario = 3 WHERE idarea_empresa = 3;

SELECT 
    f.nome_funcionario AS 'Funcionário',
    s.nome_funcionario AS 'Supervisor',
    a.nome_area_empresa AS 'Departamento'
FROM funcionario f
LEFT JOIN funcionario s ON f.fk_supervisor = s.idfuncionario
JOIN area_empresa a ON f.fk_area_empresa = a.idarea_empresa;

SELECT 
	f.nome_funcionario AS 'Funcionário',
    s.nome_funcionario AS 'Supervisor',
    a.nome_area_empresa AS 'Departamento'
FROM funcionario f
LEFT JOIN funcionario s ON f.fk_supervisor = s.idfuncionario
JOIN area_empresa a ON f.fk_area_empresa = a.idarea_empresa
WHERE f.fk_supervisor IS NOT NULL;

SELECT 
    f.nome_funcionario AS 'Funcionário',
    IFNULL(s.nome_funcionario, 'Sem Supervisor') AS 'Nome do Supervisor',
    a.nome_area_empresa AS 'Departamento',
CASE 
	WHEN f.fk_supervisor IS NULL THEN 'POSSUI CARGO EXECUTIVO'
    ELSE 'SUPERVISOR' 
END AS 'SUPERVISOR'
FROM funcionario f
LEFT JOIN funcionario s ON f.fk_supervisor = s.idfuncionario
JOIN area_empresa a ON f.fk_area_empresa = a.idarea_empresa;

-- EXERCICIO 2
CREATE TABLE email(
idemail INT PRIMARY KEY AUTO_INCREMENT,
nome_email VARCHAR(45)
);

CREATE TABLE usuario(
idusuario INT PRIMARY KEY AUTO_INCREMENT,
nome_usuario VARCHAR(45),
fk_usuario_gerente INT,
fk_email INT,
CONSTRAINT ctFKGerente FOREIGN KEY (fk_usuario_gerente) REFERENCES usuario(idusuario),
CONSTRAINT ctFKEmail FOREIGN KEY (fk_email) REFERENCES email(idemail)
);

INSERT INTO email (nome_email) VALUES 
('fernanda.gerente@empresa.com'),
('roberto.analista@empresa.com'),
('claudia.diretora@empresa.com'),
('estagiario.ti@empresa.com');


INSERT INTO usuario (nome_usuario, fk_usuario_gerente, fk_email) 
VALUES ('Claudia Direção', NULL, 3);


INSERT INTO usuario (nome_usuario, fk_usuario_gerente, fk_email) 
VALUES ('Fernanda Gerência', 1, 1);


INSERT INTO usuario (nome_usuario, fk_usuario_gerente, fk_email) VALUES 
('Roberto Analista', 2, 2),
('Junior Estagiário', 2, 4);

SELECT 
    u.nome_usuario AS 'Funcionário',
    e.nome_email AS 'E-mail',
    g.nome_usuario AS 'Gerente'
FROM usuario AS u
INNER JOIN email AS e 
    ON u.fk_email = e.idemail
LEFT JOIN usuario AS g 
    ON u.fk_usuario_gerente = g.idusuario;

SELECT 
    u.nome_usuario AS 'Subordinado',
    e.nome_email AS 'E-mail do Subordinado'
FROM usuario AS u
JOIN email AS e 
    ON u.fk_email = e.idemail
JOIN usuario AS g 
    ON u.fk_usuario_gerente = g.idusuario
WHERE g.nome_usuario = 'Fernanda Gerência';

SELECT 
    u.nome_usuario AS 'Funcionário',
    e.nome_email AS 'E-mail',
    CASE 
        WHEN u.fk_usuario_gerente IS NULL THEN 'Líder / Diretor'
        ELSE 'Membro da Equipe'
    END AS 'Perfil'
FROM usuario AS u
INNER JOIN email AS e 
    ON u.fk_email = e.idemail;