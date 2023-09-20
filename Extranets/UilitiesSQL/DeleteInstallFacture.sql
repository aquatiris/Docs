Set @RefInstallFacture = 1929;
Set @RefDetailFacture = 108149;

Set @RefFicheInstall = 62029;
Set @RefInstallFacture = (Select RefInstallFacture FROM TInstallFacture Where RefInstallation = @RefFicheInstall);

DELETE FROM TInstallFacture WHERE RefInstallFacture = @RefInstallFacture ;
DELETE FROM TInstallFactureParam2 WHERE RefInstallFacture = @RefInstallFacture ;
DELETE FROM TInstallFactureParam WHERE RefInstallFacture = @RefInstallFacture ;
DELETE FROM TInstallFactureAttente WHERE RefInstallFacture = @RefInstallFacture ;
DELETE FROM TInstallFactureParamAuto WHERE RefInstallFacture = @RefInstallFacture ;

Update TStatsEtudes set DateTravaux = null, TravauxRealises = null, RefInstallateur = null, NomInstallateur=null Where RefDetailFacture = @RefDetailFacture;
Update TFicheInstall Set DateFacture = null Where RefDetailFacture = @RefDetailFacture;

--Suppression par la RefFicheInstall
Set @RefFicheInstall = 61135;
Set @RefInstallFacture = (Select RefInstallFacture FROM TInstallFacture Where RefInstallation = @RefFicheInstall);
Set @RefFactureSARL = (Select RefFacture FROM TFacture Where RefInstallFacture = @RefInstallFacture and RefBE = -3);
Set @RefFactureBE = (Select RefFacture FROM TFacture Where RefInstallFacture = @RefInstallFacture and RefBE <> -3);

DELETE FROM TInstallAcompte WHERE RefInstallation = @RefFicheInstall;
DELETE FROM TInstallFactureParam2 WHERE Exists (select 1 from TInstallFacture WHERE TInstallFacture.RefInstallFacture = TInstallFactureParam2.RefInstallFacture and RefInstallation = @RefFicheInstall) ;
DELETE FROM TInstallFactureParam WHERE Exists (select 1 from TInstallFacture WHERE TInstallFacture.RefInstallFacture = TInstallFactureParam.RefInstallFacture and RefInstallation = @RefFicheInstall) ;
DELETE FROM TInstallFactureAttente WHERE Exists (select 1 from TInstallFacture WHERE TInstallFacture.RefInstallFacture = TInstallFactureAttente.RefInstallFacture and RefInstallation = @RefFicheInstall) ;
DELETE FROM TInstallFactureParamAuto WHERE Exists (select 1 from TInstallFacture WHERE TInstallFacture.RefInstallFacture = TInstallFactureParamAuto.RefInstallFacture and RefInstallation = @RefFicheInstall) ;
DELETE FROM TInstallFacture WHERE RefInstallation = @RefFicheInstall ;

Update TStatsEtudes set DateTravaux = null, TravauxRealises = null, RefInstallateur = null, NomInstallateur=null 
Where Exists (Select 1 From TFicheInstall Where TFicheInstall.RefFicheInstall=@RefFicheInstall and TFicheInstall.RefDetailFacture = TStatsEtudes.RefDetailFacture);
Update TFicheInstall Set DateFacture = null Where RefFicheInstall = @RefFicheInstall;

Delete From TDetailFacture Where TDetailFacture.RefFacture = @RefFactureSARL;
Delete From TFactureAttente Where TFactureAttente.RefFacture = @RefFactureSARL;
Delete From TFactureParam Where TFactureParam.RefFacture = @RefFactureSARL;
Delete From TFacture Where RefFacture = @RefFactureSARL ;

Delete From TDetailFacture Where TDetailFacture.RefFacture = @RefFactureBE;
Delete From TFactureAttente Where TFactureAttente.RefFacture = @RefFactureBE;
Delete From TFactureParam Where TFactureParam.RefFacture = @RefFactureBE;
Delete From TFacture Where RefFacture = @RefFactureBE ;
