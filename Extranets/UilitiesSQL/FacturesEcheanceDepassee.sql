select DATE_ADD(CURDATE(),INTERVAL -30 DAY) as LimiteEcheance, TMesParametres.Nom, TMesParametres.RefBE as BE, TFacture.* from TFacture
	inner join TClients on TFacture.RefClient = TClients.RefClient
	inner join TMesParametres on TMesParametres.Courriel = TClients.Courriel
where TFacture.RefBE = -3 and TFacture.Payer = 0 and TFacture.DateEcheance < DATE_ADD(CURDATE(),INTERVAL -30 DAY)
order by TMesParametres.Nom, TFacture.DateEcheance desc