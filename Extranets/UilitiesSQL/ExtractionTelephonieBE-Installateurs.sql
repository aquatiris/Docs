Select a.UTILISATEUR,
REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE(a.Nom,'ù','u'),'ú','u'),'û','u'),'ü','u'),'ý','y'),'ë','e'),'à','a'),'á','a'),'â','a'),'ã','a'),'ä','a'),'å','a'),'æ','a'),'ç','c'),'è','e'),'é','e'),'ê','e'),'ë','e'),'ì','i'),'í','i'),'î','i'),'ï','i'),'ð','o'),'ñ','n'),'ò','o'),'ó','o'),'ô','o'),'õ','o'),'ö','o'),'ø','o') 
as Nom,
REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE(  a.Prenom,'ù','u'),'ú','u'),'û','u'),'ü','u'),'ý','y'),'ë','e'),'à','a'),'á','a'),'â','a'),'ã','a'),'ä','a'),'å','a'),'æ','a'),'ç','c'),'è','e'),'é','e'),'ê','e'),'ë','e'),'ì','i'),'í','i'),'î','i'),'ï','i'),'ð','o'),'ñ','n'),'ò','o'),'ó','o'),'ô','o'),'õ','o'),'ö','o'),'ø','o')
as Prenom,
REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE(a.NomAfficher,'ù','u'),'ú','u'),'û','u'),'ü','u'),'ý','y'),'ë','e'),'à','a'),'á','a'),'â','a'),'ã','a'),'ä','a'),'å','a'),'æ','a'),'ç','c'),'è','e'),'é','e'),'ê','e'),'ë','e'),'ì','i'),'í','i'),'î','i'),'ï','i'),'ð','o'),'ñ','n'),'ò','o'),'ó','o'),'ô','o'),'õ','o'),'ö','o'),'ø','o') 
as NomAfficher,
a.Telephone
 from (
Select 'BE' as UTILISATEUR, be.Nom, be.Prenom, 
	case 
		when ifnull(be.NomEntreprise,'') = '' then concat(be.Nom, ' ', be.Prenom)
		when ifnull(be.Nom,'') = '' then be.NomEntreprise
		else concat(be.Nom, ' ', be.Prenom, ' - ', be.NomEntreprise)
	end as NomAfficher,
	replace(replace(be.TelFixe,'.',''),' ','') as Telephone
From TBECompte c
	inner join TBECoordonnees be on be.RefBE = c.RefBE
Where c.Actif = 1 and c.RefBE > 3 and c.IsSARL = 0 and not ifnull(trim(be.TelFixe),'')=''

union

Select 'BE' as UTILISATEUR, be.Nom, be.Prenom, 
	case 
		when ifnull(be.NomEntreprise,'') = '' then concat(be.Nom, ' ', be.Prenom)
		when ifnull(be.Nom,'') = '' then be.NomEntreprise
		else concat(be.Nom, ' ', be.Prenom, ' - ', be.NomEntreprise)
	end as NomAfficher,
	replace(replace(be.TelPortable,'.',''),' ','') as Telephone
From TBECompte c
	inner join TBECoordonnees be on be.RefBE = c.RefBE
Where c.Actif = 1 and c.RefBE > 3 and c.IsSARL = 0 and not ifnull(trim(be.TelPortable),'')=''

union

Select 'INSTALLATEUR' as UTILISATEUR, inst.Nom, inst.Prenom, 
	case 
		when ifnull(inst.nomentreprise,'') = '' then concat(inst.Nom, ' ', inst.Prenom)
		when ifnull(inst.Nom,'') = '' then inst.nomentreprise
		else concat(inst.Nom, ' ', inst.Prenom, ' - ', inst.nomentreprise)
	end as NomAfficher,
	replace(replace(inst.Tel1,'.',''),' ','') as Telephone
From TInstallateursCompte c
	inner join TInstallateursCoordonnees inst on inst.RefInstallUnique = c.RefInstallUnique
Where c.Actif = 1 and c.RefInstallUnique > 1 and not ifnull(trim(inst.Tel1),'')=''

union

Select 'INSTALLATEUR' as UTILISATEUR, inst.Nom, inst.Prenom, 
	case 
		when ifnull(inst.nomentreprise,'') = '' then concat(inst.Nom, ' ', inst.Prenom)
		when ifnull(inst.Nom,'') = '' then inst.nomentreprise
		else concat(inst.Nom, ' ', inst.Prenom, ' - ', inst.nomentreprise)
	end as NomAfficher,
	replace(replace(inst.Tel2,'.',''),' ','') as Telephone
From TInstallateursCompte c
	inner join TInstallateursCoordonnees inst on inst.RefInstallUnique = c.RefInstallUnique
Where c.Actif = 1 and c.RefInstallUnique > 1 and not ifnull(trim(inst.Tel2),'')=''
) as a
order by a.UTILISATEUR, a.NomAfficher