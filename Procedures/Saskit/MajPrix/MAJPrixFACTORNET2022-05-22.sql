UPDATE TSaskit sas set sas.OldPrix = sas.PrixMagasin, sas.PrixMagasin = 32.71, sas.DateModification = NOW() where sas.RefSaskit = 104 ;
UPDATE TSaskit sas set sas.OldPrix = sas.PrixMagasin, sas.PrixMagasin = 77.76, sas.DateModification = NOW() where sas.RefSaskit = 58 ;


INSERT INTO TSaskitMajProduits (RefSaskitMaj, Reference,PrixMaj) values (3,'TOB03',32.71);
INSERT INTO TSaskitMajProduits (RefSaskitMaj, Reference,PrixMaj) values (3,'KITTOB03',77.76);


INSERT INTO TSaskitArchivePrix (RefSaskit,Prix,DATE_MODIF) Select RefSaskit, OldPrix, DateModification From TSaskit Where RefSaskit = 104;
UPDATE TSaskit sas set sas.OldPrix = sas.PrixMagasin, sas.PrixMagasin = 32.71, sas.DateModification = NOW() where sas.RefSaskit = 104 ;
INSERT INTO TSaskitArchivePrix (RefSaskit,Prix,DATE_MODIF) Select RefSaskit, OldPrix, DateModification From TSaskit Where RefSaskit = 58;
UPDATE TSaskit sas set sas.OldPrix = sas.PrixMagasin, sas.PrixMagasin = 77.76, sas.DateModification = NOW() where sas.RefSaskit = 58 ;
