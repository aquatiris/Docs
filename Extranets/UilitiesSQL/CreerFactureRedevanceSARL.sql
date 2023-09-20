Set @RefClient = 4373;
Set @RefFicheAuto = -557;

INSERT INTO `TFacture` (`RefClient`, `NumeroFacture`, `Montant`, `DateEmission`, `DateEcheance`, `DateReglement`, `Payer`, `TVA196`, `Redevance`, `TVA55`, `RefBE`, `Acompte`, `IsFraction`, `Actif`, `DateHst`, `RefInstallFacture`, `RefFacture_OLD`, `RefClient_OLD`, `CodeBE`, `Avancement`, `TVA7`, `RefFicheAuto`, `IsFactureInter`, `TVANormale`, `TVAReduite`, `GUID`) VALUES
(@RefClient, 'F35ELD1409-0XX', 330, '2014-09-24', '2014-10-24', NULL, 0, NULL, 0, NULL, -3, 0, 0, 1, NULL, -1, NULL, NULL, '', 0, NULL, @RefFicheAuto, 0, '55.00', '0.00', NULL);

SET @NewRefFacture = LAST_INSERT_ID();

INSERT INTO `TDetailFacture` (`RefFacture`, `Quantite`, `Remise`, `RefProduit`, `PrixHT`, `Designation`, `TauxTVA`, `CodeTVA`) VALUES
(@NewRefFacture, 1, 0, 28193, 125, 'Redevance forfaitaire autoconstructeur ', '20.00', 2),
(@NewRefFacture, 1, 0, 28197, 150, 'Certificat du fabricant', '20.00', 2);

INSERT INTO `TFactureAttente` (`RefFacture`, `Relance1`, `Relance2`, `MiseEnDemeure`, `InjonctionAPayer`, `AnnulerAvoir`, `Impaye`, `RefFacture_OLD`, `TypePaiement`, `NumeroPaiement`) VALUES
(@NewRefFacture, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL);

INSERT INTO `TFactureParam` (`RefFacture`,`TVA`, `Paiement`, `Effluent`, `Echeance`, `Texte1`, `LibelleAutoconstructeur`) VALUES
(@NewRefFacture, 1, 1, 1, 1, 'Paiement par chèque ou virement bancaire (veuillez indiquer le n° de facture) :<br>RIB : 15589 35120 04730328144 18<br>IBAN : FR76 1558 9351 2004 7303 2814 418<br>BIC : CMBRFR2BARK<br><i>Taux des pénalités de retard : 3 fois le taux d''intérêt légal&nbsp;&nbsp;&nbsp; <br>Aucun escompte pour règlement anticipé<br>Indemnité forfaitaire pour frais de recouvrement en cas de retard de paiement fixée à 40 € (loi n°2012-387 du 22 mars 2012 et décret n°2012-1115 du 2 octobre 2012)</i><br>', '');
