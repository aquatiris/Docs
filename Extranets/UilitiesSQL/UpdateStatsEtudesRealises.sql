Select * From TStatsEtudes
Where DateTravaux is null and 
exists (select 1 from TFicheInstall Where RefDetailFacture = TStatsEtudes.RefDetailFacture and not DateFacture is null);

Select * From TStatsEtudes
Where DateTravaux is null and 
exists (select 1 from TInstallations Where RefDetailFacture = TStatsEtudes.RefDetailFacture and not DateFacture is null);

update TStatsEtudes
	Set DateTravaux = (select DateFacture from TFicheInstall Where RefDetailFacture = TStatsEtudes.RefDetailFacture and not DateFacture is null limit 0,1),
		TravauxRealises = 1
Where DateTravaux is null and 
exists (select 1 from TFicheInstall Where RefDetailFacture = TStatsEtudes.RefDetailFacture and not DateFacture is null)