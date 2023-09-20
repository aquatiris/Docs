--Suppression par la RefFicheInstall
Set @RefFicheInstall = 61680;
Set @RefInstallDevis = (Select RefInstallDevis FROM TInstallDevis Where RefInstallation = @RefFicheInstall limit 1);

DELETE FROM TInstallDevisParam2 WHERE Exists (select 1 from TInstallDevis WHERE TInstallDevis.RefInstallDevis = TInstallDevisParam2.RefInstallDevis and RefInstallation = @RefFicheInstall) ;
DELETE FROM TInstallDevisParam WHERE Exists (select 1 from TInstallDevis WHERE TInstallDevis.RefInstallDevis = TInstallDevisParam.RefInstallDevis and RefInstallation = @RefFicheInstall) ;
DELETE FROM TInstallDevisParamAuto WHERE Exists (select 1 from TInstallDevis WHERE TInstallDevis.RefInstallDevis = TInstallDevisParamAuto.RefInstallDevis and RefInstallation = @RefFicheInstall) ;
DELETE FROM TInstallDevis WHERE RefInstallation = @RefFicheInstall ;

Update TStatsEtudes set DateTravaux = null, TravauxRealises = null, RefInstallateur = null, NomInstallateur=null 
Where Exists (Select 1 From TFicheInstall Where TFicheInstall.RefFicheInstall=@RefFicheInstall and TFicheInstall.RefDetailFacture = TStatsEtudes.RefDetailFacture);
Update TFicheInstall Set DateDevis = null Where RefFicheInstall = @RefFicheInstall;