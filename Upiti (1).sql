SELECT uposlenik_id,
prezime_uposlenika,
ime_uposlenika,
broj_tel, plata_uposlenika_KM,
titula_uposlenika
FROM uposlenici
WHERE titula_uposlenika = 'menadzer';

SELECT sr.racun_id, 
r.racun_id,
r.datum_izdavanja
FROM stavke_racuna sr 
LEFT JOIN racun r USING (racun_id)
WHERE r.datum_izdavanja BETWEEN "2020-01-01" AND "2020-07-01";

SELECT *
FROM lijek
WHERE cijena BETWEEN 8 AND 11
ORDER BY  cijena DESC;

SELECT kupac_id,
ime_kupca,
prezime_kupca
FROM kupac
WHERE ime_kupca LIKE "M%";

SELECT naziv,grad
FROM apoteka
WHERE grad ="Sarajevo"
ORDER BY naziv DESC;

SELECT uposlenik_id,
ime_uposlenika,
prezime_uposlenika, grad
FROM uposlenici
WHERE grad="Mostar";

SELECT k.*
FROM kupac k 
LEFT JOIN stavke_racuna sr 
ON sr.kupac_id=k.kupac_id
WHERE sr.recept_id IS NOT NULL;

SELECT u.uposlenik_id,
u.ime_uposlenika,
u.prezime_uposlenika,
a.naziv
FROM uposlenici u
INNER JOIN apoteka a USING(apoteka_id)
WHERE a.naziv="Vita";

SELECT uposlenik_id,
       prezime_uposlenika,
       ime_uposlenika, 
        titula_uposlenika,
        plata_uposlenika_KM
FROM uposlenici
WHERE plata_uposlenika_KM>1000 
ORDER BY prezime_uposlenika DESC;

SELECT uposlenik_id,
       ime_uposlenika AS ime,
       prezime_uposlenika AS prezime,
       titula_uposlenika 
 FROM uposlenici 
 ORDER BY titula_uposlenika ;
 
 SELECT k.kupac_id,
       k.ime_kupca,
       k.prezime_kupca,
       l.lijek_id,
        l.naziv_lijeka
FROM kupac k
LEFT JOIN stavke_racuna sr
ON k.kupac_id=sr.kupac_id
LEFT JOIN lijek l
ON l.lijek_id=sr.lijekovi_id
WHERE l.naziv_lijeka="gastal"
ORDER BY prezime_kupca DESC;

select bolnica_id,
količina
from recept
where količina >(select avg(količina) from recept);
 
 

