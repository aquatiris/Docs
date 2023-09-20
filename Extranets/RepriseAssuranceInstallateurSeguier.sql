SET @RefUnique = (Select RefClientUnique FROM TClientsBE Where RefClient = 22166) ;
SET @NbActifs = (Select count(*)-1 FROM TClientsBE Where RefClientUnique = @RefUnique and Actif = 1) ;
		
Select 	@RefUnique, @NbActifs ;
	
Insert Into TClientsHistorique (RefClientUnique, RefAuteur, Statut, Visibilite, Commentaire, DATE_CREATION)	
		Values (@RefUnique, 98, 0, 0, '<p>test</p>', NOW());
		
		Update TClientsCompte 
		Set DateHst = (Case When Actif = 1 and @NbActifs > 0 and 0 = 0 Then NOW() else DateHst end),
			DATE_MODIF = (Case When Actif = 1 and @NbActifs > 0 and 0 = 0 Then NOW() else DATE_MODIF end),
			Actif = (Case When Actif = 1 and @NbActifs > 0 and 0 = 0 Then 0 else Actif end)
		Where RefClientUnique = @RefUnique ;
		
$(".RefInstallFacture").each(function () {
	var $td = $(this).closest("td");
	var nom = $td.attr("title") ;
	console.log($(this).val() + ' ' + nom);
});		

3443 Chantier Pierre THIOLLIERE
3320 Chantier Marie JosÃ¨phe Kempf
3173 Chantier mÃ©lanie morin
3113 Chantier StÃ©phane Debez
3054 Chantier Aurelien Cortier
2921 Chantier gertrudis Demoyer
2839 Chantier Auto Install Guillaume SMAGGHE

Select f.Montant-ifnull(f.TVA196,0)+ifnull(ia.MontantHT,0)-ifnull(p.MontantRedevanceBE,150)-ifnull(p.MontantRedevanceSARL,150)-ifnull(p.MontantControle,175)-ifnull(p.MontantAttestation,150) as HT,
		(f.Montant-ifnull(f.TVA196,0)+ifnull(ia.MontantHT,0)-ifnull(p.MontantRedevanceBE,150)-ifnull(p.MontantRedevanceSARL,150)-ifnull(p.MontantControle,200)-ifnull(p.MontantAttestation,150)) * 0.01876 as Assurance,
	p.MontantRedevanceBE, p.MontantRedevanceSARL, p.MontantControle, p.MontantAttestation, ia.RefInstallation, 
	 f.* 

	FROM TInstallFacture f	
		left join TInstallFactureParam2 p on p.RefInstallFacture = f.RefInstallFacture 
	LEFT JOIN (select RefInstallation, sum(MontantHT) as MontantHT, sum(MontantTVA) as TVA from TInstallAcompte group by RefInstallation) as ia 	
		on ia.RefInstallation = f.RefInstallation
Where  f.RefInstallFacture in (3443,3320,3173,3113,3054,2921,2839)  ;		

Where f.RefInstallFacture in (3443,3320,3173,3113,3054,2921,2839)