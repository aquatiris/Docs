INSERT INTO TBECompte (`RefBE`, `RefProfil`, RefProfilServiceSAS, RefProfilFonctionSAS, `Courriel`, `pwd`, IsPwdToChange, `Actif`, IsSARL, IsQuadraSARL, `SIRET`, `Statut`, `Capital`, `RCS`, `CodeAPE`, `NTVA`, `Acompte`, `TVA293B`, `ReventePiece`, `IsAssurance`, `CompteTVA`, `CodeJournal`, `CompteTVA2`, `AdheIdentifiant`, `DATE_MODIF`, `DATE_CREATION`) VALUES
(-30, -2, 7, 7, 'dominique.legendre@aquatiris.fr', '374d64ffbf93f85df38cd75c40d8cbb3', 0, 1, 1, 1, '', '', '', '', '', '', '', 0, 0, 1, NULL, NULL, NULL, NULL, now(), now());

INSERT INTO TBECoordonnees (`RefBE`, `CodeBE`, `CodeBE2020`, `Nom`, `Prenom`, `Adresse1`, `Adresse2`, `NomEntreprise`, `CP`, `Ville`, `PAYS`, `CodeCommune`, `TelFixe`, `TelPortable`, `Dept`, `latitude`, `longitude`, `search_count_latlng`, `ISO_30`, `ISO_60`, `DATE_MODIF`, `DATE_CREATION`) VALUES
(-30, '35DL', '35DL', 'LEGENDRE', 'Dominique', '', '', 'AQUATIRIS SAS', '35310', 'Breal-sous-montfort', 'FR', NULL, '', '', '35', NULL, NULL, 0, NULL, NULL, now(), now());

INSERT INTO TBEParametres (`RefBE`, `ModeComptable`, `Kit`, `DATE_MODIF`, `DATE_CREATION`) VALUES
(-30, 0, 0, now(), now());

INSERT INTO `TAquaConnect` (`RefBE`, Droit) values (-30, 2);

update TBEParametres
   Inner join TBEParametres b on b.RefBE = 1
  Set TBEParametres.RefTemplateFacture1 = null, 
  TBEParametres.RefTemplateDevis1 = b.RefTemplateDevis1, 
  TBEParametres.RefTemplateDevis2 = b.RefTemplateDevis2, 
  TBEParametres.RefTemplateMailDevis = b.RefTemplateMailDevis, 
  TBEParametres.RefTemplateMailFacture = b.RefTemplateMailFacture, 
  TBEParametres.RefTemplateMailRelance = b.RefTemplateMailRelance, 
  TBEParametres.RefTemplateMailCertificatClient = b.RefTemplateMailCertificatClient, 
  TBEParametres.RefTemplateMailCertificatSpanc = b.RefTemplateMailCertificatSpanc, 
  TBEParametres.RefTemplateMailPVSpanc = b.RefTemplateMailPVSpanc
Where TBEParametres.RefBE in (-30);

SET @RefBE = -30 ;
Set @RefBETVA = 1 ;

INSERT INTO TProduits (RefBE, Designation, PrixUnitaireHT, TauxTVA, IsIndiv, IsRedevance, IsTravaux, IsEtude, IsEtudeEaux, IsEtudeDTU, IsREEB, IsActiviteBE, Actif, IsBoutique, Stock,
                       IsReception, IsAutoConstructeur, IsAssurance, IsRevente, IsAttestation, CompteProduit, IsEtudeBEConv, CodeTVA, DateCreation, DateHst )
Select @RefBE, Designation, PrixUnitaireHT, TauxTVA, IsIndiv, IsRedevance, IsTravaux, IsEtude, IsEtudeEaux, IsEtudeDTU, IsREEB, IsActiviteBE, Actif, IsBoutique, Stock,
       IsReception, IsAutoConstructeur, IsAssurance, IsRevente, IsAttestation, CompteProduit, IsEtudeBEConv, CodeTVA, NOW(), NULL
From TProduits
Where RefBE = @RefBETVA;

Set @BEReferent = 1 ;
Set @RefInstallUnique = NULL ;
Set @RefBE = -30 ;
Set @RefBESalarie = NULL ;
INSERT INTO ACTUALITE_CHANNEL_ABONNES (channel_id, RefBE, RefBESalarie, RefInstallUnique, IsVue, DATE_MODIFICATION, DATE_CREATION, DATE_VUE, DATE_OLD_VUE)
Select a.channel_id, @RefBE, @RefBESalarie, @RefInstallUnique, 0, NOW(), NOW(), '2017-01-01', '2017-01-01'  
From ACTUALITE_CHANNEL_ABONNES a
	inner join ACTUALITE_CHANNEL c on c.channel_id = a.channel_id
Where a.RefBE = @BEReferent and c.Actif = 1 and
	not exists (select 1 from ACTUALITE_CHANNEL_ABONNES where channel_id = @channel_id and ifnull(a.RefBESalarie,0) = ifnull(@RefBESalarie,0) and not a.RefBESalarie is null and a.RefInstallUnique is null and a.RefBE is null) and
	not exists (select 1 from ACTUALITE_CHANNEL_ABONNES where channel_id = @channel_id and ifnull(a.RefBE,0) = ifnull(@RefBE,0) and not RefBE is null and a.RefInstallUnique is null and a.RefBESalarie is null) and
	not exists (select 1 from ACTUALITE_CHANNEL_ABONNES where channel_id = @channel_id and ifnull(a.RefInstallUnique,0) = ifnull(@RefInstallUnique,0) and not a.RefInstallUnique is null and a.RefBE is null and a.RefBESalarie is null);

Set @login = 'dlegendre' ;
Set @courriel = 'dominique.legendre@aquatiris.fr' ;
Set @nom = 'LEGENDRE' ;
Set @prenom = 'Dominique' ;
Set @profil = 'type_be' ;
insert into wp_users(user_login, user_pass, user_nicename, user_email, user_registered,display_name) 
select @login,'',@login,@courriel,NOW(),concat(@prenom,' ',@nom)
From wp_users Where ID = 1 and not exists (select 1 from wp_users where user_email = @courriel);
Set @user_id = (Select ID From wp_users Where user_email = @courriel limit 1) ;
insert into wp_usermeta(user_id, meta_key, meta_value) select @user_id, 'nickname', user_nicename from wp_users where ID = @user_id and not exists (select 1 from wp_usermeta where user_id = @user_id and meta_key = 'nickname');
insert into wp_usermeta(user_id, meta_key, meta_value) select @user_id, 'first_name', @nom from wp_users where ID = @user_id and not exists (select 1 from wp_usermeta where user_id = @user_id and meta_key = 'first_name');
insert into wp_usermeta(user_id, meta_key, meta_value) select @user_id, 'last_name', @prenom from wp_users where ID = @user_id and not exists (select 1 from wp_usermeta where user_id = @user_id and meta_key = 'last_name');
insert into wp_usermeta(user_id, meta_key, meta_value) select @user_id, 'wp_capabilities', 'a:1:{s:13:""installateurs"";b:1;}' from wp_users where ID = @user_id and @profil = 'type_install' and not exists (select 1 from wp_usermeta where user_id = @user_id and meta_key = 'wp_capabilities');
insert into wp_usermeta(user_id, meta_key, meta_value) select @user_id, 'wp_capabilities', 'a:1:{s:9:""franchiss"";b:1;}' from wp_users where ID = @user_id and @profil = 'type_be' and not exists (select 1 from wp_usermeta where user_id = @user_id and meta_key = 'wp_capabilities');
insert into wp_usermeta(user_id, meta_key, meta_value) select @user_id, 'wp_capabilities', 'a:2:{s:6:""editor"";b:1;s:15:""bbp_participant"";b:1;}' from wp_users where ID = @user_id and @profil = 'type_sarl' and not exists (select 1 from wp_usermeta where user_id = @user_id and meta_key = 'wp_capabilities');
