Set @DateDeb = '2022-04-01';
Set @DateFin = '2022-04-30';
Set @RefBE = 11200;

Select a.Numero,a.RaisonSociale,a.Nom,a.Prenom,a.Ville,a.CodePostal,a.Montant as MontantTTC,(a.Montant - ifnull(a.TVANormale,0) - ifnull(a.TVAReduite,0) ) as MontantHT,ifnull(a.TVANormale,0) as TVANormale, ifnull(a.TVAReduite,0) as TVAReduite,a.DateCompta,a.DateEmission,a.DateReglement,a.typeFacture as typeChantier,a.Zone,a.NomClientStation as ClientChantier,a.VilleStation as VilleChantier,a.CodePostalStation CodePostalChantier
		From (
				SELECT g.RaisonSociale, g.Nom, g.Prenom, g.CodePostal, g.Ville, g.Courriel, g.TelephoneFixe, g.TelephonePortable, facture.RefAvoir as ID_FACTURE, 
					f.RefFacture as RefFacture, facture.RefAvoir, f.NumeroFacture, facture.NumeroAvoir, facture.Montant, facture.TVANormale, facture.TVAReduite, facture.DateEmission, facture.DateCompta,
					facture.DateReglement, facture.RefClient, facture.RefBE, facture.RefInstallFacture, facture.RefFicheAuto, facture.RefPluvialAuto, 
					facture.IsFicheAutoAcompte, facture.IsFactureInter, facture.Payer, facture.IsFraction, facture.Actif, facture.IsAvoir, facture.NumeroAvoir as Numero,
					b.RefStats, b.ID_Controle, b.DateSpanc, b.DateAttestation, b.IsAutoConstructeur, b.IsFactureStation,
					b.IsDevisStation, b.IsVisualisationFiche, b.IsMine, b.NbFiches, b.IsOld,
					d.RefDetailFactureEtude,
					c.HasEtude,
					c.IsCommissionTravaux,
					case when ifact.RefInstallFacture is null then iAuto.NomClientStation else ifact.NomClientStation end as NomClientStation,
					case when ifact.RefInstallFacture is null then iAuto.PrenomClientStation else ifact.PrenomClientStation end as PrenomClientStation,
					null as VilleStation,
					null as CodePostalStation,
					'AVOIR' as typeFacture,
					ifnull(g2.ZoneBE,'HZ') as Zone
				FROM (Select TAvoir.*, -1 as IsAvoir, '' as NumeroFacture, '' as DateReglement, null as RefInstallFacture, null as RefFicheAuto, null as RefPluvialAuto, null as IsFicheAutoAcompte, null as IsFactureInter, 1 as Payer, 0 as IsFraction, 1 as Actif From TAvoir) as facture
					INNER JOIN TBECompte be on facture.RefBE = be.RefBE
					INNER JOIN TClientsBE a on facture.RefClient = a.RefClient
					INNER JOIN TClientsCompte g on a.RefClientUnique = g.RefClientUnique
					LEFT JOIN GEO_Communes_DATA g2 on g.CodeCommune = g2.CodeCommune
					LEFT JOIN TFacture as f on facture.RefFacture = f.RefFacture
					INNER JOIN (Select null as RefInstallFacture, null as NomClientStation, null as PrenomClientStation) ifact on 1=1
					INNER JOIN (Select null as RefInstallFacture, null as NomClientStation, null as PrenomClientStation) ifactIntegre on 1=1
					INNER JOIN (Select null as RefInstallFacture, null as NomClientStation, null as PrenomClientStation) iAuto on 1=1
					INNER JOIN (SELECT null as RefFacture, null as RefStats, null as RefDetailFacture, null as ID_Controle, null as DateSpanc, null as DateAttestation,
									null as IsAutoConstructeur,null as IsFactureStation,null as IsDevisStation,null as IsVisualisationFiche,
									null as IsMine,null as NbFiches,null as IsOld) as b on 1=1
					INNER JOIN (SELECT null as RefFacture, null as HasEtude, null as IsCommissionTravaux) as c on 1=1
					INNER JOIN (SELECT null as RefFactureD, null as RefDetailFactureEtude) as d on 1=1
								
				WHERE (facture.RefBE = @RefBE or (@RefBE = -3 and be.RefProfil<0 and not be.RefBE in (-19,-26)) or 0 = 1) and (g.RefInstallUnique = NULL or NULL is null) and (g.RefBEClient = NULL or NULL is null)
					and ((facture.DateEmission >= @DateDeb or @DateDeb is null) and (facture.DateEmission <= @DateFin or @DateFin is null) )
			UNION
				
				SELECT g.RaisonSociale, g.Nom, g.Prenom, g.CodePostal, g.Ville, g.Courriel, g.TelephoneFixe, g.TelephonePortable, facture.RefFacture as ID_FACTURE, 
					facture.RefFacture, null as RefAvoir, facture.NumeroFacture, null as NumeroAvoir, facture.Montant, facture.TVANormale, facture.TVAReduite, facture.DateEmission, facture.DateCompta,
					facture.DateReglement, facture.RefClient, facture.RefBE, facture.RefInstallFacture, facture.RefFicheAuto, facture.RefPluvialAuto, 
					facture.IsFicheAutoAcompte, facture.IsFactureInter, facture.Payer, facture.IsFraction, facture.Actif, 
					CASE WHEN Payer = -2 THEN 1
						 ELSE 0
					END as IsAvoir, facture.NumeroFacture as Numero, 
					case  When b.RefStats is not null then b.RefStats else i.RefStats end as RefStats,
					case  When b.RefStats is not null then b.ID_Controle else i.ID_Controle end as ID_Controle,
					case  When b.RefStats is not null then b.DateSpanc else i.DateSpanc end as DateSpanc,
					case  When b.RefStats is not null then b.DateAttestation else i.DateAttestation end as DateAttestation,
					case  When b.RefStats is not null then b.IsAutoConstructeur else i.IsAutoConstructeur end as IsAutoConstructeur,
					case  When b.RefStats is not null then b.IsFactureStation else i.IsFactureStation end as IsFactureStation,
					case  When b.RefStats is not null then b.IsDevisStation else i.IsDevisStation end as IsDevisStation,
					case  When b.RefStats is not null then b.IsVisualisationFiche else i.IsVisualisationFiche end as IsVisualisationFiche,
					case  When b.RefStats is not null then b.IsMine else i.IsMine end as IsMine,
					case  When b.RefStats is not null then b.NbFiches else i.NbFiches end as NbFiches,
					case  When b.RefStats is not null then 0 else 1 end as IsOld, 
					d.RefDetailFactureEtude,
					c.HasEtude,
					c.IsCommissionTravaux,
					ifnull(iAuto.NomClientStation,ifnull(ifact.NomClientStation,ifactIntegre.NomClientStation)) as NomClientStation,
					ifnull(iAuto.PrenomClientStation,ifnull(ifact.PrenomClientStation,ifactIntegre.PrenomClientStation)) as PrenomClientStation,
					ifnull(iAuto.VilleStation,ifnull(ifact.VilleStation,ifactIntegre.VilleStation)) as VilleStation,
					ifnull(iAuto.CodePostalStation,ifnull(ifact.CodePostalStation,ifactIntegre.CodePostalStation)) as CodePostalStation,
					case When facture.RefFicheAutoNegatif>0 then iAuto.typeChantier
						When ifactIntegre.RefInstallFacture>0 then 'INTEGRE'
						When ifact.RefInstallFacture>0 then 'INSTALLATEUR'
						else 'AUTRE'
					end as typeFacture,
					ifnull(ifnull(ifnull(iAuto.ZoneBE,ifnull(ifact.ZoneBE,ifactIntegre.ZoneBE)),g2.ZoneBE),'HZ') as Zone
				FROM TFacture facture
					INNER JOIN TBECompte be on facture.RefBE = be.RefBE
					INNER JOIN TClientsBE a on facture.RefClient = a.RefClient
					INNER JOIN TClientsCompte g on a.RefClientUnique = g.RefClientUnique
					LEFT JOIN GEO_Communes_DATA g2 on g.CodeCommune = g2.CodeCommune
					LEFT JOIN (Select RefInstallFacture, CLI.Nom as NomClientStation, CLI.Prenom as PrenomClientStation, g2.ZoneBE, CLI.CodePostal as CodePostalStation, CLI.Ville as VilleStation
								FROM TInstallFacture as T
									INNER JOIN TClientsBE CLIa on T.RefClient = CLIa.RefClient
									INNER JOIN TClientsCompte CLI on CLIa.RefClientUnique = CLI.RefClientUnique
									LEFT JOIN GEO_Communes_DATA g2 on CLI.CodeCommune = g2.CodeCommune
						) as ifact on ifact.RefInstallFacture = facture.RefInstallFacture 
					LEFT JOIN (Select RefInstallFacture, CLI.Nom as NomClientStation, CLI.Prenom as PrenomClientStation, g2.ZoneBE, CLI.CodePostal as CodePostalStation, CLI.Ville as VilleStation
								FROM TInstallFacture as T
									INNER JOIN TClientsBE CLIa on T.RefClient = CLIa.RefClient
									INNER JOIN TClientsCompte CLI on CLIa.RefClientUnique = CLI.RefClientUnique	 
									LEFT JOIN GEO_Communes_DATA g2 on CLI.CodeCommune = g2.CodeCommune          
						) as ifactIntegre on ifactIntegre.RefInstallFacture = facture.RefInstallFactureService 
					LEFT JOIN (Select RefFicheAuto, CLI.Nom as NomClientStation, CLI.Prenom as PrenomClientStation, g2.ZoneBE, CLI.CodePostal as CodePostalStation, CLI.Ville as VilleStation, 
									case When auto.RefInstallReference>0 then 'VENTE_KIT_IR'
										When auto.IsEntreprise>0 then 'VENTE_KIT_PRO'
										else 'VENTE_KIT_AUTO'
									end as typeChantier	
								FROM TFicheInstallAuto as auto
									INNER JOIN TStatsEtudes as se on auto.RefStats = se.RefStats
									INNER JOIN TClientsBE CLIa on se.RefClient = CLIa.RefClient
									INNER JOIN TClientsCompte CLI on CLIa.RefClientUnique = CLI.RefClientUnique
									LEFT JOIN GEO_Communes_DATA g2 on CLI.CodeCommune = g2.CodeCommune
						) as iAuto on iAuto.RefFicheAuto = facture.RefFicheAutoNegatif 
					LEFT JOIN (SELECT df.RefFacture, se.RefStats, TControle.ID_Controle, TControle.DateSpanc, TControle.DateAttestation,
									SUM(fiche.FicheAutoConstructeur) as IsAutoConstructeur,	
									SUM(case 
										when not fiche.DateFacture is null then 1
										else 0
									end) as IsFactureStation,
									SUM(case 
										when not fiche.DateDevis is null then 1
										else 0
									end) as IsDevisStation,
									SUM(case 
										when not fiche.DateDerniereVisualisation is null then 1
										else 0
									end) as IsVisualisationFiche,
									SUM(case 
										when fiche.RefBE = @RefBE then 1
										else 0
									end) as IsMine,
									count(*) as NbFiches
								FROM TDetailFacture df
									INNER JOIN TStatsEtudes se on se.RefDetailFacture = df.RefDetailFacture
									INNER JOIN TFicheInstall fiche on fiche.RefStats = se.RefStats and fiche.Actif = 1
									LEFT JOIN TControle on TControle.RefStats = se.RefStats
								GROUP BY df.RefFacture, se.RefStats, TControle.ID_Controle, TControle.DateSpanc, TControle.DateAttestation
						) as b on b.RefFacture = facture.RefFacture and facture.RefBE>2
					LEFT JOIN (SELECT df.RefFacture, se.RefStats, TControle.ID_Controle, TControle.DateSpanc, TControle.DateAttestation,
								SUM(inst.IsAutoconstructeur) as IsAutoConstructeur,	
								SUM(case 
									when not fiche.DateFacture is null then 1
									else 0
								end) as IsFactureStation,
								SUM(case 
									when not fiche.DateDevis is null then 1
									else 0
								end) as IsDevisStation,
								SUM(case 
									when not fiche.DateDernierVisualisation is null then 1
									else 0
								end) as IsVisualisationFiche,
								SUM(case 
									when fiche.RefBE = @RefBE then 1
									else 0
								end) as IsMine,
								count(*) as NbFiches
							FROM TDetailFacture df
								INNER JOIN TStatsEtudes se on se.RefDetailFacture = df.RefDetailFacture
								INNER JOIN TInstallations fiche on fiche.RefStats = se.RefStats and fiche.Actif = 1
								INNER JOIN TInstallateursBE inst on fiche.RefInstall = inst.RefInstall
								LEFT JOIN TControle on TControle.RefStats = fiche.RefStats
							GROUP BY df.RefFacture, se.RefStats, TControle.ID_Controle, TControle.DateSpanc, TControle.DateAttestation
						) as i on i.RefFacture = facture.RefFacture and facture.RefBE>2
					INNER JOIN (SELECT df.RefFacture, SUM(p.IsEtude) as HasEtude, SUM(CASE WHEN p.IsTravaux = 1 then 1 else 0 end) as IsCommissionTravaux
								FROM TDetailFacture df
									INNER JOIN TProduits p on p.RefProduit = df.RefProduit
								GROUP BY df.RefFacture
						) as c on c.RefFacture = facture.RefFacture
					LEFT JOIN (SELECT df2.RefFacture as RefFactureD, df2.RefDetailFacture as RefDetailFactureEtude
								FROM TDetailFacture df2
									INNER JOIN TProduits p on p.RefProduit = df2.RefProduit
								Where p.IsEtude = 1
						) as d on d.RefFactureD = facture.RefFacture and facture.RefBE>2
						
				WHERE (facture.RefBE = @RefBE or (@RefBE = -3 and be.RefProfil<0 and not be.RefBE in (-19,-26)) or 0 = 1) and (g.RefInstallUnique = NULL or NULL is null) and (g.RefBEClient = NULL or NULL is null)
						and ((facture.DateEmission >= @DateDeb or @DateDeb is null) and (facture.DateEmission <= @DateFin or @DateFin is null) )
		) as a
		order by a.DateEmission desc, a.Numero desc 
		limit 0,10000		
		