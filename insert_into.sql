INSERT INTO drzava (id_drzave, naziv) 
VALUES 
(1, 'Srbija'),
(2, 'Spanija'),
(3, 'Bosna i Hercegovina'),
(4, 'Svajcarska'),
(5, 'Grcka');

INSERT INTO grad (id_grada, naziv, id_drzave) 
VALUES 
(1, 'Beograd', 1),
(2, 'Barselona', 2),
(3, 'Mostar', 3),
(4, 'Cirih', 4),
(5, 'Solun', 5);

INSERT INTO korisnik (id_korisnika, mejl, sifra) 
VALUES 
(1, 'olga@gmail.com', 'olgaolga123'),
(2, 'ana@primer.com', 'anabanana'),
(3, 'petar@primer.com', 'pera'),
(4, 'mira@primer.com', '9283092'),
(5, 'ivan@primer.com', 'sksjdiu');

INSERT INTO lokacija (id_lokacije, id_grada, grad, postanski_broj, adresa) 
VALUES 
(1, 1, 'Beograd', 11000, 'Bulevar kralja Aleksandra 1'),
(2, 2, 'Barselona', 08001, 'La Rambla 2'),
(3, 3, 'Mostar', 88000, 'Stari Most 3'),
(4, 4, 'Cirih', 8001, 'Bahnhofstrasse 4'),
(5, 5, 'Solun', 54625, 'Vardar 5');

INSERT INTO popust (id_popusta, broj) 
VALUES 
(1, 10),
(2, 20),
(3, 30),
(4, 40),
(5, 50);

INSERT INTO porudzbina (id_porudzbine, id_korisnika, sifra_porudzbine, id_lokacije) 
VALUES 
(1, 1, 'JAI293', 1),
(2, 2, 'SKA832', 2),
(3, 3, 'ALS349', 3),
(4, 4, 'SSL344', 4),
(5, 5, 'PWS923', 5);

INSERT INTO cenovnik (id_cenovnika, datum_od, datum_do) 
VALUES 
(1, '2024-01-01', '2024-12-31'),
(2, '2024-02-01', '2024-08-31'),
(3, '2024-03-01', '2024-09-30'),
(4, '2024-04-01', '2024-10-31'),
(5, '2024-05-01', '2024-11-30');

INSERT INTO cena (id_cena, id_cenovnika, iznos, id_popusta) 
VALUES 
(1, 1, 50000, 1),
(2, 2, 10000, 2),
(3, 3, 1500, 3),
(4, 4, 5000, 4),
(5, 5, 200, 5);

INSERT INTO distributivni_centar (id_distributivnog_centra, ime, id_grad) 
VALUES 
(1, 'Centar Beograd', 1),
(2, 'Centar Barselona', 2),
(3, 'Centar Mostar', 3),
(4, 'Centar Cirih', 4),
(5, 'Centar Solun', 5);

INSERT INTO kategorija (id_kategorije, naziv) 
VALUES 
(1, 'Tehnika'),
(2, 'Kozmetika'),
(3, 'Odeca'),
(4, 'Skolski pribor'),
(5, 'Nakit');

INSERT INTO kurirska_sluzba (id_kurirske_sluzbe, naziv) 
VALUES 
(1, 'DHL'),
(2, 'FedEx'),
(3, 'UPS'),
(4, 'Posta Srbije'),
(5, 'GLS');

INSERT INTO lokacije_korisnika (id_korisnika, id_lokacije) 
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO potkategorija (id_potkategorije, naziv, id_kategorije) 
VALUES 
(1, 'Telefoni', 1),
(2, 'Slusalice', 1),
(3, 'Sminka', 2),
(4, 'Nega kose', 2),
(5, 'Zenska odeca', 3),
(6, 'Muska odeca', 3),
(7, 'Olovke', 4),
(8, 'Sveske', 4),
(9, 'Ogrlice', 5),
(10, 'Mindjuse', 5);

INSERT INTO skladiste (id_skladista, naziv, adresa, id_grada) 
VALUES 
(1, 'Skladiste Beograd', 'Bulevar kralja Aleksandra 10', 1),
(2, 'Skladiste Solun', 'La Rambla 12', 2),
(3, 'Skladiste Mostar', 'Stari Most 6', 3),
(4, 'Skladiste Cirih', 'Bahnhofstrasse 9', 4),
(5, 'Skladiste Solun', 'Vardar 20', 5);

INSERT INTO slanje_porudzbine (id_slanja_porudzbine, id_porudzbine, id_kurirske_sluzbe, id_distributivnog_centra) 
VALUES 
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3),
(4, 4, 4, 4),
(5, 5, 5, 5);

INSERT INTO isporuka_porudzbine (id_isporuke, id_porudzbine, id_kurirske_sluzbe, id_distributivnog_centra, id_lokacije, id_korisnika, id_slanja_porudzbine) 
VALUES 
(1, 1, 1, 1, 1, 1, 1),
(2, 2, 2, 2, 2, 2, 2),
(3, 3, 3, 3, 3, 3, 3),
(4, 4, 4, 4, 4, 4, 4),
(5, 5, 5, 5, 5, 5, 5);

INSERT INTO proizvod (id_proizvoda, naziv, opis, id_potkategorije, prosecna_ocena, id_cena) 
VALUES 
(1, 'Pametan telefon', 'Brzi telefon sa dobrom kamerom', 1, 5, 1),
(2, 'Bluetooth slusalice', 'Bezicne slusalice sa dugim trajanjem baterije', 1, 4, 2),
(3, 'Maskara', 'Crna maskara za duge trepavice', 2, 5, 3),
(4, 'Sampon', 'Sampon koji hidrira i obnavlja suvu kosu', 2, 4, 3),
(5, 'Crna haljina', 'Elegantna haljina za vecernje izlaske', 3, 2, 4),
(6, 'Muska kosulja', 'Kosulja za poslovne i opustene prilike', 3, 4, 4),
(7, 'Patent olovka', 'Patent olovka za glatko pisanje', 4, 3, 5),
(8, 'Sveska A4', 'Sveska sa tvrdim koricama u linijama', 4, 4, 5),
(9, 'Zlatna ogrlica', 'Elegantna ogrlica za posebne prilike', 5, 4, 4),
(10, 'Srebrne mindjuse', 'Svakodnevne srebrne mindjuse sa kristalima', 5, 1, 5);

INSERT INTO recenzija (id_recenzije, id_proizvoda, id_korisnika, ocena, komentar) 
VALUES 
(1, 1, 1, 5, 'Telefon je fantastican! Brz je i ima odlicnu kameru.'),
(2, 2, 3, 4, 'Zvuk je odlican, ali nisu udobne za duze nosenje.'),
(3, 3, 2, 5, ' Vrlo sam zadovoljna kako izgleda.'),
(4, 4, 4, 4, 'Pomogao mi je da kosu ucinim meksom'),
(5, 5, 1, 2, 'Izgleda previse jeftino'),
(6, 6, 5, 4, 'Kao sa slike'),
(7, 9, 4, 4, 'Ogrlica je lepa i elegantna, odlicna za posebne prilike.'),
(8, 10, 2, 1, 'Nisu ono sto sam ocekivala');

INSERT INTO proizvodi_u_skladistu (id_skladista, id_proizvoda) 
VALUES 
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(5, 7),
(1, 8),
(2, 9),
(3, 10);

INSERT INTO proizvodi_u_porudzbini (id_porudzbine, id_proizvoda) 
VALUES 
(1, 1),
(2, 3),
(3, 2),
(4, 4),
(5, 6),
(1, 5),
(2, 10),
(3, 8),
(4, 9),
(5, 7);

