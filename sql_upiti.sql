-- 1. Ukupan Prihod od Porudzbina:
SELECT SUM(c.iznos) AS ukupni_prihod
FROM cena c
JOIN proizvod p ON p.id_cena = c.id_cena
JOIN proizvodi_u_porudzbini pp ON pp.id_proizvoda = p.id_proizvoda
JOIN porudzbina o ON o.id_porudzbine = pp.id_porudzbine;

-- 2. Recenzija proizvoda:
SELECT p.id_proizvoda, ROUND(AVG(r.ocena), 2) AS ocena_korisnika
FROM proizvod p
LEFT JOIN recenzija r ON p.id_proizvoda = r.id_proizvoda
GROUP BY p.id_proizvoda;

-- 3. Broj prodatih proizvoda po skladistu: 
SELECT s.naziv AS naziv_skladista, COUNT(ps.id_proizvoda) AS broj_proizvoda
FROM skladiste s
JOIN proizvodi_u_skladistu ps ON s.id_skladista = ps.id_skladista
GROUP BY s.naziv;

-- 4. Top 5 proizvoda po ceni: 
SELECT p.naziv AS naziv_proizvoda, SUM(c.iznos) AS prihod
FROM proizvod p
JOIN cena c ON c.id_cena = p.id_cena
JOIN proizvodi_u_porudzbini pp ON pp.id_proizvoda = p.id_proizvoda
JOIN porudzbina o ON o.id_porudzbine = pp.id_porudzbine
GROUP BY p.naziv
ORDER BY prihod DESC
FETCH FIRST 5 ROWS ONLY;

-- 5. Korisnici sa najvise recenzija:
SELECT k.mejl, COUNT(r.id_recenzije) AS broj_recenzija
FROM korisnik k
JOIN recenzija r ON k.id_korisnika = r.id_korisnika
GROUP BY k.mejl
ORDER BY broj_recenzija DESC
FETCH FIRST 5 ROWS ONLY;

-- 6. Broj isporuka po distributivnim centrima: 
SELECT dc.ime AS naziv_distributivnog_centra, SUM(sp.id_slanja_porudzbine) AS ukupno_isporuka
FROM distributivni_centar dc
JOIN slanje_porudzbine sp ON dc.id_distributivnog_centra = sp.id_distributivnog_centra
GROUP BY dc.ime;

-- 7. Prihod po drzavi:
SELECT d.naziv AS naziv_drzave, SUM(c.iznos) AS prihod
FROM cena c
JOIN proizvod p ON p.id_cena = c.id_cena
JOIN proizvodi_u_porudzbini pp ON pp.id_proizvoda = p.id_proizvoda
JOIN porudzbina o ON o.id_porudzbine = pp.id_porudzbine
JOIN lokacija l ON o.id_lokacije = l.id_lokacije
JOIN grad g ON l.id_grada = g.id_grada
JOIN drzava d ON g.id_drzave = d.id_drzave
GROUP BY d.naziv
ORDER BY prihod DESC;

-- 8. Prosecna ocena proizvoda po kategoriji: 
SELECT k.naziv AS kategorija, ROUND(AVG(r.ocena), 2) AS prosecna_ocena
FROM kategorija k
JOIN potkategorija pk ON k.id_kategorije = pk.id_kategorije
JOIN proizvod p ON pk.id_potkategorije = p.id_potkategorije
JOIN recenzija r ON p.id_proizvoda = r.id_proizvoda
GROUP BY k.naziv
ORDER BY prosecna_ocena DESC;

-- 9. Broj proizvoda po porudzbini:
SELECT o.id_porudzbine AS porudzbina, COUNT(DISTINCT pp.id_proizvoda) AS broj_proizvoda
FROM porudzbina o
JOIN proizvodi_u_porudzbini pp ON o.id_porudzbine = pp.id_porudzbine
GROUP BY o.id_porudzbine
ORDER BY broj_proizvoda DESC;

-- 10. Broj korisnika po lokacij:  
SELECT l.adresa AS lokacija, COUNT(DISTINCT lk.id_korisnika) AS broj_korisnika
FROM lokacija l
JOIN lokacije_korisnika lk ON l.id_lokacije = lk.id_lokacije
GROUP BY l.adresa
ORDER BY broj_korisnika DESC;
