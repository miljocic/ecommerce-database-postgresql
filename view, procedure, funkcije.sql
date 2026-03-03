-- View za pregled porudzbine
CREATE VIEW pregled_porudzbine AS
SELECT 
    p.id_porudzbine,
    k.mejl AS korisnik_mejl,
    l.grad AS korisnik_grad,
    ks.naziv AS kurirska_sluzba,
    dc.ime AS distributivni_centar,
    l.adresa AS korisnik_adresa
FROM 
    porudzbina p
JOIN 
    korisnik k ON p.id_korisnika = k.id_korisnika
JOIN 
    slanje_porudzbine sp ON p.id_porudzbine = sp.id_porudzbine
JOIN 
    kurirska_sluzba ks ON sp.id_kurirske_sluzbe = ks.id_kurirske_sluzbe
JOIN 
    distributivni_centar dc ON sp.id_distributivnog_centra = dc.id_distributivnog_centra
JOIN 
    lokacija l ON p.id_lokacije = l.id_lokacije;

select * from pregled_porudzbine


-- View za prikaz proizvoda sa cenama
CREATE VIEW view_proizvodi_sa_cenama AS
SELECT 
    p.id_proizvoda,
    p.naziv AS proizvod_naziv,
    c.iznos AS cena,
    k.naziv AS kategorija
FROM 
    proizvod p
JOIN 
    cena c ON p.id_cena = c.id_cena
JOIN 
    potkategorija pk ON p.id_potkategorije = pk.id_potkategorije
JOIN 
    kategorija k ON pk.id_kategorije = k.id_kategorije;

select * from view_proizvodi_sa_cenama


-- View za prikaz korisnika i sifra porudzbine
CREATE VIEW view_korisnici_porudzbine AS
SELECT 
    k.id_korisnika,
    k.mejl AS korisnik_mejl,
    p.sifra_porudzbine,
    p.id_lokacije,
    l.adresa AS adresa_isporuke
FROM 
    korisnik k
JOIN 
    porudzbina p ON k.id_korisnika = p.id_korisnika
JOIN 
    lokacija l ON p.id_lokacije = l.id_lokacije;

select * from view_korisnici_porudzbine



-- Procedura za dodavanje nove porudzbine
CREATE OR REPLACE PROCEDURE add_order(
    p_id_porudzbine IN INTEGER,  
    p_id_korisnika IN INTEGER,
    p_sifra_porudzbine IN VARCHAR,
    p_id_lokacije IN INTEGER
)
LANGUAGE plpgsql
AS 
$$
BEGIN
    INSERT INTO porudzbina (id_porudzbine, id_korisnika, sifra_porudzbine, id_lokacije)
    VALUES (p_id_porudzbine, p_id_korisnika, p_sifra_porudzbine, p_id_lokacije);
END;
$$;


CALL add_order(p_id_porudzbine := 6, p_id_korisnika := 1, p_sifra_porudzbine := 'HSY938', p_id_lokacije := 1);

select * from porudzbina

-- Procedura za azuriranje podataka
CREATE OR REPLACE PROCEDURE update_order_shipping(
    p_id_porudzbine IN INTEGER,
    p_id_kurirske_sluzbe IN INTEGER,
    p_id_distributivnog_centra IN INTEGER
)
LANGUAGE plpgsql
AS 
$$
BEGIN
    UPDATE slanje_porudzbine
    SET 
        id_kurirske_sluzbe = p_id_kurirske_sluzbe,
        id_distributivnog_centra = p_id_distributivnog_centra
    WHERE id_porudzbine = p_id_porudzbine;
END;
$$;

CALL update_order_shipping(1, 5, 1);

select * from slanje_porudzbine where id_porudzbine=1;


-- Funkcija za izracunavanje prosecne ocene proizvoda
CREATE OR REPLACE FUNCTION avg_product_rating(p_id_proizvoda INTEGER)
RETURNS NUMERIC AS
$$
DECLARE
    v_avg_rating NUMERIC;
BEGIN
     SELECT ROUND(AVG(r.ocena), 2) 
    INTO v_avg_rating
    FROM recenzija r
    WHERE r.id_proizvoda = p_id_proizvoda;

    RETURN v_avg_rating;
END;
$$ LANGUAGE plpgsql;

select avg_product_rating(5);


-- Funkcija za brojanje porudzbina korisnika
CREATE OR REPLACE FUNCTION count_user_orders(p_id_korisnika INTEGER)
RETURNS INTEGER AS
$$
DECLARE
    v_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM porudzbina p
    WHERE p.id_korisnika = p_id_korisnika;

    RETURN v_count;
END;
$$ LANGUAGE plpgsql;

select count_user_orders(1);
