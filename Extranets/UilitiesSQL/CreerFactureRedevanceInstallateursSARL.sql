DELIMITER $$

DROP PROCEDURE IF EXISTS CreerRedevanceInstallateur$$

CREATE PROCEDURE CreerRedevanceInstallateur()
begin
	DROP TEMPORARY TABLE IF EXISTS installTemp;
	CREATE TEMPORARY TABLE installTemp (RefInstallUnique int, 
										Mail varchar(100), 
										nbInstall int);
										
	insert into installTemp (RefInstallUnique,Mail,nbInstall) 
	select inst.RefInstallUnique, inst.Courriel, count(*) as nbInstall 
		from TStatsEtudes se
			INNER JOIN TInstallateurs inst on se.RefInstallateur = inst.RefInstall
		where year(se.DateTravaux)=2013 and not se.RefInstallateur is null and not inst.IsAutoconstructeur = 1
		group by inst.RefInstallUnique, inst.Courriel;
	
	select * from installTemp;
end$$
	
BLOCK1: begin
	DECLARE cur CURSOR FOR
		select inst.RefInstallUnique, TClients.RefClient, count(*) as nbInstall 
		from TStatsEtudes se
			INNER JOIN TInstallateurs inst on se.RefInstallateur = inst.RefInstall
			INNER JOIN TClients on TClients.RefInstallUnique= inst.RefInstallUnique and RefBE = 2
		where year(se.DateTravaux)=2013 and not se.RefInstallateur is null and not inst.IsAutoconstructeur = 1
		group by inst.RefInstallUnique, TClients.RefClient;
		
	-- declare NOT FOUND handler
	DECLARE v_finished INTEGER DEFAULT 0;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_finished = 1;

	declare n int DEFAULT 0;
	declare mail varchar(100);
	declare nbInstall int DEFAULT 0;
	declare currentRef int DEFAULT 0;
	declare numero varchar(20);

	DROP TEMPORARY TABLE IF EXISTS TableauRedevance;
	CREATE TEMPORARY TABLE TableauRedevance (Numero varchar(20), 
										RefInstallUnique int, 
										Mail varchar(100), 
										RefClient int, 
										Montant int);
											
	open cur;
	start_loop: loop
		fetch cur into currentRef, mail, nbInstall;
		IF v_finished = 1 THEN
			LEAVE start_loop;
		END IF;
		
		set n = n +1;
		set numero = concat('F35BPO1409-',lpad(trim(n),2,'0'));
		
		insert into TableauRedevance (Numero,RefInstallUnique,Mail,RefClient,Montant) values (numero,currentRef,mail,10,nbInstall);
		
	end loop;
	
	close cur;
	Select * from TableauRedevance;
END BLOCK1;

DELIMITER ;
	
Set @RefClient = 4373;


INSERT INTO `TFacture` (`RefClient`, `NumeroFacture`, `Montant`, `DateEmission`, `DateEcheance`, `DateReglement`, `Payer`, `TVA196`, `Redevance`, `TVA55`, `RefBE`, `Acompte`, `IsFraction`, `Actif`, `DateHst`, `RefInstallFacture`, `RefFacture_OLD`, `RefClient_OLD`, `CodeBE`, `Avancement`, `TVA7`, `RefFicheAuto`, `IsFactureInter`, `TVANormale`, `TVAReduite`, `GUID`) VALUES
(@RefClient, 'F35BPO1409-0XX', 330, '2014-09-24', '2014-10-24', NULL, 0, NULL, 0, NULL, -3, 0, 0, 1, NULL, -1, NULL, NULL, '', 0, NULL, @RefFicheAuto, 0, '55.00', '0.00', NULL);

SET @NewRefFacture = LAST_INSERT_ID();

INSERT INTO `TDetailFacture` (`RefFacture`, `Quantite`, `Remise`, `RefProduit`, `PrixHT`, `Designation`, `TauxTVA`, `CodeTVA`) VALUES
(@NewRefFacture, 1, 0, 27812, 125, 'Droit de marque et agrément AQUATIRIS<p>Année 2014</p>', '20.00', 2),

INSERT INTO `TFactureAttente` (`RefFacture`, `Relance1`, `Relance2`, `MiseEnDemeure`, `InjonctionAPayer`, `AnnulerAvoir`, `Impaye`, `RefFacture_OLD`, `TypePaiement`, `NumeroPaiement`) VALUES
(@NewRefFacture, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL);

INSERT INTO `TFactureParam` (`RefFacture`,`TVA`, `Paiement`, `Effluent`, `Echeance`, `Texte1`, `LibelleAutoconstructeur`) VALUES
(@NewRefFacture, 1, 1, 1, 1, 'Paiement par chèque ou virement bancaire (veuillez indiquer le n° de facture) :<br>RIB : 15589 35120 04730328144 18<br>IBAN : FR76 1558 9351 2004 7303 2814 418<br>BIC : CMBRFR2BARK<br><i>Taux des pénalités de retard : 3 fois le taux d''intérêt légal&nbsp;&nbsp;&nbsp; <br>Aucun escompte pour règlement anticipé<br>Indemnité forfaitaire pour frais de recouvrement en cas de retard de paiement fixée à 40 € (loi n°2012-387 du 22 mars 2012 et décret n°2012-1115 du 2 octobre 2012)</i><br>', '');
