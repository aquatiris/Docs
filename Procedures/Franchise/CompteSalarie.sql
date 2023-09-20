INSERT INTO TBECompte (`RefBE`, `RefBEParent`,`RefPrestashop`,`RefGuide`, `RefProfil`, `Courriel`, `pwd`, IsPwdToChange, `Actif`, IsSARL, IsQuadraSARL, `SIRET`, `Statut`, `Capital`, `RCS`, `CodeAPE`, `NTVA`, `Acompte`, `TVA293B`, `ReventePiece`, `IsAssurance`, `CompteTVA`, `CodeJournal`, `CompteTVA2`, `AdheIdentifiant`, `DATE_MODIF`, `DATE_CREATION`) VALUES
(11272, 11238, 291, 324, 8, 'hadrien.frances@aquatiris.fr', 'a904181ac96212a20deac897fbdc0efa', 0, 1, 0, 0, '', '', '', '', '', '', '', 0, 0, 1, NULL, NULL, NULL, NULL, now(), now());

INSERT INTO TBECoordonnees (`RefBE`, `CodeBE`, `CodeBE2020`, `Nom`, `Prenom`, `Adresse1`, `Adresse2`, `NomEntreprise`, `CP`, `Ville`, `PAYS`, `CodeCommune`, `TelFixe`, `TelPortable`, `Dept`, `latitude`, `longitude`, `search_count_latlng`, `ISO_30`, `ISO_60`, `DATE_MODIF`, `DATE_CREATION`) VALUES
(11272, '35HF', '35HF', 'FRANCES', 'Hadrien', 'Le Haut Houx', '', 'FIL D\'Ô', '35560', 'Bazouges-la-Pérouse', 'FR', 35019, '', '06 14 31 11 26', '35,22,53',48.4328,-1.52196, 0, NULL, NULL, now(), now());

INSERT INTO TBEParametres (`RefBE`, `ModeComptable`, `Kit`, `DATE_MODIF`, `DATE_CREATION`) VALUES
(11272, 0, 0, now(), now());

Set @BEReferent = 11238 ;
Set @RefInstallUnique = NULL ;
Set @RefBE = 11272 ;
Set @RefBESalarie = NULL ;
INSERT INTO ACTUALITE_CHANNEL_ABONNES (channel_id, RefBE, RefBESalarie, RefInstallUnique, IsVue, DATE_MODIFICATION, DATE_CREATION, DATE_VUE, DATE_OLD_VUE)
Select a.channel_id, @RefBE, @RefBESalarie, @RefInstallUnique, 0, NOW(), NOW(), '2017-01-01', '2017-01-01'  
From ACTUALITE_CHANNEL_ABONNES a
	inner join ACTUALITE_CHANNEL c on c.channel_id = a.channel_id
Where a.RefBE = @BEReferent and c.Actif = 1 and
	not exists (select 1 from ACTUALITE_CHANNEL_ABONNES where channel_id = @channel_id and ifnull(a.RefBESalarie,0) = ifnull(@RefBESalarie,0) and not a.RefBESalarie is null and a.RefInstallUnique is null and a.RefBE is null) and
	not exists (select 1 from ACTUALITE_CHANNEL_ABONNES where channel_id = @channel_id and ifnull(a.RefBE,0) = ifnull(@RefBE,0) and not RefBE is null and a.RefInstallUnique is null and a.RefBESalarie is null) and
	not exists (select 1 from ACTUALITE_CHANNEL_ABONNES where channel_id = @channel_id and ifnull(a.RefInstallUnique,0) = ifnull(@RefInstallUnique,0) and not a.RefInstallUnique is null and a.RefBE is null and a.RefBESalarie is null);