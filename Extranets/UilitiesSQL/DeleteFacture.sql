Set @RefFacture = (Select RefFacture FROM TFacture Where NumeroFacture = 'F35MR1505-01');
Delete From TStatsEtudes Where exists (Select 1 From TDetailFacture  Where TDetailFacture.RefFacture = @RefFacture and TDetailFacture.RefDetailFacture = TStatsEtudes.RefDetailFacture);
Delete From TDetailFacture Where TDetailFacture.RefFacture = @RefFacture;
Delete From TFactureAttente Where TFactureAttente.RefFacture = @RefFacture;
Delete From TFactureParam Where TFactureParam.RefFacture = @RefFacture;
Delete From TFacture Where RefFacture = @RefFacture ;

Set @RefDevis = 17632;
Delete From TDetailDevis Where TDetailDevis.RefDevis = @RefDevis;
Delete From TDevisParam Where TDevisParam.RefDevis = @RefDevis;
Delete From TDevis Where RefDevis = @RefDevis ;

Delete From TDetailFacture Where exists(select 1 from TFacture where TDetailFacture.RefFacture = TFacture.RefFacture and TFacture.NumeroFacture like 'F35BPO1409-%');
Delete From TFactureAttente Where exists(select 1 from TFacture where TFactureAttente.RefFacture = TFacture.RefFacture and TFacture.NumeroFacture like 'F35BPO1409-%');
Delete From TFactureParam Where exists(select 1 from TFacture where TFactureParam.RefFacture = TFacture.RefFacture and TFacture.NumeroFacture like 'F35BPO1409-%');
Delete From TFacture Where TFacture.NumeroFacture like 'F35BPO1409-%' ;


Delete From TDetailFacture Where TDetailFacture.RefFacture in (17797,17796,17793,17792,17747);
Delete From TFactureAttente Where TFactureAttente.RefFacture in (17797,17796,17793,17792,17747);
Delete From TFactureParam Where TFactureParam.RefFacture in (17797,17796,17793,17792,17747);
Delete From TFacture Where RefFacture in (17797,17796,17793,17792,17747);

select * from TFacture 
where not exists(select 1 from TDetailFacture where TDetailFacture.RefFacture = TFacture.RefFacture)
and DateEmission > '2014-01-01'

Set @RefFacture = (Select RefFacture FROM TFacture Where NumeroFacture = 'F56MR1410-04');
Delete From TDetailFacture Where TDetailFacture.RefFacture = @RefFacture;
Delete From TFactureAttente Where TFactureAttente.RefFacture = @RefFacture;
Delete From TFactureParam Where TFactureParam.RefFacture = @RefFacture;
Delete From TFacture Where RefFacture = @RefFacture ;