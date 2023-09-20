DELETE FROM ##_DB_PREFIX_##blockgammeaqua_gamme WHERE 1 ;
ALTER TABLE ##_DB_PREFIX_##blockgammeaqua_gamme AUTO_INCREMENT = 1;	
DELETE FROM ##_DB_PREFIX_##blockgammeaqua_filiere WHERE 1 ;
ALTER TABLE ##_DB_PREFIX_##blockgammeaqua_filiere AUTO_INCREMENT = 1;	
DELETE FROM ##_DB_PREFIX_##blockgammeaqua_eh WHERE 1 ;
ALTER TABLE ##_DB_PREFIX_##blockgammeaqua_eh AUTO_INCREMENT = 1;	
INSERT INTO ##_DB_PREFIX_##blockgammeaqua_gamme (`id_gamme`,`name`,`date_add`,`date_upd`) values 
	(1,'ROSEAUX', now(), now()), 
	(2,'IRIS', now(), now());
INSERT INTO ##_DB_PREFIX_##blockgammeaqua_filiere (`id_filiere`,`id_gamme`,`name`,`date_add`,`date_upd`) values 
	(1,1,'FV Geo', now(), now()), 
	(2,2,'FV Geo + Geo', now(), now()), 
	(3,1,'FV Bac', now(), now()), 
	(4,2,'FV Bac + Geo', now(), now());
INSERT INTO ##_DB_PREFIX_##blockgammeaqua_eh (`nb_eh`, `name`, `isBac`,`date_add`,`date_upd`) values 
	(2,'2 EH', 0, now(), now()), 
	(3,'3 EH', 1, now(), now()), 
	(4,'4 EH', 0, now(), now()), 
	(5,'5 EH', 1, now(), now()), 
	(6,'6 EH 4x3', 1, now(), now()), 
	(6,'6 EH 6x2', 0, now(), now()), 
	(6,'6 EH 8x1.5', 0, now(), now()), 
	(7,'7 EH', 0, now(), now()), 
	(8,'8 EH 4x4', 0, now(), now()), 
	(8,'8 EH 8x2', 0, now(), now()), 
	(9,'9 EH', 0, now(), now()), 
	(10,'10 EH 4x5', 1, now(), now()), 
	(10,'10 EH 8x2.5', 0, now(), now()), 
	(10,'10 EH 10x2', 0, now(), now()), 
	(12,'12 EH 6x4', 1, now(), now()), 
	(12,'12 EH 8x3', 1, now(), now()), 
	(14,'14 EH 8x3.5', 0, now(), now()), 
	(14,'14 EH 7x4', 0, now(), now()), 
	(16,'16 EH', 0, now(), now()), 
	(18,'18 EH 9x4', 0, now(), now()), 
	(18,'18 EH 8x4.5', 0, now(), now()), 
	(20,'20 EH 8x5', 1, now(), now()), 
	(20,'20 EH 10x4', 1, now(), now());