Select s.RefSaskit, s.RefPrestashop, s.id_product_attribute, s.Reference, s.PrixMagasin ,mp.PrixMaj, 100 * (mp.PrixMaj-s.PrixMagasin) / s.PrixMagasin as augmentation, mp.PrixMaj-s.PrixMagasin as absolue
From TSaskit s
	INNER JOIN TSaskitMajProduits mp on mp.Reference = s.Reference
Where mp.RefSaskitMaj = 2 and s.Actif = 1 and not s.id_product_attribute is null
order by s.RefPrestashop, mp.PrixMaj;

Select s.RefSaskit, s.RefPrestashop, s.id_product_attribute, s.Reference, s.PrixMagasin ,mp.PrixMaj, 100 * (mp.PrixMaj-s.PrixMagasin) / s.PrixMagasin as augmentation, mp.PrixMaj-s.PrixMagasin as absolue
From TSaskit s
	INNER JOIN TSaskitMajProduits mp on mp.Reference = s.Reference
Where mp.RefSaskitMaj = 2 and s.Actif = 1 and s.id_product_attribute is null
order by s.RefPrestashop, mp.PrixMaj;

 Select s.RefSaskit, s.RefPrestashop, s.id_product_attribute, s.Reference, s.Designation, s.PrixMagasin ,mp.PrixMaj, 100 * (mp.PrixMaj-s.PrixMagasin) / s.PrixMagasin as augmentation, mp.PrixMaj-s.PrixMagasin as absolue
From TSaskit s
	INNER JOIN TSaskitMajProduits mp on mp.Reference = s.Reference
Where mp.RefSaskitMaj = 2 and s.Actif = 0;

select mp.* from TSaskitMajProduits mp
Where mp.RefSaskitMaj = 2 and not exists (select 1 from TSaskit s where mp.Reference = s.Reference)

Select *
From TSaskit s
where s.Reference in ('TOB03','KITTOB03')

INSERT INTO TSaskitMajProduits (RefSaskitMaj, Reference,PrixMaj) values (3,'TOB03',32.71);
INSERT INTO TSaskitMajProduits (RefSaskitMaj, Reference,PrixMaj) values (3,'KITTOB03',77.76);