UPDATE saskitps_product p set p.price = 761, p.date_upd=now() where p.id_product = 122 ;
UPDATE saskitps_product_shop p set p.price = 761, p.date_upd=now() where p.id_product = 122 ;

UPDATE saskitps_product_attribute pa set pa.price = 0 where pa.id_product = 122 and pa.id_product_attribute = 2456 ;
UPDATE saskitps_product_attribute_shop pa set pa.price = 0 where pa.id_product = 122 and pa.id_product_attribute = 2456 ;

UPDATE saskitps_product_attribute pa set pa.price = 40.52 where pa.id_product = 122 and pa.id_product_attribute = 2457 ;
UPDATE saskitps_product_attribute_shop pa set pa.price = 40.52 where pa.id_product = 122 and pa.id_product_attribute = 2457 ;

UPDATE TSaskit sas set sas.OldPrix = sas.PrixMagasin, sas.PrixMagasin = 761, sas.DateModification = NOW() where sas.RefPrestashop = 122 and sas.id_product_attribute = 2456;

	

UPDATE TSaskit sas set sas.OldPrix = sas.PrixMagasin, sas.PrixMagasin = 801.52, sas.DateModification = NOW() where sas.RefPrestashop = 122 and sas.id_product_attribute = 2457;

