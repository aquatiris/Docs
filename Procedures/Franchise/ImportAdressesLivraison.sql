SET @olID = 16 ;
SET @newID = 337 ;
INSERT INTO `saskitps_address`(`id_country`, `id_state`, `id_customer`, `RefClientUnique`, `RefInstallUnique`, `id_manufacturer`, `id_supplier`, `id_warehouse`, `alias`, `company`, `lastname`, `firstname`, `address1`, `address2`, `postcode`, `city`, `other`, `phone`, `phone_mobile`, `vat_number`, `dni`, `date_add`, `date_upd`, `active`, `deleted`) 
Select `id_country`, `id_state`, @newID, `RefClientUnique`, `RefInstallUnique`, `id_manufacturer`, `id_supplier`, `id_warehouse`, `alias`, `company`, `lastname`, `firstname`, `address1`, `address2`, `postcode`, `city`, `other`, `phone`, `phone_mobile`, `vat_number`, `dni`, `date_add`, `date_upd`, `active`, `deleted`
from saskitps_address
Where id_customer = @olID ;

SET @olID = 19 ;
SET @newID = 333 ;
INSERT INTO `saskitps_address`(`id_country`, `id_state`, `id_customer`, `RefClientUnique`, `RefInstallUnique`, `id_manufacturer`, `id_supplier`, `id_warehouse`, `alias`, `company`, `lastname`, `firstname`, `address1`, `address2`, `postcode`, `city`, `other`, `phone`, `phone_mobile`, `vat_number`, `dni`, `date_add`, `date_upd`, `active`, `deleted`) 
Select `id_country`, `id_state`, @newID, `RefClientUnique`, `RefInstallUnique`, `id_manufacturer`, `id_supplier`, `id_warehouse`, `alias`, `company`, `lastname`, `firstname`, `address1`, `address2`, `postcode`, `city`, `other`, `phone`, `phone_mobile`, `vat_number`, `dni`, `date_add`, `date_upd`, `active`, `deleted`
from saskitps_address
Where id_customer = @olID ;

Update TInstallateursCompte c
	inner join TInstallateursBE be on be.RefInstallUnique = c.RefInstallUnique
set c.RefProfil = 101
where be.RefBE = 1153 and be.Actif = 1 and be.RefInstallUnique>1;

Update TInstallateursBE
set RefProfil = 101
where RefBE = 1153 and RefInstallUnique>1;


Update TInstallateursCompte c
	inner join TInstallateursBE be on be.RefInstallUnique = c.RefInstallUnique
set c.RefProfil = 101
where be.RefBE = 1008 and be.Actif = 1 and c.Actif = 1 and be.RefInstallUnique>1