Set @RefFicheAuto = 1522;
Delete From TAcompteAutoconstructeur Where RefFicheAuto = @RefFicheAuto;
Delete From TDetailFacture Where exists (select 1 From TFacture where TFacture.RefFacture = TDetailFacture.RefFacture and (TFacture.RefFicheAuto = @RefFicheAuto or TFacture.RefFicheAuto = -@RefFicheAuto));
Delete From TFactureAttente Where exists (select 1 From TFacture where TFacture.RefFacture = TFactureAttente.RefFacture and (TFacture.RefFicheAuto = @RefFicheAuto or TFacture.RefFicheAuto = -@RefFicheAuto));
Delete From TFactureParam Where exists (select 1 From TFacture where TFacture.RefFacture = TFactureParam.RefFacture and (TFacture.RefFicheAuto = @RefFicheAuto or TFacture.RefFicheAuto = -@RefFicheAuto));
Delete From TFacture Where RefFicheAuto = @RefFicheAuto or RefFicheAuto = -@RefFicheAuto;

Set @RefDetailFacture = 103160;
Update TStatsEtudes set DateTravaux = null, TravauxRealises = null Where RefDetailFacture = @RefDetailFacture;
Update TFicheInstall Set DateFacture = null Where RefDetailFacture = @RefDetailFacture;
