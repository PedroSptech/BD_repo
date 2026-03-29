-- criar usuário jogador
create user 'jogador'@'localhost' 
	identified by 'copadobrasil';

-- permissões do usuário
-- permitir todos os comandos
grant all privileges on sptecha.* 
	to 'jogador'@'localhost';

flush privileges;

-- retirar as permissões
revoke all privileges on sptecha.* 
	from 'jogador'@'localhost';
    
flush privileges;

-- permitir apenas o select
grant SELECT on sptecha.* 
	to 'jogador'@'localhost';

-- grant SELECT, UPDATE, DELETE, INSERT on sptecha.* 
-- to 'jogador'@'localhost';
    
-- confirmar as permissões
flush privileges;

-- excluir o usuário
-- drop user 'jogador'@'localhost';
