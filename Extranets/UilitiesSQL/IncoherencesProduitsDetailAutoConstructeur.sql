--Requête d'extraction des RefProduit incohérent pour la facturation AutoConstructeur Tous BE sauf -3
select * from (
	Select TFacture.RefBE, TFacture.DateEmission, 
		(select min(RefProduit) from TProduits 
			Where TFacture.RefBE = RefBE and IsRevente = 1 and Actif = 1 and TDetailFacture.Designation = "Revente Saskit" limit 0,1) as Revente, 
		(select min(RefProduit) from TProduits 
			Where TFacture.RefBE = RefBE and IsReception = 1 and Actif = 1 and TDetailFacture.Designation = "Contrôle du fabricant" limit 0,1) as Controle, 
		(select min(RefProduit) from TProduits 
			Where TFacture.RefBE = RefBE and IsAttestation = 1 and Actif = 1 and TDetailFacture.Designation = "Redevance SARL et certificat" limit 0,1) as Redevance, 
		(select min(RefProduit) from TProduits 
			Where TFacture.RefBE = RefBE and IsAutoConstructeur = 1 and Actif = 1 and TDetailFacture.Designation like "%d'accompagnement autoconstructeur" limit 0,1) as Visite, 
		(select min(RefProduit) from TProduits 
			Where TFacture.RefBE = RefBE and (IsTravaux = 2 or IsProduitRedevanceInstallateur = 2) and Actif = 1 and 
			TDetailFacture.Designation like "Redevance%" and TDetailFacture.Designation like "%autoconstructeur%" and not TDetailFacture.Designation like "%forfaitaire%" limit 0,1) as RedTravaux, 
		TDetailFacture.* 
	From TDetailFacture
		inner join TFacture on TFacture.RefFacture = TDetailFacture.RefFacture

	Where not (RefFicheAuto is null)  and DateEmission > '2014-01-01' and not RefBE=-3 and
		((TDetailFacture.Designation = "Contrôle du fabricant") or
		 (TDetailFacture.Designation = "Redevance SARL et certificat") or 
		 (TDetailFacture.Designation = "Revente Saskit") or 
		 (TDetailFacture.Designation like "%d'accompagnement autoconstructeur") or 
		 (TDetailFacture.Designation like "Redevance%" and TDetailFacture.Designation like "%autoconstructeur%"))
) as a
Where (a.Designation = "Contrôle du fabricant" and a.Controle<>a.RefProduit) or
	 (a.Designation = "Redevance SARL et certificat" and a.Redevance<>a.RefProduit) or 
	 (a.Designation = "Revente Saskit" and a.Revente<>a.RefProduit) or 
	 (a.Designation like "%d'accompagnement autoconstructeur" and a.Visite<>a.RefProduit) or 
	 (a.Designation like "Redevance%" and a.Designation like "%autoconstructeur%" and not a.Designation like "%forfaitaire%" and a.RedTravaux<>a.RefProduit) or 
	 a.RefProduit is null;
--Pour le REfBE = -3
select * from (
	Select TFacture.RefBE, TFacture.DateEmission, 
		(select min(RefProduit) from TProduits 
			Where TFacture.RefBE = RefBE and IsRevente = 1 and Actif = 1 and TDetailFacture.Designation = "Revente de pièces Saskit") as Revente, 
		(select min(RefProduit) from TProduits 
			Where TFacture.RefBE = RefBE and IsReception = 1 and Actif = 1 and TDetailFacture.Designation = "Certificat du fabricant") as Controle, 
		(select min(RefProduit) from TProduits 
			Where TFacture.RefBE = RefBE and IsAutoConstructeur = 1 and Actif = 1 and TDetailFacture.Designation like "Redevance forfaitaire autoconstructeur%") as Redevance, 
		TDetailFacture.* 
	From TDetailFacture
		inner join TFacture on TFacture.RefFacture = TDetailFacture.RefFacture

	Where not (RefFicheAuto is null)  and DateEmission > '2014-09-01' and RefBE=-3 and
		((TDetailFacture.Designation = "Certificat du fabricant") or
		 (TDetailFacture.Designation = "Revente de pièces Saskit") or 
		 (TDetailFacture.Designation like "Redevance forfaitaire autoconstructeur%"))
) as a
Where (a.Designation = "Certificat du fabricant" and a.Controle<>a.RefProduit) or
	 (a.Designation = "Revente de pièces Saskit" and a.Revente<>a.RefProduit) or 
	 (a.Designation like "Redevance forfaitaire autoconstructeur%" and a.Redevance<>a.RefProduit) or 
	 a.RefProduit is null;
	 
--Vérif globale
Select TDetailFacture.*, TFacture.*
From TDetailFacture
		inner join TFacture on TFacture.RefFacture = TDetailFacture.RefFacture
	Where not (RefFicheAuto is null)  and DateEmission > '2014-09-20';
	
select * FRom TProduits where RefProduit in (20043,28193);

update TDetailFacture set RefProduit = 20043 where RefDetailFacture = 108061;
update TDetailFacture set RefProduit = 19668 where RefDetailFacture = 108062;

update TDetailFacture set RefProduit = 19512 where RefDetailFacture = 108047;
update TDetailFacture set RefProduit = 27488 where RefDetailFacture = 108048;

update TDetailFacture set RefProduit = 19307 where RefDetailFacture = 108058;
update TDetailFacture set RefProduit = 19306 where RefDetailFacture = 108059;

update TDetailFacture set RefProduit = 28219 where RefDetailFacture = 108005;
update TDetailFacture set RefProduit = 28555 where RefDetailFacture = 107991;
update TDetailFacture set RefProduit = 28555 where RefDetailFacture = 108085;

update TDetailFacture set RefProduit = 28518 where RefDetailFacture = 107878;

update TDetailFacture set RefProduit = 28515 where RefDetailFacture = 107876;
update TDetailFacture set RefProduit = 28510 where RefDetailFacture = 107877;
update TDetailFacture set RefProduit = 28554 where RefDetailFacture = 107990;
update TDetailFacture set RefProduit = 28220 where RefDetailFacture = 108003;
update TDetailFacture set RefProduit = 20206 where RefDetailFacture = 108004;
update TDetailFacture set RefProduit = 28554 where RefDetailFacture = 108084;

update TDetailFacture set RefProduit = 28514 where RefDetailFacture = 107875;
update TDetailFacture set RefProduit = 28514 where RefDetailFacture = 107879;
update TDetailFacture set RefProduit = 28533 where RefDetailFacture = 107989;
update TDetailFacture set RefProduit = 19789 where RefDetailFacture = 108036;
update TDetailFacture set RefProduit = 19789 where RefDetailFacture = 108037;
update TDetailFacture set RefProduit = 19763 where RefDetailFacture = 108046;
update TDetailFacture set RefProduit = 987 where RefDetailFacture = 108057;
update TDetailFacture set RefProduit = 28533 where RefDetailFacture = 108083;


select * FRom TProduits where RefProduit in (27948,27961,27962)

select * FRom TProduits where IsRevente = 1 and RefBE = 1008 and actif=1

Contrôle du fabricant : 158 -> 19512
Contrôle du fabricant : 25 -> 19307

SELECT a.* FROM TProduits a 
		WHERE a.RefBE = 1144 and Actif = 1 and IsAttestation = 1 ==> 28555
		
	
			case "AUTOCONSTRUCTEUR":
				$sp->AddParameters("Libelle", "Prestation d'accompagnement auto-constructeur");
				$sp->AddParameters("NomVar", "IsAutoConstructeur");
				$sp->AddParameters("Values", "1");
				$sp->AddParameters("ClauseWhere", "and IsAutoConstructeur = 1");
				$sp->AddParameters("PrixUnitaireHT", "200");
				
				break;
				
			case "REVENTE":
				$sp->AddParameters("Libelle", "Produit de Revente");
				$sp->AddParameters("NomVar", "IsRevente");
				$sp->AddParameters("Values", "1");
				$sp->AddParameters("ClauseWhere", "and IsRevente = 1");
				$sp->AddParameters("PrixUnitaireHT", "0");
					
				break;
				
			case "CONTROLE_FABRICANT":
				$sp->AddParameters("Libelle", "Contrôle du fabricant");
				$sp->AddParameters("NomVar", "IsReception");
				$sp->AddParameters("Values", "1");
				$sp->AddParameters("ClauseWhere", "and IsReception = 1");
				$sp->AddParameters("PrixUnitaireHT", "0");
					
				break;
				
			case "ATTESTATION":
				$sp->AddParameters("Libelle", "Redevance SARL et certificat");
				$sp->AddParameters("NomVar", "IsAttestation");
				$sp->AddParameters("Values", "1");
				$sp->AddParameters("ClauseWhere", "and IsAttestation = 1");
				$sp->AddParameters("PrixUnitaireHT", "0");
					
				break;
				
			case "REDEVANCE_TRAVAUX":
				$sp->AddParameters("Libelle", "Redevance autoconstructeur");
				$sp->AddParameters("NomVar", "IsTravaux,IsProduitRedevanceInstallateur");
				$sp->AddParameters("Values", "2,2");
				$sp->AddParameters("ClauseWhere", "and (IsTravaux = 2 or IsProduitRedevanceInstallateur = 2)");
				$sp->AddParameters("PrixUnitaireHT", "0");
					
				break;