UPDATE saskitps_product_attribute pa set pa.price = 86.38 where pa.id_product = 563 and pa.id_product_attribute = 2352 ;
UPDATE saskitps_product_attribute_shop pa set pa.price = 86.38 where pa.id_product = 563 and pa.id_product_attribute = 2352 ;
UPDATE saskitps_product_attribute pa set pa.price = 180.62 where pa.id_product = 558 and pa.id_product_attribute = 2336 ;
UPDATE saskitps_product_attribute_shop pa set pa.price = 180.62 where pa.id_product = 558 and pa.id_product_attribute = 2336 ;

UPDATE TSaskit set PrixMagasin = 804.12 WHERE RefPrestashop = 563 and id_product_attribute = 2352 ;
UPDATE TSaskit set PrixMagasin = 1043.76 WHERE RefPrestashop = 558 and id_product_attribute = 2336 ;