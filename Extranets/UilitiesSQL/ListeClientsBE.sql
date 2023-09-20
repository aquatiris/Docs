select TClients.Courriel, TClients.Nom, TClients.Prenom, TClients.CodePostal, TClients.Ville, TClients.TelephoneFixe, TClients.TelephonePortable, 
	case 
		when f.DateFacture is null and fi.DateFacture is null then 0
		else 1  
	end as HasFactureInstall,
	case 
		when d.DateDevis is null and di.DateDevis is null then 0
		else 1 
	end as HasDevisInstall,
	case 
		when not f.DateFacture is null then f.DateFacture
		when not fi.DateFacture is null then fi.DateFacture
		else null  
	end as DateFactureInstall,
	case 
		when not d.DateDevis is null then d.DateDevis
		when not di.DateDevis is null then di.DateDevis
		else null  
	end as DateDevisInstall,
	case 
		when not di.DateDevis is null or not fi.DateFacture is null then 1
		else 0  
	end as IsAutoConstructeur, 
	
	count(*) 
from TClients
	left join (select Courriel, DateEmission as DateFacture from Tclients
				inner join TInstallFacture on Tclients.RefClient = TInstallFacture.RefClient) as f on Tclients.Courriel = f.Courriel
	
	left join (select Courriel, DateEmission as DateDevis from Tclients
				inner join TInstallDevis on Tclients.RefClient = TInstallDevis.RefClient) as d on Tclients.Courriel = d.Courriel
	
	left join (select Tclients.Courriel, DateFacture from Tclients
				inner join TFicheInstall on Tclients.RefClient = TFicheInstall.RefClient
				inner join TInstallateurs on TInstallateurs.RefInstall = TFicheInstall.RefInstall
				where TFicheInstall.FicheAutoConstructeur = 1 and TInstallateurs.IsAutoconstructeur=1 and not TFicheInstall.DateFacture is null) as fi on Tclients.Courriel = fi.Courriel
				
	left join (select Tclients.Courriel, DateDevis from Tclients
				inner join TFicheInstall on Tclients.RefClient = TFicheInstall.RefClient
				inner join TInstallateurs on TInstallateurs.RefInstall = TFicheInstall.RefInstall
				where TFicheInstall.FicheAutoConstructeur = 1 and TInstallateurs.IsAutoconstructeur=1 and not TFicheInstall.DateDevis is null) as di on Tclients.Courriel = di.Courriel
				
Where TClients.Actif = 1 and TClients.RefBE > 2 and not TClients.Courriel is null and not TClients.Courriel = ''
	and not exists(select 1 from TMesParametres where TMesParametres.Courriel = TClients.Courriel)
	and not exists(Select 1 From TInstallateurs where TInstallateurs.Courriel = TClients.Courriel)
group by TClients.Courriel, TClients.Nom, TClients.Prenom, TClients.CodePostal, TClients.Ville, TClients.TelephoneFixe, TClients.TelephonePortable, 
		f.DateFacture, d.DateDevis
order by TClients.CodePostal, TClients.Nom, TClients.Prenom, TClients.Ville;

---
select TClients.Courriel, count(*) from TClients
Where TClients.Actif = 1 and TClients.RefBE > 2 and not Courriel is null and not Courriel = ''
 and not exists(select 1 from TMesParametres where Courriel = TClients.Courriel)
 and not exists(Select 1 From TInstallateurs where Courriel = TClients.Courriel)
group by TClients.Courriel
order by TClients.Courriel;


select TClients.Courriel, count(*) from TClients
Where TClients.Actif = 1 and TClients.RefBE > 2 and not Courriel is null and not Courriel = ''
group by TClients.Courriel
order by TClients.Courriel;


select Courriel, DateEmission from Tclients
	inner join TFacture on Tclients.RefClient = TFacture.RefClient and 
