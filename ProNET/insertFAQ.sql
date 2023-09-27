CREATE TABLE IF NOT EXISTS PRONET_FAQ_CATEGORY (
                `id_faq_category` int(10) unsigned NOT NULL AUTO_INCREMENT,
				`name` varchar(255) NULL DEFAULT NULL,
				`slug` varchar(255) NULL DEFAULT NULL,
                `date_add` datetime DEFAULT NULL,
                `date_upd` datetime DEFAULT NULL,
                PRIMARY KEY (`id_faq_category`)
            ) ENGINE=INNODB DEFAULT CHARSET=utf8;
			
CREATE TABLE IF NOT EXISTS PRONET_FAQ (
                `id_faq` int(10) unsigned NOT NULL AUTO_INCREMENT,
				`question` MEDIUMTEXT NULL DEFAULT NULL,
				`reponse` MEDIUMTEXT NULL DEFAULT NULL,
				`slug_category` varchar(255) NULL DEFAULT NULL,
                `date_add` datetime DEFAULT NULL,
                `date_upd` datetime DEFAULT NULL,
                PRIMARY KEY (`id_faq`)
            ) ENGINE=INNODB DEFAULT CHARSET=utf8;
			
INSERT INTO PRONET_FAQ_CATEGORY (name,slug,date_add,date_upd) values ('Agréments','agrement',now(),now());
INSERT INTO PRONET_FAQ_CATEGORY (name,slug,date_add,date_upd) values ('Réalisation, conformité','conformite',now(),now());
INSERT INTO PRONET_FAQ_CATEGORY (name,slug,date_add,date_upd) values ('Fil d\'eau, entretien de la filière','entretien',now(),now());
	
INSERT INTO PRONET_FAQ (question,reponse,slug_category,date_add,date_upd) values ('Jardin d\'Assainissement - Gamme Roseaux','La filière Aquatiris est réglementaire : Agrément 2011-022 : Jardi-assainissement FV+FH

Dimensionnement : 4m2 / EH (FV = 2m2/EH + FH = 2m2/EH)
Enveloppe FH = Géomembrane > 1,01 mm

ENVELOPPE FV BAC
Gamme 3, 5, 6 EH : au fil d\'eau (gravitaire pur), possibilité d\'alimenter par bâchée en fonction des contraintes de terrain (pente < 4 %) et des souhaites de l\'usager
Gamme 10, 12, 20 EH : sous faible pression : chasse hydraulique eaux brutes, broyeur ou poste de relevage obligatoire (volume bâchée conseillé = 10*nb(EH) en L

ENVELOPPE FV GEOMEMBRANE  > 1,01 MM
Gamme 2, 3, 4, 5, 6, 7, 8, 9, 10 EH : au fil d\'eau (gravitaire pur), possibilité d\'alimenter par bâchée en fonction des contraintes de terrain (pente < 4 %) et des souhaites de l\'usager
Gamme 12, 14, 16, 18, 20 EH : sous faible pression : chasse hydraulique eaux brutes, broyeur ou poste de relevage obligatoire (volume bâchée conseillé = 10*nb(EH) en L','agrement',now(),now());

INSERT INTO PRONET_FAQ (question,reponse,slug_category,date_add,date_upd) values ('Jardin d\'Assainissement - Gamme Iris','La filière Aquatiris est réglementaire : Agrément 2014-014 : Jardi-assainissement FV

Dimensionnement : 2m2 / EH

ENVELOPPE FV BAC
Gamme 3, 5, 6 EH : au fil d\'eau (gravitaire pur), possibilité d\'alimenter par bâchée en fonction des contraintes de terrain (pente < 4 %) et des souhaites de l\'usager
Gamme 10, 12, 20 EH : sous faible pression : chasse hydraulique eaux brutes, broyeur ou poste de relevage obligatoire (volume bâchée conseillé = 10*nb(EH) en L

ENVELOPPE FV GEOMEMBRANE  = 1,5 MM CERTIFIEE ASQUAL
Gamme 2, 3, 4, 5, 6, 7, 8, 9, 10 EH : au fil d\'eau (gravitaire pur), possibilité d\'alimenter par bâchée en fonction des contraintes de terrain (pente < 4 %) et des souhaites de l\'usager
Gamme 12, 14, 16, 18, 20 EH : sous faible pression : chasse hydraulique eaux brutes, broyeur ou poste de relevage obligatoire (volume bâchée conseillé = 10*nb(EH) en L','agrement',now(),now());

INSERT INTO PRONET_FAQ (question,reponse,slug_category,date_add,date_upd) values ('Process réalisation d\'une station','Etude de sol effectuée par un BE généraliste ou par Aquatiris.
Une fois l\'étude validée par le SPANC, réalisation des travaux par le franchisé Aquatiris ou par l\'installateur agrée ou par un accompagnement à l\'auto construction réalisé par le franchisé Aquatiris.
Contrôle fabricant et remise du PV de réception.
Puis contrôle de conformité de l\'installation par le SPANC.','conformite',now(),now());

INSERT INTO PRONET_FAQ (question,reponse,slug_category,date_add,date_upd) values ('Le SPANC doit-il attendre le certificat de conformité d\'Aquatiris pour validation du contrôle de réalisation ?','Oui, car le contrôle fabricant est équivalent au contrôle de sortie d\'usine des autres sytèmes agréés. Tout Jardin d\'Assainisement doit donc être certifié conforme par le fabricant Aquatiris avant que le SPANC ne puisse valider le contrôle de réalisation.','conformite',now(),now());

INSERT INTO PRONET_FAQ (question,reponse,slug_category,date_add,date_upd) values ('Quel fil d\'eau pour l\'ensemble de la filière ?','Il faut compter entre 1m et 1m50 de fil d\'eau entre la sortie de la maison et le rejet, variable en fonction des sorties (nombre et distance) et de la filière choisie.','entretien',now(),now());

INSERT INTO PRONET_FAQ (question,reponse,slug_category,date_add,date_upd) values ('Quid de l\'entretien de la filière','Chaque usager possède un carnet d\'entretien ainsi qu\'un guide de l\'usager.

L\'entretien, de type jardinier, peut être entièrement réalisé par les usagers. S\'ils le souhaitent nous pouvons proposer un entretien sous forme de 2 visites annuelles pour la coupe des roseaux, le nettoyage de la pompe et le contrôle de bon fonctionnement (vannes, regards, etc).','entretien',now(),now());
	