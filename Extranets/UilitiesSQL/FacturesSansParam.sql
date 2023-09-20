INSERT INTO TFactureParam (RefFacture,Paiement,Echeance,Texte1) 
Select TFacture.RefFacture, 1, 1, TMesParametres.PhraseFacture1 from TFacture
	INNER JOIN TMesParametres on TFacture.RefBE = TMesParametres.RefBE
Where TFacture.RefBE=-3 and not exists (select 1 from TFactureParam where TFactureParam.RefFacture = TFacture.RefFacture)

INSERT INTO TFactureParam (RefFacture, Echeance, Texte1) 
Select TFacture.RefFacture, 2, '<p>Taux des pénalités de retard : 3 fois le taux d\'intérêt légal <br/><br/>Aucun escompte pour règlement anticipé <br/><br/>Indemnité forfaitaire pour frais de recouvrement en cas de retard de paiement fixée à 40 € (loi n°2012-387 du 22 mars 2012 et décret n°2012-1115 du 2 octobre 2012)<br/><br/></p>'
from TFacture
Where TFacture.RefInstallFacture > 0 and 
	not exists (select 1 from TFactureParam where TFactureParam.RefFacture = TFacture.RefFacture);
 
	  
Select *
FROM TFacture
	INNER JOIN TMesParametres on TFacture.RefBE = TMesParametres.RefBE
Where not exists (select 1 from TFactureParam where TFactureParam.RefFacture = TFacture.RefFacture) and DateEmission > '2014-01-01'
order by TFacture.DateEmission desc,TFacture.RefBE 

--GF
INSERT INTO TFactureParam (RefFacture,Paiement,Echeance,Texte1) 
Select TFacture.RefFacture, 1, 1, TMesParametres.PhraseFacture1 from TFacture
	INNER JOIN TMesParametres on TFacture.RefBE = TMesParametres.RefBE
Where TFacture.RefBE=1217 and not exists (select 1 from TFactureParam where TFactureParam.RefFacture = TFacture.RefFacture)
--SB
INSERT INTO TFactureParam (RefFacture,Paiement,Echeance,Texte1) 
Select TFacture.RefFacture, 1, 1, TMesParametres.PhraseFacture1 from TFacture
	INNER JOIN TMesParametres on TFacture.RefBE = TMesParametres.RefBE
Where TFacture.RefBE=25 and not exists (select 1 from TFactureParam where TFactureParam.RefFacture = TFacture.RefFacture)
--AJ
INSERT INTO TFactureParam (RefFacture,Paiement,Echeance,Texte1) 
Select TFacture.RefFacture, 1, 1, TMesParametres.PhraseFacture1 from TFacture
	INNER JOIN TMesParametres on TFacture.RefBE = TMesParametres.RefBE
Where TFacture.RefBE=15 and not exists (select 1 from TFactureParam where TFactureParam.RefFacture = TFacture.RefFacture)

--AC BR
INSERT INTO TFactureParam (RefFacture,Paiement,Echeance,Texte1) 
Select TFacture.RefFacture, 1, 1, TMesParametres.PhraseFacture1 from TFacture
	INNER JOIN TMesParametres on TFacture.RefBE = TMesParametres.RefBE
Where TFacture.RefBE in (22,20) and not exists (select 1 from TFactureParam where TFactureParam.RefFacture = TFacture.RefFacture)
--SM
INSERT INTO TFactureParam (RefFacture,Paiement,Echeance,Texte1) 
Select TFacture.RefFacture, 1, 1, TMesParametres.PhraseFacture1 from TFacture
	INNER JOIN TMesParametres on TFacture.RefBE = TMesParametres.RefBE
Where TFacture.RefBE in (1121) and not exists (select 1 from TFactureParam where TFactureParam.RefFacture = TFacture.RefFacture)
--SC
INSERT INTO TFactureParam (RefFacture,Paiement,Echeance,Texte1) 
Select TFacture.RefFacture, 1, 1, TMesParametres.PhraseFacture1 from TFacture
	INNER JOIN TMesParametres on TFacture.RefBE = TMesParametres.RefBE
Where TFacture.RefBE in (40) and not exists (select 1 from TFactureParam where TFactureParam.RefFacture = TFacture.RefFacture)
--MR
INSERT INTO TFactureParam (RefFacture,Paiement,Echeance,Texte1) 
Select TFacture.RefFacture, 1, 1, TMesParametres.PhraseFacture1 from TFacture
	INNER JOIN TMesParametres on TFacture.RefBE = TMesParametres.RefBE
Where TFacture.RefBE in (1) and not exists (select 1 from TFactureParam where TFactureParam.RefFacture = TFacture.RefFacture)
--MM
INSERT INTO TFactureParam (RefFacture,Paiement,Echeance,Texte1) 
Select TFacture.RefFacture, 1, 1, TMesParametres.PhraseFacture1 from TFacture
	INNER JOIN TMesParametres on TFacture.RefBE = TMesParametres.RefBE
Where TFacture.RefBE in (32) and not exists (select 1 from TFactureParam where TFactureParam.RefFacture = TFacture.RefFacture)